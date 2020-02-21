package com.jsk.stay.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jsk.stay.command.AcmTwoCommand;
import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.CriteriaAcm;
import com.jsk.stay.dto.PageMakerAcm;

import net.sf.json.JSONArray;


@Controller
public class AcmTwoController {
	@Autowired
	private AcmTwoCommand com;

	@RequestMapping("/acmList")
	public String acmList(Model model, CriteriaAcm cri, HttpServletRequest request) {
		
		//String location = request.getParameter("location");
		//System.out.println(location);
		List<AccommodationDto> acmList = new ArrayList<AccommodationDto>();
		acmList = com.acmList(cri);
		model.addAttribute("list", acmList);
		
		PageMakerAcm pageMaker = new PageMakerAcm();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(com.acmListCount());
		
		model.addAttribute("pageMaker", pageMaker);
		

		JSONArray jsonArray = new JSONArray();
		model.addAttribute("jsonList", jsonArray.fromObject(acmList));
		return "acmList";
	}
	
	@RequestMapping("/acmInfo")
	public String acmInfo(Model model, HttpServletRequest request) {
		String acm_code = request.getParameter("acm_code");
		System.out.println("acmInfo: " + acm_code);
		model.addAttribute("acmInfo", com.accommodation(Integer.parseInt(acm_code)));
		model.addAttribute("amenity", com.amenity(Integer.parseInt(acm_code)));
		model.addAttribute("rule", com.rule(Integer.parseInt(acm_code)));
		return "acmInfo";
	}
}
