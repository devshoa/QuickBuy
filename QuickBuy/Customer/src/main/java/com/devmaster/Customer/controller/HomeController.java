package com.devmaster.Customer.controller;

import java.util.ArrayList;
import java.util.List;

import org.antlr.v4.runtime.misc.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.devmaster.Customer.ultils.MoneyFormatUtils;
import com.devmaster.Library.model.Category;
import com.devmaster.Library.model.Customer;
import com.devmaster.Library.model.Product;
import com.devmaster.Library.model.ShoppingCartItem;
import com.devmaster.Library.service.impl.CategoryServiceImpl;
import com.devmaster.Library.service.impl.ProductServiceImpl;
import com.devmaster.Library.service.impl.ShoppingCartItemServiceImpl;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

	// repository product
	@Autowired
	private ProductServiceImpl productService;

	// repository category
	@Autowired
	private CategoryServiceImpl categoryService;

	@Autowired
	private ShoppingCartItemServiceImpl shoppingCartItemService;

	@Autowired
	private HttpSession session;

	@GetMapping("/")
	public String home(Model model) {
		List<Product> product = (List<Product>) productService.findAllProduct();

		List<String> priceCartItem = new ArrayList<>();
		// dùng vòng lập để duyệt qua các sản phẩm để format tiền
		for (int i = 0; i < product.size(); i++) {
			priceCartItem.add(MoneyFormatUtils.formatVnd(product.get(i).getPrice()));
			product.get(i).setFormatPrice(priceCartItem.get(i));
		}

		model.addAttribute("products", product);

		List<Category> categorys = (List<Category>) categoryService.findAllCategory();
		model.addAttribute("categorys", categorys);

		Customer customer = (Customer) session.getAttribute("acc");

		List<Product> latestProducts = productService.getLatestProduct();

		List<String> latestProductsPrice = new ArrayList<>();
		// dùng vòng lập để duyệt qua các sản phẩm để format tiền
		for (int i = 0; i < latestProducts.size(); i++) {
			latestProductsPrice.add(MoneyFormatUtils.formatVnd(latestProducts.get(i).getPrice()));
			latestProducts.get(i).setFormatPrice(latestProductsPrice.get(i));
		}

		model.addAttribute("latestProducts", latestProducts);

		if (customer != null) {

			// get total number of products in cart
			int countCartItem = shoppingCartItemService.getCountCartItem(customer.getCustomerID());
			model.addAttribute("numberOfProducts", countCartItem);

			// load the products by CustomerID
			List<ShoppingCartItem> shoppingCarts = shoppingCartItemService.findByCustomerID(customer.getCustomerID());
			model.addAttribute("shoppingCarts", shoppingCarts);
			double total = 0;

			for (int i = 0; i < shoppingCarts.size(); i++) {
				total += shoppingCarts.get(i).getQuantity() * shoppingCarts.get(i).getProduct().getPrice();

			}

			model.addAttribute("totals", MoneyFormatUtils.formatVnd(total));

		}

		return "index";
	}

	@GetMapping("shop-side-version-2")
	public String shopSideversion(Model model) {

		List<Product> product = (List<Product>) productService.findAllProduct();

		List<String> priceCartItem = new ArrayList<>();
		// dùng vòng lập để duyệt qua các sản phẩm để format tiền
		for (int i = 0; i < product.size(); i++) {
			priceCartItem.add(MoneyFormatUtils.formatVnd(product.get(i).getPrice()));
			product.get(i).setFormatPrice(priceCartItem.get(i));
		}

		model.addAttribute("products", product);

		List<Category> categorys = (List<Category>) categoryService.findAllCategory();
		model.addAttribute("categorys", categorys);

		Customer customer = (Customer) session.getAttribute("acc");

		List<Product> latestProducts = productService.getLatestProduct();

		List<String> latestProductsPrice = new ArrayList<>();
		// dùng vòng lập để duyệt qua các sản phẩm để format tiền
		for (int i = 0; i < latestProducts.size(); i++) {
			latestProductsPrice.add(MoneyFormatUtils.formatVnd(latestProducts.get(i).getPrice()));
			latestProducts.get(i).setFormatPrice(latestProductsPrice.get(i));
		}

		model.addAttribute("latestProducts", latestProducts);

		if (customer != null) {

			// get total number of products in cart
			int countCartItem = shoppingCartItemService.getCountCartItem(customer.getCustomerID());
			model.addAttribute("numberOfProducts", countCartItem);

			// load the products by CustomerID
			List<ShoppingCartItem> shoppingCarts = shoppingCartItemService.findByCustomerID(customer.getCustomerID());
			model.addAttribute("shoppingCarts", shoppingCarts);
			double total = 0;

			for (int i = 0; i < shoppingCarts.size(); i++) {
				total += shoppingCarts.get(i).getQuantity() * shoppingCarts.get(i).getProduct().getPrice();

			}

			model.addAttribute("totals", MoneyFormatUtils.formatVnd(total));

		}
		return "page/shop-side-version-2";
	}

	@GetMapping("lost-password")
	public String lostPassword() {

		return "page/lost-password";
	}

}
