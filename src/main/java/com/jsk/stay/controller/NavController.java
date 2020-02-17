package com.jsk.stay.controller;

import java.io.PrintWriter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NavController {
	
	@RequestMapping("/header")
	public String header() {
		return "common/header2";
	}
	
	@RequestMapping("/footer")
	public String footer() {
		return "common/footer2";
	}

}
