package com.hanium.covid19.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

@Controller
public class HelloController {
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("message", "index page!");
		return "index";
	}
	
	@RequestMapping("/hello")
	public String hello(Model model) {
		return "hello";
	}
}
