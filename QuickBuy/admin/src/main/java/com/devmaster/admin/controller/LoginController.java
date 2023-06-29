package com.devmaster.admin.controller;

import java.security.NoSuchAlgorithmException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.devmaster.Library.dto.CustomerDto;
import com.devmaster.Library.dto.LoginDto;
import com.devmaster.Library.model.Customer;
import com.devmaster.Library.repository.CustomerRepository;

import com.devmaster.Library.service.CookieService;
import com.devmaster.Library.service.CustomerService;
import com.devmaster.Library.service.SessionService;
import com.devmaster.Library.service.impl.CustomerServiceImpl;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor

public class LoginController {

	@Autowired
	CustomerRepository dao;

	@Autowired
	CookieService cookieService;

	@Autowired
	SessionService session;

	private final CustomerServiceImpl customerService;

	@Autowired
	CustomerService accountService;

	@GetMapping("/login")
	public String login(Model model) {

		return "admin/login";
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute Customer acc, @RequestParam("username") String user, RedirectAttributes model,
			BindingResult result, @RequestParam("password") String pass,
			@RequestParam(name = "remember", defaultValue = "false") Boolean rm) throws NoSuchAlgorithmException {
		Customer account = dao.findByUsername(user);

		// String userDB = account.getUsername();

		try {
			if (result.hasErrors()) {
				
				return "redirect:/login";
			}

			if (user.equals(account.getUsername()) && pass.equals(account.getPassword())) {
				session.set("user", account);
				session.set("isLogin", true);

				return "redirect:admin/index";
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		model.addFlashAttribute("err", "Tài khoản hoặc mật khẩu không hợp lệ");
		return "redirect:/login";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		session.remove("user");
		session.remove("isLogin");

		cookieService.remove("username");
		cookieService.remove("password");
		return "redirect:/login";
	}
	
	@GetMapping("/forgot-password")
	public String forgot(Model model) {
	
		return "admin/forgot-password";
	}

}
