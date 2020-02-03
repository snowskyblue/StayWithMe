package com.jsk.stay.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsk.stay.command.CSCommandImp;

@Controller
public class CSController {
	
	@Autowired
	private CSCommandImp com;
	
	@RequestMapping("/csMember")
	public String csMember(Model model, Principal principal) throws Exception {
		try {
			String mb_id = null;
			if(principal.getName() != null) {
				mb_id = principal.getName();
				System.out.println(mb_id);
				model.addAttribute("list", com.list(mb_id));
			}
		}
		catch(NullPointerException e) {
			model.addAttribute("list", "login");
		}
		return "/cs/csMember";
	}
	
	@RequestMapping("/csContent")
	public String csContent(@RequestParam int cs_code, Model model) throws Exception {
		System.out.println(cs_code);
		model.addAttribute("content", com.content(cs_code));
		System.out.println("여기까지2");
		return "/cs/content";
	}
	
}
