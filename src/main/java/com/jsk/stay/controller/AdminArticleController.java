package com.jsk.stay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jsk.stay.command.AdminArticleCommandImp;
import com.jsk.stay.dto.Criteria;
import com.jsk.stay.dto.PageMaker;

@Controller
public class AdminArticleController {
	
	@Autowired
	private AdminArticleCommandImp com;
	
	@RequestMapping("/acmArticle")
	public String acmArticle(Criteria cri, Model model) {
		model.addAttribute("list", com.acmArticle(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(com.acmCount());
		
		model.addAttribute("pageMaker", pageMaker);
		return "admin/acmArticle";
	}
	
	@RequestMapping("/reviewArticle")
	public String reviewArticle() {
		return "admin/reviewArticle";
	}
}
