package com.jsk.stay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CSController {
	
	@RequestMapping("/csMember")
	public String csMember() {
		return "csMember";
	}
}
