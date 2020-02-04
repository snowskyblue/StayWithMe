package com.jsk.stay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jsk.stay.dao.EditDaoImp;

@Controller
public class EditController {
	
	@Autowired
	EditDaoImp dao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@RequestMapping("/myPagePwd")
	@ResponseBody
	public String pwd(HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println("id : " + id);
		String pw1 = request.getParameter("mb_pwd1");
		String pw = passwordEncoder.encode(pw1);
		System.out.println("pw : " + pw);
		dao.myPagePwd(id, pw);
		return "success";
	}
	
	@RequestMapping("/myPageEmail")
	@ResponseBody
	public String email(HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println("id : " + id);
		String email = request.getParameter("mb_email");
		System.out.println("email : " + email);
		dao.myPageEmail(id, email);
		return "success";
	}
	@RequestMapping("/myPagePhone")
	@ResponseBody
	public String phone(HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println("id : " + id);
		String phone = request.getParameter("mb_phone");
		System.out.println("phone : " + phone);
		dao.myPagePhone(id, phone);
		return "success";
	}
	
	@RequestMapping("/myPageAddress")
	@ResponseBody
	public String address(HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println("id : " + id);
		String address = request.getParameter("address");
		System.out.println("address : " + address);
		String detailAddress = request.getParameter("detailAddress");
		System.out.println("detailAddress : " + detailAddress);
		int postcode = Integer.parseInt(request.getParameter("postcode"));
		System.out.println("postcode : " + postcode);
		dao.myPageAddress(id, address, detailAddress,postcode);
		return "success";
	}
}
