package com.jsk.stay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jsk.stay.dao.EditDaoImp;

@Controller
public class EditController {
	
	EditDaoImp dao;

	@RequestMapping("/pwd")
	@ResponseBody
	public int pwd(HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println("id : " + id);
		String pw = request.getParameter("mb_pwd1");
		System.out.println("pw : " + pw);
		dao.pwd(id, pw);
		return 1;
	}
	
}
