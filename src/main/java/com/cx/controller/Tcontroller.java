package com.cx.controller;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;




@Controller
public class Tcontroller {

	@RequestMapping("hello.do")
	public String admin() {
		return "test";
	}

}
