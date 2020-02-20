package com.jsk.stay.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jsk.stay.command.AdminMainCommandImp;

@Controller
public class AdminMainController {
	
	@Autowired
	AdminMainCommandImp com;
	
	@RequestMapping("/adminMain")
	public String main(Model model) {

		try {
			List<Map<String,Integer>> list = com.month();
			//System.out.println("list: " + list);
			
			model.addAttribute("month", list);
			model.addAttribute("totalMember", com.totalMember());
			model.addAttribute("totalACM", com.totalACM());
			model.addAttribute("womanCount", com.womanCount());
			model.addAttribute("manCount", com.manCount());
			model.addAttribute("guestCount", com.guestCount());
			model.addAttribute("hostCount", com.hostCount());
			
		}
		catch(NumberFormatException e) {
			e.printStackTrace();
		}
		
		return "admin/main";
	}
}
