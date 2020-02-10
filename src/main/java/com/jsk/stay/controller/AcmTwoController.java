package com.jsk.stay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jsk.stay.command.AcmCommand;
import com.jsk.stay.command.AcmSearchCommandImp;

@Controller
public class AcmTwoController {
	@Autowired
	private AcmSearchCommandImp com;

	@RequestMapping("/acmList")
	public String acmList(Model model) {
		model.addAttribute("list", com.acmList());
		return "acmList";
	}
}
