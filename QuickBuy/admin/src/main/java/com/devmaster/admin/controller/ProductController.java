package com.devmaster.admin.controller;



import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.devmaster.Library.dto.ProductDto;
import com.devmaster.Library.model.Color;
import com.devmaster.Library.model.Customer;
import com.devmaster.Library.model.Image;
import com.devmaster.Library.model.Product;
import com.devmaster.Library.model.ProductColor;
import com.devmaster.Library.model.ProductSize;
import com.devmaster.Library.model.ShoppingCartItem;
import com.devmaster.Library.model.Size;
import com.devmaster.Library.repository.BrandRepository;
import com.devmaster.Library.repository.CategoryRepository;
import com.devmaster.Library.repository.ColorRepository;
import com.devmaster.Library.repository.ProductColorRepository;
import com.devmaster.Library.repository.ProductRepository;
import com.devmaster.Library.repository.ProductSizeRepository;
import com.devmaster.Library.repository.SizeRepository;


import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("admin")
public class ProductController {
	@Autowired
	ProductRepository dao;
	
	@Autowired
	CategoryRepository cadao;
	
	@Autowired
	BrandRepository bdao;
	
	@Autowired
	ProductColorRepository pcdao;
	
	
	
	@Autowired
	ColorRepository cdao;
	
	@Autowired
	ProductSizeRepository psdao;
	
	@Autowired
	SizeRepository sdao;
	
	@Autowired
	private ServletContext app;
	
	@Autowired
	private HttpSession session;
	
//Sửa giúp tui phần cập nhật sp với lưu
	
	@RequestMapping("product")
	public String index(Model model) {	
		
		model.addAttribute("item", new Product());
		model.addAttribute("items", dao.findAll());
		
		
		return "admin/product";
	}
	
	@ModelAttribute("category")
	public Map<Integer, String> getCategory() {
		Map<Integer, String> map = new HashMap<Integer, String>();
		for (int i = 0; i < cadao.findAll().size(); i++) {
			map.put(cadao.findAll().get(i).getCategoryID(), cadao.findAll().get(i).getCategoryName());
		}
		return map;
	}
	
	@RequestMapping("product/create")
	public String create(@Validated @ModelAttribute("item") ProductDto productDTO, Product product, BindingResult br,
			RedirectAttributes ra, @Parameter(name = "category") Integer productID, Model model,
			@Parameter(name = "image") MultipartFile image)
			throws IllegalAccessException, InvocationTargetException, ParseException {
		try {
			File file = new File(app.getRealPath("/img/products/" + image.getOriginalFilename()));
			image.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		BeanUtils.copyProperties(product, productDTO);
		if (image != null && !image.getOriginalFilename().isEmpty()) {
			product.setImage(productDTO.getImage() .getOriginalFilename());
		} else {
			product.setImage("noavt.png");
		}
		//product.setProductID(productID);
		dao.save(product);
		ra.addFlashAttribute("message", "Save product is successfuly !");
		return "redirect:/admin/product";
	}
	
	@RequestMapping("product/update")
	public String update(@Validated @ModelAttribute("item") ProductDto productDTO, Product product, BindingResult br,
			RedirectAttributes ra, @Parameter(name = "category") Integer productID, Model model,
			@Parameter(name = "image") MultipartFile image)
			throws IllegalAccessException, InvocationTargetException, ParseException {
		try {
			File file = new File(app.getRealPath("/img/products/" + image.getOriginalFilename()));
			image.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		BeanUtils.copyProperties(product, productDTO);
		if (image != null && !image.getOriginalFilename().isEmpty()) {
			product.setImage(productDTO.getImage() .getOriginalFilename());
		} else {
			product.setImage("noavt.png");
		}
		//product.setProductID(productID);
		dao.save(product);
		ra.addFlashAttribute("message", "Save product is successfuly !");
		return "redirect:/admin/product";
	}

	
	
	@ModelAttribute("brand")
	public Map<Integer, String> getBrand() {
		Map<Integer, String> map = new HashMap<Integer, String>();
		for (int i = 0; i < bdao.findAll().size(); i++) {
			map.put(bdao.findAll().get(i).getBrandID(), bdao.findAll().get(i).getBrandName());
		}
		return map;
	}
	
	@RequestMapping("product/edit/{productID}")
	public String edit(@PathVariable("productID") Integer productID, Model model) {
		model.addAttribute("item", dao.findById(productID).get());
		model.addAttribute("items", dao.findAll());
		return "admin/product";
	}
	
	@RequestMapping("product/delete/{productID}")
	public String delete(@PathVariable(value = "productID") Integer id, @ModelAttribute("item") ProductDto
			productDTO,
			BindingResult br, RedirectAttributes ra, Model model) {
		if (br.hasErrors()) {
			ra.addFlashAttribute("message", "Please correct the errors below !");
		} else {
			dao.deleteById(id);
			ra.addFlashAttribute("message", "Delete product is successfuly !");
		}
		return "redirect:/admin/product";
	}
	
}
