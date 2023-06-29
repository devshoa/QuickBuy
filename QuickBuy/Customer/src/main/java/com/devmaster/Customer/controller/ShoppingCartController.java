package com.devmaster.Customer.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.devmaster.Customer.ultils.MoneyFormatUtils;
import com.devmaster.Library.model.Customer;
import com.devmaster.Library.model.Product;
import com.devmaster.Library.model.ProductColor;
import com.devmaster.Library.model.ProductSize;
import com.devmaster.Library.model.ShoppingCart;
import com.devmaster.Library.model.ShoppingCartItem;
import com.devmaster.Library.repository.ShoppingCartItemRepository;
import com.devmaster.Library.service.impl.ProductColorServiceImpl;
import com.devmaster.Library.service.impl.ProductServiceImpl;
import com.devmaster.Library.service.impl.ProductSizeServiceImpl;
import com.devmaster.Library.service.impl.ShoppingCartItemServiceImpl;
import com.devmaster.Library.service.impl.ShoppingCartServiceImpl;

import jakarta.servlet.http.HttpSession;
import jakarta.websocket.server.PathParam;

@Controller
public class ShoppingCartController {

	@Autowired
	private ShoppingCartItemServiceImpl shoppingCartItemService;

	@Autowired
	private ShoppingCartItemRepository cartItemRepository;

	@Autowired
	private ShoppingCartServiceImpl cartService;

	// repository product
	@Autowired
	private ProductServiceImpl productService;

	@Autowired
	private ProductSizeServiceImpl productSizeService;

	@Autowired
	private ProductColorServiceImpl productColorService;

	@Autowired
	private HttpSession session;

	@GetMapping("cart")
	public String cart(Model model) {

		Customer customer = (Customer) session.getAttribute("acc");
		if (customer != null) {

			// get total number of products in cart
			int countCartItem = shoppingCartItemService.getCountCartItem(customer.getCustomerID());
			model.addAttribute("numberOfProducts", countCartItem);

			// load the products by CustomerID
			List<ShoppingCartItem> shoppingCarts = shoppingCartItemService.findByCustomerID(customer.getCustomerID());
			if(shoppingCarts.isEmpty()) {
				model.addAttribute("errCartEmpty", "Bạn chưa có bất kỳ sản phẩm nào trong giỏ hàng");
				return "page/cart";
			}
			
			// List này sẽ chứa danh sách tiền sau khi format
			List<String> priceCartItem = new ArrayList<>();
			// dùng vòng lặp để format tiền trong vỏ hàng
			for (int i = 0; i < shoppingCarts.size(); i++) {
				priceCartItem.add(MoneyFormatUtils.formatVnd(shoppingCarts.get(i).getProduct().getPrice()));
				shoppingCarts.get(i).getProduct().setFormatPrice(priceCartItem.get(i));
			}
			
			model.addAttribute("shoppingCarts", shoppingCarts);

			double total = 0;

			for (int i = 0; i < shoppingCarts.size(); i++) {
				total = shoppingCarts.get(i).getQuantity() * shoppingCarts.get(i).getProduct().getPrice();
			}

			model.addAttribute("totals", MoneyFormatUtils.formatVnd(total));

		}
		return "page/cart";

	}

	@PostMapping("add-to-cart")
	public String addToCart(RedirectAttributes attributes, Model model, @PathParam("color") Optional<Integer> color,
			@PathParam("size") Optional<Integer> size, @PathParam("quantity") Optional<Integer> quantity,
			@RequestParam("product-id") Optional<Integer> productID) {

		System.out.println("SL: " + quantity.get());
		
		// check khách hàng có nhập số lượng sản phẩm lớn hơn số lượng sản
		// phẩm của size đó hay không
		int quantitySize = productSizeService.getQuantityByProductIdAndSizeId(productID.get(), size.get());
		if (quantity.get() > quantitySize) {
			attributes.addFlashAttribute("err",
					"Số lượng sản phẩm của bạn đã vượt quá số lượng sản phẩm theo kích thước");
			return "redirect:/product-detail?product-id=" + productID.get();
		}

		// Get ID customer
		Customer customer = (Customer) session.getAttribute("acc");
		int customerID = customer.getCustomerID();

		// kiểm tra khách hàng đó đã có trong shoppingcart chưa nếu chưa thì
		// thêm vào
		ShoppingCart shopping = cartService.findById(customerID);

		if (shopping == null) {
			// thêm khách hàng vào shoppingcart
			ShoppingCart cart = new ShoppingCart();
			cart.setCustomer(customer);
			cartService.save(cart);
		}

		// lấy ra shopingcartid của khách hàng
		ShoppingCart shoppingCart = cartService.getShoppingCartIDByCustomerID(customerID);

		// Lấy ra sản phẩm mà khách hàng đó vừa thêm vào vỏ hàng
		Product product = productService.getProductByID(productID.get());

		// Lấy ra màu sắc theo sản phầm và theo id của sản phẩm
		ProductColor productColor = productColorService.getColorByProductID(productID.get(), color.get());

		// Lấy ra size theo id của sản phẩm
		ProductSize productSize = productSizeService.getProductSizeByProductID(productID.get(), size.get());

		// Khi thêm sản phẩm thì kiểm tra xem người dùng đó đã thêm sản phẩm
		// đó vào giở hàng hay chưa
		// nếu người dùng đã thêm vào rồi thì cập nhật lại số lượng
		// nếu chưa thì thêm mới acc
		// nếu sản phẩm mà khách hàng vừa thêm vào giỏ hàng có màu id và
		// size id = nhau thì cập nhật số lượng
		ShoppingCartItem shoppingCartItem = shoppingCartItemService
				.getProductByProductIdAndShoppingCartIdProductColorIdProductSizeId(customerID, productID.get(),
						shoppingCart.getShoppingCartDd(), color.get(), size.get());

		if (shoppingCartItem != null) {

			System.out.println((shoppingCartItem.getQuantity() + 1));
			if (shoppingCartItem.getQuantity() + 1 > quantitySize) {
				attributes.addFlashAttribute("err",
						"Số lượng sản phẩm của bạn đã vượt quá số lượng sản phẩm theo kích thước");
				return "redirect:/product-detail?product-id=" + productID.get();
			}

			// cập nhật số lượng
			ShoppingCartItem cartItem = new ShoppingCartItem();
			cartItem.setShoppingCartItemID(shoppingCartItem.getShoppingCartItemID());
			cartItem.setShoppingCart(shoppingCartItem.getShoppingCart());
			cartItem.setProduct(shoppingCartItem.getProduct());
			cartItem.setProductColor(shoppingCartItem.getProductColor());
			cartItem.setProductSize(shoppingCartItem.getProductSize());
			cartItem.setQuantity(quantity.get() + shoppingCartItem.getQuantity());

			shoppingCartItemService.save(cartItem);

		} else if (shoppingCartItem == null) {

			ShoppingCartItem cartItem = new ShoppingCartItem();
			// shoppingCartID là id của bản shoppingCart
			cartItem.setShoppingCart(shoppingCart);
			cartItem.setProduct(product);
			cartItem.setProductColor(productColor);
			cartItem.setProductSize(productSize);
			cartItem.setQuantity(quantity.get());

			shoppingCartItemService.save(cartItem);
		}

		return "redirect:/cart";
	}

	@PostMapping("delete-cart-item")
	public String deleteCartItem(@RequestParam("shopping-cart-item-id") int shoppingCartItemId) {


		cartItemRepository.deleteById(shoppingCartItemId);

		return "redirect:/cart";
	}

}
