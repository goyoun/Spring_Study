package com.icia.memberboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class HomeController {
	
	//index 띄우기
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		// 어떤 jsp를 띄울것이냐
		return "index";
	}

}
