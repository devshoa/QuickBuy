package com.devmaster.admin.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class AccountController {
	@RequestMapping("")
	public String index() {

		return "admin/login";
	}

}
