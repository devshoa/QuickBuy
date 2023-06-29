package com.devmaster.admin.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devmaster.Library.model.OrderDetails;
import com.devmaster.Library.repository.OrderDetailsRepository;
import com.devmaster.Library.repository.OrderRepository;


@Controller
@RequestMapping("admin")
public class OrderController {
	@Autowired OrderRepository dao;
	
	@Autowired OrderDetailsRepository odao;
	

	@RequestMapping("order")
	public String view(Model model) {
		model.addAttribute("items", dao.findAll());
		System.out.println("danh sách" + dao.findAll()) ;
		return "admin/order";
	}
	@GetMapping("orderdetail/{id}")
	public String viewOrderDetails(Model model, @PathVariable("id") Integer id) {
		List<OrderDetails> listOD = odao.findByOrderid(id);
		model.addAttribute("lists", listOD);
		System.out.println("danh sách" + listOD) ;
		double sum = 0;
		for (OrderDetails od : listOD) {
			sum += (od.getQuantity() * od.getUnitPrice());
		}
		model.addAttribute("total", sum);
		return "admin/orderdetail";
	}
}
