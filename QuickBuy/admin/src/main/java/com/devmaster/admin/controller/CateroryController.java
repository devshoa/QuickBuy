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

import com.devmaster.Library.model.Category;
import com.devmaster.Library.repository.CategoryRepository;

import jakarta.validation.Valid;

@Controller
@RequestMapping("admin")
public class CateroryController {
	@Autowired
	private CategoryRepository dao;

	@RequestMapping("category")
	public String index(Model model) {
		model.addAttribute("item", new Category());
		model.addAttribute("items", dao.findAll());
		return "admin/category";
	}

	@GetMapping("category/edit/{categoryID}")
	public String edit(Model model, @PathVariable("categoryID") Integer id) {
		model.addAttribute("item", dao.findById(id).get());
		model.addAttribute("items", dao.findAll());
		return "admin/category";
	}

	@PostMapping("category/create")
	public String create(@Valid Category item, BindingResult br, RedirectAttributes ra) {
		if (br.hasErrors()) {
			ra.addFlashAttribute("message", "Please correct the errors below !");
		} else {
			dao.save(item);
			ra.addFlashAttribute("message", "Create new category is successful !");
		}
		return "redirect:/admin/category";
	}

	@PostMapping("category/update")
	public String update(Category item, BindingResult br, RedirectAttributes ra) {
		if (br.hasErrors()) {
			ra.addFlashAttribute("message", "Please correct the errors below !");
		} else {
			dao.save(item);
			ra.addFlashAttribute("message", "Category updated is successful !");
		}
		return "redirect:/admin/category";
	}

	@GetMapping("category/delete/{categoryID}")
	public String delete(@PathVariable("categoryID") Integer categoryID, Category item, BindingResult br, RedirectAttributes ra,
			Model model) {
		if (br.hasErrors()) {
			ra.addFlashAttribute("message", "Please correct the errors below !");
		} else {
			dao.deleteById(categoryID);
			ra.addFlashAttribute("message", "Category deleted is successful !");
		}
		return "redirect:/admin/category";
	}

	
}
