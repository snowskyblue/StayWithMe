package com.jsk.stay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FindIdPwdController {

	@RequestMapping("/findIdPwd")
	public String findIdPwd() {
		return "findIdPwd";
	}
}
