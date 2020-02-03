package com.jsk.stay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jsk.stay.command.Command;
import com.jsk.stay.dao.LoginDao;
import com.jsk.stay.dto.MemberDto;

@Controller
public class MyPageController {

	private LoginDao dao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	public void setDao(LoginDao dao) {
		this.dao = dao;
	}
	Command com;
	
	@RequestMapping("/myPageProfile")
	public ModelAndView myPage(
			@RequestParam(value = "fail", required = false) String fail) {
		ModelAndView model = new ModelAndView();
		if (fail != null) {
			model.addObject("fail", "before login!");
		}
		model.setViewName("myPageProfile");
		return model;
	}
	
	@RequestMapping("/EditInformation")
	public String EditInformation(Model model, HttpServletRequest request) {
		String id = request.getRemoteUser();
		//MemberDto dto = dao.information(id);
		//model.addAttribute("dto",dto);
		return "EditInformation";
	}
	
	@RequestMapping("/checkPwd")
	@ResponseBody
	public String checkPwd(Model model, HttpServletRequest request) {
		String pw = request.getParameter("checkPwd");
		System.out.println("pw : " + pw);
		if(pw == null) {
			pw = request.getParameter("mb_pwd1");
			System.out.println(pw);
		}
		String mb_id = request.getRemoteUser();
		System.out.println("mb_id : " + mb_id );
		String mb_pw = dao.check(mb_id);
		//암호화 시켜준것
		boolean result = passwordEncoder.matches(pw, mb_pw);
		String result1 = Boolean.toString(result);
		
		model.addAttribute("result", result1);
		
		return result1;
	}
	
}
