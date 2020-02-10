package com.jsk.stay.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jsk.stay.command.Command;
import com.jsk.stay.command.ReservationCommand;
import com.jsk.stay.dao.ReservationDaoImp;
import com.jsk.stay.dto.AccommodationDto;

@Controller
public class ReservationController {
	
	@Autowired
	ReservationDaoImp dao;
	
	@RequestMapping("/reservation")
	public String reservation(HttpServletRequest request, Model model) {
		
		//int acm_code = Integer.parseInt(request.getParameter("acm_code"));
		AccommodationDto dto = new AccommodationDto();
		System.out.println("1");
		dto = dao.reservation(14);
		System.out.println("2");
		model.addAttribute("rdto",dto);
		return "reservation";
	}

}
