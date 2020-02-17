package com.jsk.stay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jsk.stay.command.AcmCommand;
import com.jsk.stay.command.AcmTwoCommand;
import com.jsk.stay.command.AcmTwoCommandImp;
import com.jsk.stay.dto.CriteriaAcm;
import com.jsk.stay.dto.PageMakerAcm;


@Controller
public class AcmTwoController {
	@Autowired
	private AcmTwoCommand com;

	@RequestMapping("/acmList")
	public String acmList(Model model, CriteriaAcm cri) {
		model.addAttribute("list", com.acmList(cri));
		
		PageMakerAcm pageMaker = new PageMakerAcm();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(com.acmListCount());
		
		model.addAttribute("pageMaker", pageMaker);
		return "acmList";
	}
	
	@RequestMapping("/acmInfo")
	public String acmInfo(Model model, HttpServletRequest request) {
		//String acm_code = request.getParameter("acm_code");
		String acm_code = "9";
		model.addAttribute("acmInfo", com.accommodation(Integer.parseInt(acm_code)));
		model.addAttribute("amenity", com.amenity(Integer.parseInt(acm_code)));
		model.addAttribute("rule", com.rule(Integer.parseInt(acm_code)));
		return "acmInfo";
	}
}
