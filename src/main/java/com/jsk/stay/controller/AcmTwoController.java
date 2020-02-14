package com.jsk.stay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jsk.stay.command.AcmCommand;
import com.jsk.stay.command.AcmSearchCommandImp;
import com.jsk.stay.dto.CriteriaAcm;
import com.jsk.stay.dto.PageMakerAcm;


@Controller
public class AcmTwoController {
	@Autowired
	private AcmSearchCommandImp com;

	@RequestMapping("/acmList")
	public String acmList(Model model, CriteriaAcm cri) {
		model.addAttribute("list", com.acmList(cri));
		
		PageMakerAcm pageMaker = new PageMakerAcm();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(com.acmListCount());
		
		model.addAttribute("pageMaker", pageMaker);
		return "acmList";
	}
}
