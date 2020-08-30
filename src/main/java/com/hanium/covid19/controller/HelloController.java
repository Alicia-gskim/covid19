package com.hanium.covid19.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hanium.covid19.adapter.Covid19TrendOfKorea;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/mainAnswer")
	public String mainAnswer() {
		return "answer/mainAnswer";
	}

	// 국내 전체 발생동향
	@RequestMapping("/info/trend/korea")
	@ResponseBody
	public String getTrendOfKorea() throws IOException {
		Covid19TrendOfKorea covid = new Covid19TrendOfKorea();
		String result = covid.getTrend();
		
		return result;
	}

	// 시도별 발생동향
	@RequestMapping("/info/trend/cites")
	public String getTrendOfCities(Model model) {
		model.addAttribute("message", "Hello World!");
		return "hello";
	}
}
