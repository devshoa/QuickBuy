package com.devmaster.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.devmaster.Library.model.Brand;
import com.devmaster.Library.repository.BrandRepository;

import jakarta.validation.Valid;

@Controller
@RequestMapping("admin")
public class BrandController {
	@Autowired
	private BrandRepository dao;

	@RequestMapping("brand")
	public String index(Model model) {
		model.addAttribute("item", new Brand());
		model.addAttribute("items", dao.findAll());
		return "admin/brand";
	}

	@GetMapping("brand/edit/{brandID}")
	public String edit(Model model, @PathVariable("brandID") Integer id) {
		model.addAttribute("item", dao.findById(id).get());
		model.addAttribute("items", dao.findAll());
		return "admin/brand";
	}

	@PostMapping("brand/create")
	public String create(@Valid Brand item, BindingResult br, RedirectAttributes ra) {
		if (br.hasErrors()) {
			ra.addFlashAttribute("message", "Please correct the errors below !");
		} else {
			dao.save(item);
			ra.addFlashAttribute("message", "Create new brand is successful !");
		}
		return "redirect:/admin/brand";
	}

	@PostMapping("brand/update")
	public String update(Brand item, BindingResult br, RedirectAttributes ra) {
		if (br.hasErrors()) {
			ra.addFlashAttribute("message", "Please correct the errors below !");
		} else {
			dao.save(item);
			ra.addFlashAttribute("message", "brand updated is successful !");
		}
		return "redirect:/admin/brand";
	}

	@GetMapping("brand/delete/{brandID}")
	public String delete(@PathVariable("brandID") Integer brandID, Brand item, BindingResult br, RedirectAttributes ra,
			Model model) {
		if (br.hasErrors()) {
			ra.addFlashAttribute("message", "Please correct the errors below !");
		} else {
			dao.deleteById(brandID);
			ra.addFlashAttribute("message", "brand deleted is successful !");
		}
		return "redirect:/admin/brand";
	}

	
}
