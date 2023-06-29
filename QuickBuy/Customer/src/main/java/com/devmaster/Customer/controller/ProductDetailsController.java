package com.devmaster.Customer.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.devmaster.Customer.ultils.MoneyFormatUtils;
import com.devmaster.Library.model.Customer;
import com.devmaster.Library.model.Image;
import com.devmaster.Library.model.Product;
import com.devmaster.Library.model.ProductColor;
import com.devmaster.Library.model.ProductSize;
import com.devmaster.Library.model.ShoppingCartItem;
import com.devmaster.Library.service.impl.ImageServiceImpl;
import com.devmaster.Library.service.impl.ProductColorServiceImpl;
import com.devmaster.Library.service.impl.ProductServiceImpl;
import com.devmaster.Library.service.impl.ProductSizeServiceImpl;
import com.devmaster.Library.service.impl.ShoppingCartItemServiceImpl;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProductDetailsController {

	// repository product
	@Autowired
	private ProductServiceImpl productService;

	// repository productcolor
	@Autowired
	private ProductColorServiceImpl colorService;

	// reposiroty product size
	@Autowired
	private ProductSizeServiceImpl sizeService;

	@Autowired
	// reposiroty image product
	private ImageServiceImpl imageService;

	@Autowired
	private ShoppingCartItemServiceImpl shoppingCartItemService;

	@Autowired
	private HttpSession session;

	@GetMapping("product-detail")
	public String productDetail(Model model, @RequestParam("product-id") int productID) {
		
		
		

		// Load Product By ProductID
		Product product = new Product();
		product = productService.findById(productID).get();
		product.setFormatPrice(MoneyFormatUtils.formatVnd(product.getPrice()));
		
		model.addAttribute("product", product);
		
		List<Product> products = productService.getByCategory(product.getCategory().getCategoryID());
		
		
		List<String> priceCartItems = new ArrayList<>();
		// format tiền
		for (int i = 0; i < products.size(); i++) {
			priceCartItems.add(MoneyFormatUtils.formatVnd(products.get(i).getPrice()));
			products.get(i).setFormatPrice(priceCartItems.get(i));
		}
		
		model.addAttribute("products", products);

		// Load Color By ProductID
		List<ProductColor> productColors = colorService.findById(productID);
		model.addAttribute("productColors", productColors);

		// Load Size By ProductID
		List<ProductSize> productSizes = sizeService.findById(productID);
		model.addAttribute("productSizes", productSizes);

		// Load Image By ProductID
		List<Image> images = imageService.findById(productID);
		model.addAttribute("images", images);

		Customer customer = (Customer) session.getAttribute("acc");
		if (customer != null) {
			// get total number of products in cart
			int countCartItem = shoppingCartItemService.getCountCartItem(customer.getCustomerID());
			model.addAttribute("numberOfProducts", countCartItem);

			// load the products by CustomerID
			List<ShoppingCartItem> shoppingCarts = shoppingCartItemService.findByCustomerID(customer.getCustomerID());
			
			List<String> priceCartItem = new ArrayList<>();
			// dùng vòng lập để duyệt qua các sản phẩm để format tiền
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

		return "page/product-detail";
	}

}
