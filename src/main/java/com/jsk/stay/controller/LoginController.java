package com.jsk.stay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jsk.stay.dao.LoginDao;
import com.jsk.stay.util.Constant;

@Controller
public class LoginController {
	
	private LoginDao dao;

	@Autowired
	public void setDao(LoginDao dao) {
		this.dao = dao;
		Constant.dao = this.dao;
	}
	

	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView loginform(@RequestParam(value = "log", required = false) String log,
			@RequestParam(value = "error", required = false) String error) {

		ModelAndView model = new ModelAndView();
		if (log != null) {
			model.addObject("log", "before login!");
		}
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}
		
		model.setViewName("login");

		return model;
	}

	@RequestMapping("/index")
	public ModelAndView index(
			@RequestParam(value = "success", required = false) String success,
			@RequestParam(value = "logout", required = false) String logout) {
		ModelAndView model = new ModelAndView();
		if (success != null) {
			model.addObject("success", "before login!");
		}
		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("index");
		return model;
	}
	@RequestMapping("logout")
	public String logout() {
		return "logout";
	}

}
