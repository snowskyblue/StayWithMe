package com.jsk.stay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {

	@RequestMapping("/myPageProfile")
	public String myPage() {
		return "myPageProfile";
	}
}
