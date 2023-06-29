package com.devmaster.Customer.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.devmaster.Customer.ultils.MoneyFormatUtils;
import com.devmaster.Library.dto.AddressDto;
import com.devmaster.Library.dto.CustomerDto;
import com.devmaster.Library.model.AddressCustomer;
import com.devmaster.Library.model.Customer;
import com.devmaster.Library.model.OrderDetails;
import com.devmaster.Library.model.OrderHistory;
import com.devmaster.Library.model.ShoppingCartItem;
import com.devmaster.Library.service.impl.AddressCustomerServiceImpl;
import com.devmaster.Library.service.impl.CustomerServiceImpl;
import com.devmaster.Library.service.impl.OrderDetailsServiceImpl;
import com.devmaster.Library.service.impl.OrderHistoryServiceImpl;
import com.devmaster.Library.service.impl.ShoppingCartItemServiceImpl;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class DashBoardController {

	@Autowired
	private ShoppingCartItemServiceImpl shoppingCartItemService;

	@Autowired
	private CustomerServiceImpl customerService;

	@Autowired
	private AddressCustomerServiceImpl addressCustomerService;

	@Autowired
	private OrderHistoryServiceImpl orderHistoryService;

	@Autowired
	private OrderDetailsServiceImpl orderDetailsService;

	@Autowired
	private HttpSession session;

	@GetMapping("dashboard")
	public String dashboard(Model model) {
		// kiểm tra người dùng dã login chưa
		Customer customer = (Customer) session.getAttribute("acc");
		if (customer == null) {
			return "redirect:/signin";
		} else {

			// get total number of products in cart
			int countCartItem = shoppingCartItemService.getCountCartItem(customer.getCustomerID());
			model.addAttribute("numberOfProducts", countCartItem);

			// load the products by CustomerID
			List<ShoppingCartItem> shoppingCarts = shoppingCartItemService.findByCustomerID(customer.getCustomerID());
			model.addAttribute("shoppingCarts", shoppingCarts);
			double total = 0;

			for (int i = 0; i < shoppingCarts.size(); i++) {
				total = shoppingCarts.get(i).getQuantity() * shoppingCarts.get(i).getProduct().getPrice();
			}

			model.addAttribute("totals", total);

			// lấy ra thông tin của khách hàng
			model.addAttribute("customer", customer);

			return "page/dashboard";
		}
	}

	@GetMapping("dash-my-order")
	public String dashMyOrder(Model model) {
		// kiểm tra người dùng dã login chưa
		Customer customer = (Customer) session.getAttribute("acc");
		if (customer == null) {
			return "redirect:/signin";
		} else {
			// get total number of products in cart
			int countCartItem = shoppingCartItemService.getCountCartItem(customer.getCustomerID());
			model.addAttribute("numberOfProducts", countCartItem);

			// load the products by CustomerID
			List<ShoppingCartItem> shoppingCarts = shoppingCartItemService.findByCustomerID(customer.getCustomerID());

			double total = 0;

			List<String> priceCartItem = new ArrayList<>();
			// dùng vòng lập để duyệt qua các sản phẩm để format tiền
			for (int i = 0; i < shoppingCarts.size(); i++) {
				total += shoppingCarts.get(i).getQuantity() * shoppingCarts.get(i).getProduct().getPrice();
				priceCartItem.add(MoneyFormatUtils.formatVnd(shoppingCarts.get(i).getProduct().getPrice()));
				shoppingCarts.get(i).getProduct().setFormatPrice(priceCartItem.get(i));
			}

		
			model.addAttribute("totals", MoneyFormatUtils.formatVnd(total));
			model.addAttribute("shoppingCarts", shoppingCarts);

			// Lấy order Details theo customer
			List<OrderDetails> orderDetails = orderDetailsService
					.findOrderDetailsByCustomerID(customer.getCustomerID());
			
			List<String> totals = new ArrayList<>();
			// format tổng tiền
			for (int i = 0; i < orderDetails.size(); i++) {
				totals.add(MoneyFormatUtils.formatVnd(orderDetails.get(i).getOrder().getTotalMoney()))  ;
				orderDetails.get(i).getOrder().setTotalMoneyFormat(totals.get(i));
			}

			model.addAttribute("orderDetails", orderDetails);

			return "page/dash-my-order";

		}
	}

	@GetMapping("dash-edit-profile")
	public String dashEditProfile(@ModelAttribute("customerDto") CustomerDto ct, Model model) {

		// kiểm tra người dùng dã login chưa
		Customer customer = (Customer) session.getAttribute("acc");
		if (customer == null) {
			return "redirect:/signin";
		} else {

			// load data
			ct.setCustomerName(customer.getCustomerName());
			ct.setAddress(customer.getAddress());
			ct.setEmail(customer.getEmail());
			ct.setPhone(customer.getPhone());

			// get total number of products in cart
			int countCartItem = shoppingCartItemService.getCountCartItem(customer.getCustomerID());
			model.addAttribute("numberOfProducts", countCartItem);

			// load the products by CustomerID
			List<ShoppingCartItem> shoppingCarts = shoppingCartItemService.findByCustomerID(customer.getCustomerID());
			model.addAttribute("shoppingCarts", shoppingCarts);
			double total = 0;

			for (int i = 0; i < shoppingCarts.size(); i++) {
				total = shoppingCarts.get(i).getQuantity() * shoppingCarts.get(i).getProduct().getPrice();
			}

			model.addAttribute("totals", total);

			return "page/dash-edit-profile";
		}

	}

	@PostMapping("save-profile")
	public String saveProfile(@Valid @ModelAttribute("customerDto") CustomerDto ct, BindingResult result, Model model) {

		Customer customer = (Customer) session.getAttribute("acc");
		if (customer != null) {
			// get total number of products in cart
			int countCartItem = shoppingCartItemService.getCountCartItem(customer.getCustomerID());
			model.addAttribute("numberOfProducts", countCartItem);

			// load the products by CustomerID
			List<ShoppingCartItem> shoppingCarts = shoppingCartItemService.findByCustomerID(customer.getCustomerID());
			model.addAttribute("shoppingCarts", shoppingCarts);
			double total = 0;

			for (int i = 0; i < shoppingCarts.size(); i++) {
				total = shoppingCarts.get(i).getQuantity() * shoppingCarts.get(i).getProduct().getPrice();
			}

			model.addAttribute("totals", total);
			try {
				if (result.hasErrors()) {
					model.addAttribute("customerDto", ct);
					return "page/dash-edit-profile";
				}

				customer.setCustomerName(ct.getCustomerName());
				customer.setAddress(ct.getAddress());
				customer.setEmail(ct.getEmail());
				customer.setPhone(ct.getPhone());
				// tiếng hành update
				customerService.saveCustomer(customer);

				return "redirect:/dashboard";

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return "page/dash-edit-profile";
	}

	@GetMapping("dash-address-book")
	public String dashAddressBook(Model model) {
		// kiểm tra người dùng dã login chưa
		Customer customer = (Customer) session.getAttribute("acc");
		if (customer == null) {
			return "redirect:/signin";
		} else {
			// get total number of products in cart
			int countCartItem = shoppingCartItemService.getCountCartItem(customer.getCustomerID());
			model.addAttribute("numberOfProducts", countCartItem);

			// load the products by CustomerID
			List<ShoppingCartItem> shoppingCarts = shoppingCartItemService.findByCustomerID(customer.getCustomerID());
			model.addAttribute("shoppingCarts", shoppingCarts);
			double total = 0;

			for (int i = 0; i < shoppingCarts.size(); i++) {
				total = shoppingCarts.get(i).getQuantity() * shoppingCarts.get(i).getProduct().getPrice();
			}

			model.addAttribute("totals", total);

			// lấy ra địa chỉ của khách hàng trong bảng address
			List<AddressCustomer> addressCustomer = addressCustomerService
					.findAddressByCustomerID(customer.getCustomerID());
			model.addAttribute("addressCustomer", addressCustomer);

			model.addAttribute("customer", customer);

		}
		return "page/dash-address-book";
	}

	@GetMapping("dash-address-add")
	public String dashAddressAdd() {
		// kiểm tra người dùng dã login chưa
		Customer customer = (Customer) session.getAttribute("acc");
		if (customer == null) {
			return "redirect:/signin";
		} else {
			// lấy ra những sản phẩm khách hàng đó đã lấy
			return "page/dash-address-add";
		}

	}

	@GetMapping("dash-address-edit")
	public String dashAddressEdit(@ModelAttribute("addressDto") AddressDto addressDto, Model model) {
		// kiểm tra người dùng dã login chưa
		Customer customer = (Customer) session.getAttribute("acc");
		if (customer == null) {
			return "redirect:/signin";
		} else {
			// get total number of products in cart
			int countCartItem = shoppingCartItemService.getCountCartItem(customer.getCustomerID());
			model.addAttribute("numberOfProducts", countCartItem);

			// load the products by CustomerID
			List<ShoppingCartItem> shoppingCarts = shoppingCartItemService.findByCustomerID(customer.getCustomerID());
			model.addAttribute("shoppingCarts", shoppingCarts);
			double total = 0;

			for (int i = 0; i < shoppingCarts.size(); i++) {
				total = shoppingCarts.get(i).getQuantity() * shoppingCarts.get(i).getProduct().getPrice();
			}

			model.addAttribute("totals", total);
			return "page/dash-address-edit";
		}
	}

	@PostMapping("dash-address-edit/{addressID}")
	public String dashAddressEdit(@PathVariable("addressID") int addressID, RedirectAttributes redirectAttributes) {

		Customer customerID = (Customer) session.getAttribute("acc");
		if (customerID == null) {
			return "redirect:/signin";
		}

		// lấy ra địa chỉ khách hàng
		AddressCustomer addressCustomer = addressCustomerService.getAddressByAddressID(addressID,
				customerID.getCustomerID());

		AddressDto addressDto = new AddressDto();

		addressDto.setAddressID(addressID);
		addressDto.setDetailedAddress(addressCustomer.getDetailedAddress());
		addressDto.setPhoneNumber(addressCustomer.getPhoneNumber());
		addressDto.setCustomerName(addressCustomer.getCustomerName());
		addressDto.setEmail(addressCustomer.getEmail());

		redirectAttributes.addFlashAttribute("addressDto", addressDto);

		return "redirect:/dash-address-edit";
	}

	@PostMapping("update-address-customer")
	public String updateAddressCustomer(@Valid @ModelAttribute("addressDto") AddressDto addressDto,
			BindingResult result, Model model) {

		Customer customer = (Customer) session.getAttribute("acc");

		if (customer != null) {
			// get total number of products in cart
			int countCartItem = shoppingCartItemService.getCountCartItem(customer.getCustomerID());
			model.addAttribute("numberOfProducts", countCartItem);

			// load the products by CustomerID
			List<ShoppingCartItem> shoppingCarts = shoppingCartItemService.findByCustomerID(customer.getCustomerID());
			model.addAttribute("shoppingCarts", shoppingCarts);
			double total = 0;

			for (int i = 0; i < shoppingCarts.size(); i++) {
				total = shoppingCarts.get(i).getQuantity() * shoppingCarts.get(i).getProduct().getPrice();
			}

			model.addAttribute("totals", total);
			try {
				if (result.hasErrors()) {
					model.addAttribute("addressDto", addressDto);

					return "page/dash-address-edit";
				}

				// tiếng hành update
				AddressCustomer addressCustomer = new AddressCustomer();

				addressCustomer.setAddressId(addressDto.getAddressID());
				addressCustomer.setCustomer(customer);
				addressCustomer.setDetailedAddress(addressDto.getDetailedAddress());
				addressCustomer.setPhoneNumber(addressDto.getPhoneNumber());
				addressCustomer.setCustomerName(addressDto.getCustomerName());
				addressCustomer.setEmail(addressDto.getEmail());
				addressCustomerService.save(addressCustomer);

				return "redirect:/dashboard";

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return "redirect:/signin";
	}

	@GetMapping("dash-manage-order")
	public String dashManageOrder(Model model, @RequestParam("orderid") int orderID) {
		// kiểm tra người dùng dã login chưa
		Customer customer = (Customer) session.getAttribute("acc");
		if (customer == null) {
			return "redirect:/signin";
		} else {
			// get total number of products in cart
			int countCartItem = shoppingCartItemService.getCountCartItem(customer.getCustomerID());
			model.addAttribute("numberOfProducts", countCartItem);

			// load the products by CustomerID
			List<ShoppingCartItem> shoppingCarts = shoppingCartItemService.findByCustomerID(customer.getCustomerID());
			model.addAttribute("shoppingCarts", shoppingCarts);
			double total = 0;

			for (int i = 0; i < shoppingCarts.size(); i++) {
				total = shoppingCarts.get(i).getQuantity() * shoppingCarts.get(i).getProduct().getPrice();
			}

			model.addAttribute("totals", MoneyFormatUtils.formatVnd(total));

			// lấy orderHistory
			OrderHistory orderHistory = orderHistoryService
					.getOrderHistoryByCustomerIDAndOrderID(customer.getCustomerID(), orderID);

			model.addAttribute("orderhistory", orderHistory);

			// lấy ra orderDetails
			OrderDetails orderDetails = orderDetailsService.findAllOrderDetalByOrderIDAndCustomerID(
					orderHistory.getOrder().getOrderID(), customer.getCustomerID());
			
			// format tiền
			orderDetails.getOrder().setTotalMoneyFormat(MoneyFormatUtils.formatVnd(orderDetails.getOrder().getTotalMoney()));

			model.addAttribute("orderdetails", orderDetails);

			return "page/dash-manage-order";

		}

	}

}
