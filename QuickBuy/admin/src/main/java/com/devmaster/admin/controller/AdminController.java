package com.devmaster.admin.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devmaster.Library.model.Customer;
import com.devmaster.Library.model.Report;
import com.devmaster.Library.repository.CategoryRepository;
import com.devmaster.Library.repository.CustomerRepository;
import com.devmaster.Library.repository.OrderDetailsRepository;
import com.devmaster.Library.repository.ProductRepository;
import com.devmaster.Library.service.SessionService;

@Controller

public class AdminController {
	@Autowired
	ProductRepository dao;

	@Autowired
	CategoryRepository ctdao;

	@Autowired
	CustomerRepository adao;

	@Autowired
	OrderDetailsRepository odao;
	
	

	@Autowired
	SessionService session;

	
	@GetMapping("/admin/index")
	public String index(Model model) {
		model.addAttribute("product", dao.countAllProduct());
	//	System.out.println("sản phẩm" + dao.countAllProduct());
		
		model.addAttribute("category", ctdao.countAllCategory());
	//	System.out.println("danh mục" + ctdao.countAllCategory());
		
		model.addAttribute("account", adao.countAllAccount());
	//	System.out.println("tài khoản" + adao.countAllAccount());
		
//		model.addAttribute("sum", odao.countSumOrder());
//		System.out.println("tài khoản" + odao.countSumOrder());
	
		model.addAttribute("item", new Customer());
		model.addAttribute("items", adao.findAll());
		return "admin/index";
	}

	@RequestMapping("/admin/revenue")
	public String report(Model model) {
//		List<Report> list = dao.getInventoryByCategory();
//		System.out.println("danh sách" + list);
//		model.addAttribute("items", list);
		return "admin/revenue";
	}

	@RequestMapping("/admin/revenue1")
	public String report1(Model model) {
//		List<Report> list = dao.getInventoryByDate();
//		System.out.println("ds" + dao.getInventoryByDate());
//		model.addAttribute("items", list);
		return "admin/revenue1";
	}
	
	
	
}
