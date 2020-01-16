package com.jsk.stay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jsk.stay.command.FindIdPwdCommandImp;
import com.jsk.stay.util.Constant;

@Controller
public class FindIdPwdController {
	
	private JdbcTemplate template;
	
	FindIdPwdCommandImp com;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constant.template = this.template;
	}

	@RequestMapping("/findIdPwd")
	public String findIdPwd() {
		return "findIdPwd";
	}
	
	@ResponseBody
	@RequestMapping("/findIdCheck")
	public String findIdCheckpro(HttpServletRequest request) {
		System.out.println("/findIdCheck");
		String mb_name = request.getParameter("mb_name");
		System.out.println(mb_name);
		String mb_phone = request.getParameter("mb_phone");
		System.out.println(mb_phone);
		
		com = new FindIdPwdCommandImp();
		String result = com.findId_phoneCheck(mb_name, mb_phone);
		
		System.out.println(result);
		
		return result;
	}
	
	@RequestMapping("/findIdSuccess")
	public String findIdSuccess(HttpServletRequest request, Model model) {
		String foundId = request.getParameter("foundId");
		System.out.println("foundId : " + foundId);
		model.addAttribute("foundId", foundId);
		return "findIdSuccess";
	}
}
