package com.devmaster.admin.controller;

import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.devmaster.Library.dto.CustomerDto;
import com.devmaster.Library.model.Customer;
import com.devmaster.Library.repository.CustomerRepository;
import com.devmaster.Library.service.impl.CustomerServiceImpl;


import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;

@Controller
@RequestMapping("admin")
public class CustomerController {


	@Autowired
	private CustomerRepository dao;

	@Autowired
	private CustomerServiceImpl customerService;
	
	@Autowired
	ServletContext app;


	
	@RequestMapping("account")
	public String index1(Model model, HttpServletResponse response) {
		model.addAttribute("item", new Customer());
	
		model.addAttribute("items", dao.findAll());
		
	//	System.out.println("items"+ dao.findAll());
		
		return "admin/account";
	}
	

	@GetMapping("account/edit/{customerID}")
	public String edit(Model model, @PathVariable("customerID") Integer customerID) {
		model.addAttribute("item", dao.findById(customerID).get());
		model.addAttribute("items", dao.findAll());
		return "admin/account";
	}
	


	
	@PostMapping("account/create")
	public String create(@Validated @ModelAttribute("item") CustomerDto cutomerDTO, Customer customer, BindingResult br,
			@RequestParam("image") MultipartFile image, Model model)
			throws IllegalAccessException, InvocationTargetException {
		try {
			File file = new File(app.getRealPath("/img/accounts/" + image.getOriginalFilename()));
			image.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		BeanUtils.copyProperties(customer, cutomerDTO);
		if (image != null && !image.getOriginalFilename().isEmpty()) {
			//customer.setImg(cutomerDTO.getImg().getOriginalFilename());
			customer.setImage(cutomerDTO.getImage().getOriginalFilename());
		} else {
//			customer.setImg("noavt.png");
			customer.setImage("noavt.png");
		}
		model.addAttribute("message", "Create new account is successful !");
		dao.save(customer); // Nếu có tk cập nhật, ngược lại thêm mới
		return "redirect:/admin/account";
	}
	
//	@PostMapping("account/update")
//	public String update(@Validated @ModelAttribute("item") CustomerDto cutomerDTO, Customer customer, BindingResult br,
//			@RequestParam("image") MultipartFile image, Model model)
//			throws IllegalAccessException, InvocationTargetException {
//		try {
//			File file = new File(app.getRealPath("/img/accounts/" + image.getOriginalFilename()));
//			image.transferTo(file);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		BeanUtils.copyProperties(customer, cutomerDTO);
//		if (image != null && !image.getOriginalFilename().isEmpty()) {
//			customer.setImage(cutomerDTO.getImage().getOriginalFilename());
//		} else {
//			customer.setImage("noavt.png");
//		}
//		model.addAttribute("message", "Account updated is successful !");
//		dao.save(customer);
//		return "redirect:/admin/account";
//	}

	


	@GetMapping("account/delete/{customerID}")
	public String delete(@PathVariable("customerID") Integer customerID, @ModelAttribute("item") CustomerDto model,
			BindingResult br, RedirectAttributes ra) {
		if (br.hasErrors()) {
			ra.addFlashAttribute("message", "Please correct the errors below !");
		} else {
			dao.deleteById(customerID);
			ra.addFlashAttribute("message", "Account deleted is successful !");
		}
		return "redirect:/admin/account";
	}
	
	
	
	


}
