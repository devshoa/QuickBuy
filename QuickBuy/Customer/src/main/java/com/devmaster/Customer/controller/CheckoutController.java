package com.devmaster.Customer.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.devmaster.Customer.service.PaypalService;
import com.devmaster.Customer.ultils.MoneyFormatUtils;
import com.devmaster.Library.model.AddressCustomer;
import com.devmaster.Library.model.Customer;
import com.devmaster.Library.model.Order;
import com.devmaster.Library.model.OrderDetails;
import com.devmaster.Library.model.OrderHistory;
import com.devmaster.Library.model.OrderStatus;
import com.devmaster.Library.model.PaymentMethod;
import com.devmaster.Library.model.ShoppingCartItem;
import com.devmaster.Library.service.impl.AddressCustomerServiceImpl;
import com.devmaster.Library.service.impl.OrderDetailsServiceImpl;
import com.devmaster.Library.service.impl.OrderHistoryServiceImpl;
import com.devmaster.Library.service.impl.OrderServiceImpl;
import com.devmaster.Library.service.impl.OrderStatusServiceImpl;
import com.devmaster.Library.service.impl.PaymentMethodServiceImpl;
import com.devmaster.Library.service.impl.ProductServiceImpl;
import com.devmaster.Library.service.impl.ShoppingCartItemServiceImpl;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;

import jakarta.servlet.http.HttpSession;
import jakarta.websocket.server.PathParam;

@Controller
public class CheckoutController {

	@Autowired
	PaypalService service;

	public static final String SUCCESS_URL = "dash-my-order";
	public static final String CANCEL_URL = "checkout";

	@Autowired
	private ShoppingCartItemServiceImpl shoppingCartItemService;

	@Autowired
	private AddressCustomerServiceImpl addressCustomerService;

	@Autowired
	private PaymentMethodServiceImpl paymentMethodService;

	@Autowired
	private OrderServiceImpl orderService;

	@Autowired
	private ProductServiceImpl productService;

	@Autowired
	private OrderStatusServiceImpl orderStatusService;

	@Autowired
	private OrderDetailsServiceImpl orderDetailsService;

	@Autowired
	private OrderHistoryServiceImpl orderHistoryService;

	@Autowired
	private HttpSession session;

	@GetMapping("checkout")
	public String checkout(RedirectAttributes redirectAttributes, Model model) {

		// load paymentMethod
		List<PaymentMethod> paymentMethods = paymentMethodService.findAll();
		model.addAttribute("payments", paymentMethods);

		List<Integer> shoppingCartID = (List<Integer>) session.getAttribute("keyproductcartid");

		if (shoppingCartID != null) {

			List<ShoppingCartItem> cartItems = new ArrayList<>();

			int quantity = 0;

			for (int i = 0; i < shoppingCartID.size(); i++) {
				ShoppingCartItem items = new ShoppingCartItem();
				items = shoppingCartItemService.findByShoppingCartByShoppingCartID(shoppingCartID.get(i));
				quantity += items.getQuantity();
				cartItems.add(items);
			}

			model.addAttribute("quantitys", quantity);

			model.addAttribute("shoppingCarts", cartItems);

			double total = 0;

			// dùng vòng lập để duyệt qua các sản phẩm để format tiền
			List<String> priceCartItem = new ArrayList<>();
			for (int i = 0; i < cartItems.size(); i++) {
				total += cartItems.get(i).getQuantity() * cartItems.get(i).getProduct().getPrice();
				priceCartItem.add(MoneyFormatUtils.formatVnd(cartItems.get(i).getProduct().getPrice()));
				cartItems.get(i).getProduct().setFormatPrice(priceCartItem.get(i));
			}

			model.addAttribute("totals", MoneyFormatUtils.formatVnd(total));
			model.addAttribute("totalsUSD", MoneyFormatUtils.vndToUsd(total));
			model.addAttribute("noFormat", total);

		} else {
			// nếu như người dùng không chọn productID thì lấy ra tất cả các sản
			// phẩm mà người dùng
			// đó đã thêm vào giỏ hàng và thanh toán nếu không có sản phẩm nào
			// trong giỏ hàng
			// thì báo lỗi

			Customer customer = (Customer) session.getAttribute("acc");
			if (customer == null) {
				return "redirect:/signin";
			}
			int customerID = customer.getCustomerID();
			List<ShoppingCartItem> shoppingCartItems = shoppingCartItemService.findByCustomerID(customerID);
			if (shoppingCartItems.isEmpty()) {
				return "redirect:/cart";
			}

			// dùng vòng lập để duyệt qua các sản phẩm để format tiền
			List<String> priceCartItem = new ArrayList<>();
			for (int i = 0; i < shoppingCartItems.size(); i++) {
				priceCartItem.add(MoneyFormatUtils.formatVnd(shoppingCartItems.get(i).getProduct().getPrice()));
				shoppingCartItems.get(i).getProduct().setFormatPrice(priceCartItem.get(i));
			}

			model.addAttribute("shoppingCarts", shoppingCartItems);

			double total = 0;
			int quantity = 0;
			for (int i = 0; i < shoppingCartItems.size(); i++) {
				total += shoppingCartItems.get(i).getQuantity() * shoppingCartItems.get(i).getProduct().getPrice();
				quantity += shoppingCartItems.get(i).getQuantity();
			}

			model.addAttribute("totals", MoneyFormatUtils.formatVnd(total));
			model.addAttribute("quantitys", quantity);
			model.addAttribute("totalsUSD", MoneyFormatUtils.vndToUsd(total));
			model.addAttribute("noFormat", total);

		}

		String addressID = (String) session.getAttribute("addressID");
		// lấy ra địa chỉ mà người dùng đã chọn theo addressID
		if (addressID != null) {

			int id = Integer.parseInt(addressID);

			Customer cusstomer = (Customer) session.getAttribute("acc");

			AddressCustomer addressCustomer = addressCustomerService.getAddressByAddressID(id,
					cusstomer.getCustomerID());

			model.addAttribute("addressID", addressCustomer);
		}

		Customer customer = (Customer) session.getAttribute("acc");
		if (customer != null) {

			// Lấy ra địa chỉ của khách hàng
			int customerID = customer.getCustomerID();

			model.addAttribute("customer", customer);

			// Get address by CustomerID đây sẽ là địa chỉ mặc định
			List<AddressCustomer> addressCustomer = addressCustomerService.findAddressByCustomerID(customerID);
			model.addAttribute("listAddress", addressCustomer);

			// get total number of products in cart
			int countCartItem = shoppingCartItemService.getCountCartItem(customer.getCustomerID());
			model.addAttribute("numberOfProducts", countCartItem);

			// dùng vòng lặp để lấy ra tổng số lượng sản phẩm

		} else {
			return "redirect:/signin";
		}

		return "page/checkout";
	}

	@PostMapping("add-address")
	public String addAddress(@PathParam("customerName") String customerName, @PathParam("phone") String phone,
			@PathParam("address") String address) {

		Customer customer = (Customer) session.getAttribute("acc");

		// tiến hàng lưu vào address
		AddressCustomer addressCustomer = new AddressCustomer();
		addressCustomer.setCustomer(customer);
		addressCustomer.setDetailedAddress(address);
		addressCustomer.setPhoneNumber(phone);
		addressCustomer.setCustomerName(customerName);

		addressCustomerService.save(addressCustomer);

		return "redirect:/checkout";
	}

	@PostMapping("save-address")
	public String saveAddress(@RequestParam("address") Optional<String> addressID) {

		session.setAttribute("addressID", addressID.get());

		return "redirect:/checkout";
	}

	@PostMapping("delete-product-checkout")
	public String deleteProductCheckout(@RequestParam("shopping-cart-item-id") Optional<Integer> shoppingCartItemId) {
		int shopppingCartItemID = shoppingCartItemId.get();

		return "redirect:/checkout";
	}

	@PostMapping("add-product-to-checkout")
	public String addProductToCheckout(@RequestParam("productcartid") Optional<List<Integer>> productcartid) {

		if (!productcartid.isPresent()) {
			session.removeAttribute("keyproductcartid");
			return "redirect:/checkout";
		} else {
			session.setAttribute("keyproductcartid", productcartid.get());
			return "redirect:/checkout";
		}
	}

	@PostMapping("checkout/{totalsUSD}/{totals}/{quantitys}")
	public String checkout(RedirectAttributes redirectAttributes, @PathVariable("totalsUSD") double totalsUSD,
			@PathVariable("totals") double totals, @PathVariable("quantitys") int quantity,
			@RequestParam("payment") Optional<Integer> payment) throws ParseException {

		if (payment.isEmpty()) {
			redirectAttributes.addFlashAttribute("errpayment", "Vui lòng chọn một địa chỉ thanh toán");
			return "redirect:/checkout";
		} else {
			int paymentMethodID = payment.get();
			PaymentMethod method = paymentMethodService.findByPaymentMethodID(paymentMethodID);
			String paymentName = method.getPaymentName();

			if (paymentName.contains("Pay Pal")) {
				try {
					System.out.println("USD: " + totalsUSD);
					Payment payments = service.createPayment(totalsUSD, "USD", "paypal", "order",
							"http://localhost:8080/" + CANCEL_URL, "http://localhost:8080/" + SUCCESS_URL);
					for (Links link : payments.getLinks()) {
						if (link.getRel().equals("approval_url")) {

							// tiếng hành lưu khách hàng vào bảng Order trước sau đó là bảng
							// orderdetails
							Customer customer = (Customer) session.getAttribute("acc");

							// lấy ra ngày g hiện tại
							Date date = new Date();
							SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
							String dateNow = sdf.format(date);

							Date df = sdf.parse(dateNow);

							// lấy ra tổng tiền
							double total = totals;

							Order order = new Order();
							order.setCustomer(customer);
							order.setOrderDate(df);
							order.setTotalMoney(total);
							order.setPaymentMethod(method);

							orderService.save(order);

							// tiếng hành lưu bảng details
							// lấy ra Đối tượng order mà mình vừa thêm

							// lấy ra tất cả Product của các sản phẩm là 1 list produt mà người
							// dùng chọn thanh toán
							List<Integer> productID = (List<Integer>) session.getAttribute("keyproductcartid");

							if (productID != null) {

								List<ShoppingCartItem> products = new ArrayList<>();

								for (int i = 0; i < productID.size(); i++) {
									ShoppingCartItem items = new ShoppingCartItem();
									items = shoppingCartItemService
											.findByShoppingCartByShoppingCartID(productID.get(i));
									// tiếng hành remove sản phẩm
									shoppingCartItemService.deleteShoppingCartItem(items.getShoppingCartItemID());
									products.add(items);
								}

								// dùng vòng lặp duyệt qua các shoppingcartproducs để lấy ra productID;
								for (int i = 0; i < products.size(); i++) {
									// lấy ra sản phẩm theo productID
									OrderDetails details = new OrderDetails();
									details.setOrder(order);
									details.setProduct(
											productService.getProductByID(products.get(i).getProduct().getProductID()));
									details.setQuantity(quantity);
									details.setUnitPrice(productService
											.getProductPriceByID(products.get(i).getProduct().getProductID()));
									orderDetailsService.save(details);
								}

							}

							// khi người dùng chọn phương thức thanh toán và thanh toán thành công
							// thì sẽ lưu vào bảng order history
							// lấy ra orderstatus

							// lấy ra OrderStatus theo name
							OrderStatus orderStatus = orderStatusService
									.findAllOrderStatusByOrderStatusName("Đang chờ xác nhận");

							OrderHistory orderHistory = new OrderHistory();
							orderHistory.setOrderStatus(orderStatus);
							orderHistory.setStatus_date(df);
							orderHistory.setOrder(order);
							orderHistoryService.save(orderHistory);

							session.removeAttribute("keyproductcartid");

							return "redirect:" + link.getHref();
						}
					}

				} catch (PayPalRESTException e) {

					e.printStackTrace();
				}
			} else {

				// tiếng hành lưu khách hàng vào bảng Order trước sau đó là bảng
				// orderdetails
				Customer customer = (Customer) session.getAttribute("acc");

				// lấy ra ngày g hiện tại
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
				String dateNow = sdf.format(date);

				Date df = sdf.parse(dateNow);

				// lấy ra tổng tiền
				double total = totals;

				Order order = new Order();
				order.setCustomer(customer);
				order.setOrderDate(df);
				order.setTotalMoney(total);
				order.setPaymentMethod(method);

				orderService.save(order);

				// tiếng hành lưu bảng details
				// lấy ra Đối tượng order mà mình vừa thêm

				// lấy ra tất cả Product của các sản phẩm là 1 list produt mà người
				// dùng chọn thanh toán
				List<Integer> productID = (List<Integer>) session.getAttribute("keyproductcartid");

				if (productID != null) {

					List<ShoppingCartItem> products = new ArrayList<>();

					for (int i = 0; i < productID.size(); i++) {
						ShoppingCartItem items = new ShoppingCartItem();
						items = shoppingCartItemService.findByShoppingCartByShoppingCartID(productID.get(i));
						// tiếng hành remove sản phẩm
						shoppingCartItemService.deleteShoppingCartItem(items.getShoppingCartItemID());
						products.add(items);
					}

					// dùng vòng lặp duyệt qua các shoppingcartproducs để lấy ra productID;
					for (int i = 0; i < products.size(); i++) {
						// lấy ra sản phẩm theo productID
						OrderDetails details = new OrderDetails();
						details.setOrder(order);
						details.setProduct(productService.getProductByID(products.get(i).getProduct().getProductID()));
						details.setQuantity(quantity);
						details.setUnitPrice(
								productService.getProductPriceByID(products.get(i).getProduct().getProductID()));
						orderDetailsService.save(details);
					}

				}

				// khi người dùng chọn phương thức thanh toán và thanh toán thành công
				// thì sẽ lưu vào bảng order history
				// lấy ra orderstatus

				// lấy ra OrderStatus theo name
				OrderStatus orderStatus = orderStatusService
						.findAllOrderStatusByOrderStatusName("Đang chờ xác nhận");

				OrderHistory orderHistory = new OrderHistory();
				orderHistory.setOrderStatus(orderStatus);
				orderHistory.setStatus_date(df);
				orderHistory.setOrder(order);
				orderHistoryService.save(orderHistory);

				session.removeAttribute("keyproductcartid");

			}
		}

		return "redirect:/dash-my-order";
	}

}
