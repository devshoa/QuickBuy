package com.devmaster.Customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.devmaster.Customer.service.impl.MailerServiceImpl;
import com.devmaster.Customer.ultils.RandomCode;
import com.devmaster.Library.dto.CustomerDto;
import com.devmaster.Library.dto.LoginDto;
import com.devmaster.Library.model.Customer;
import com.devmaster.Library.service.impl.CustomerServiceImpl;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import jakarta.websocket.server.PathParam;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LoginController {

	private final CustomerServiceImpl customerService;

	private final HttpSession session;

	@Autowired
	MailerServiceImpl mailer;

	@GetMapping("/signin")
	public String login(@ModelAttribute("loginDto") LoginDto loginDto, Model model) {

		if (session.getAttribute("usern") != null && session.getAttribute("pass") != null) {
			model.addAttribute("userName", session.getAttribute("usern"));
			model.addAttribute("passw", session.getAttribute("pass"));
		}

		return "page/login";
	}

	@GetMapping("/signup")
	public String sigup(@ModelAttribute("customerDto") CustomerDto customerDto) {
		return "page/signup";
	}

	@PostMapping("/do-login")
	public String doLogin(@Valid @ModelAttribute("loginDto") LoginDto loginDto, BindingResult result, Model model,
			RedirectAttributes redirectAttributes) {

		try {
			if (result.hasErrors()) {
				model.addAttribute("customerDto", loginDto);
				return "page/login";
			}
			// Get Username Roles Customer
			String userName = loginDto.getUserName();
			Customer customer = customerService.findByUsername(userName);

			if (customer != null) {

				// kiểm tra trang thái tài khoản
				if (customer.isActive()) {
					// check password
					String pass = customer.getPassword();
					String pass1 = loginDto.getPassword();
					System.out.println(pass);
					System.out.println(pass1);
					if (pass.contains(pass1)) {
						// save account to session
						session.setAttribute("acc", customer);
						return "redirect:/";
					} else if (pass != pass1) {
						model.addAttribute("errpass", "Mật khẩu không chính xác");
						return "page/login";
					}
				} else {
					redirectAttributes.addFlashAttribute("err", "Tài khoản của bạn chưa được kích hoạt");
					return "redirect:/signin";
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "page/login";
	}

	@PostMapping("/do-signup")
	public String doSignup(@Valid @ModelAttribute("customerDto") CustomerDto customerDto, BindingResult result,
			Model model) {

		try {
			if (result.hasErrors()) {
				model.addAttribute("customerDto", customerDto);
				return "page/signup";
			}
			// get Customer by UserName
			String userName = customerDto.getUserName();
			Customer cusername = customerService.findByUsername(userName);

			// get Customer by Email
			String email = customerDto.getEmail();
			Customer emailCustomer = customerService.findByEmail(email);

			if (emailCustomer != null) {
				model.addAttribute("customerDto", customerDto);
				model.addAttribute("emailerr", "Địa chỉ email này đã được sử dụng");
				return "page/signup";
			}

			if (cusername != null) {
				model.addAttribute("customerDto", customerDto);
				model.addAttribute("usererr", "Tên đăng nhập đã được sử dụng");
				return "page/signup";
			}
			// check pas repeat
			if (customerDto.getPassword().equals(customerDto.getConfirmPassword())) {

//				String usern = customerDto.getUserName();
//				String pass = customerDto.getPassword();

				// lấy ra mã code random

				customerDto.setConfirmationCode(RandomCode.ramdom());
				customerService.save(customerDto);

				// lưu vào session 2 thuộc tính là ConfirmationCode và userName
				session.setAttribute("confirmationCode", customerDto.getConfirmationCode());
				session.setAttribute("email", customerDto.getEmail());

				return "redirect:/confirmationCode";

//
//				if (session.getAttribute(usern) != null && session.getAttribute(pass) != null) {
//					session.removeAttribute(usern);
//					session.removeAttribute(pass);
//				}
//				session.setAttribute("usern", usern);
//				session.setAttribute("pass", pass);
//				
//
//				return "redirect:/signin";
			} else {
				model.addAttribute("customerDto", customerDto);
				model.addAttribute("passErr", "Mật khẩu nhập lại không giống nhau");
				return "page/signup";
			}
		} catch (Exception e) {
			model.addAttribute("message", "Can not register because error server");
			e.printStackTrace();
		}
		return "page/signup";

	}

	@GetMapping("/do-logout")
	public String doLogout() {
		session.removeAttribute("acc");
		session.removeAttribute("addressID");
		return "redirect:/";
	}

	@GetMapping("confirmationCode")
	public String confirmationCode() {
		String confirmationCode = (String) session.getAttribute("confirmationCode");
		String email = (String) session.getAttribute("email");
		if (confirmationCode == null || email == null) {
			return "redirect:/signin";
		} else {
			// tiếng hàng gửi mail cho khách hàng
			mailer.send(email, "Mã xác nhận của bạn là",
					confirmationCode + " không chia sẽ mã này với bắt kì ai!");
		}
		return "page/confirmationCode";
	}

	@PostMapping("check-code")
	public String checkCode(@PathParam("code") String code) {
		// kiểm tra sessess có tồn tại code và tên đăng nhập của người dùng
		// không
		String confirmationCode = (String) session.getAttribute("confirmationCode");
		String email = (String) session.getAttribute("email");

		if (confirmationCode == null || email == null) {
			return "redirect:/signin";
		} else {
			System.out.println("chekc");
			// check code của khách hàng
			if (code.contains(confirmationCode)) {
				// tiến hành active tài khoản
				Customer customer = customerService.findByEmail(email);
				customer.setActive(true);
				customerService.saveCustomer(customer);
				session.removeAttribute("confirmationCode");
				session.removeAttribute("email");
				return "redirect:/signin";
			}
		}

		session.removeAttribute("confirmationCode");
		session.removeAttribute("email");
		return "redirect:/signup";
	}

}
