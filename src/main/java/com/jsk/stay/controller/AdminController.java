package com.jsk.stay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jsk.stay.command.CSCommandImp;
import com.jsk.stay.dto.Criteria;
import com.jsk.stay.dto.PageMaker;

@Controller
public class AdminController {
	
	@Autowired
	private CSCommandImp com;
	
	@RequestMapping("/adminMain")
	public String main() {
		return "admin/main";
	}
	
	@RequestMapping("/csAdmin")
	public String csMember(Model model, Criteria cri, HttpServletRequest request) throws Exception {
	
		if(request.isUserInRole("ROLE_ADMIN") == true) {
			model.addAttribute("list", com.list(cri));
			
			String mb_id = null;
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(com.listCount(mb_id));
			
			model.addAttribute("pageMaker", pageMaker);
		}

		return "admin/csAdmin";
	}
}
