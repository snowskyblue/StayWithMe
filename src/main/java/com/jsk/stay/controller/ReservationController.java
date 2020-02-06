package com.jsk.stay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jsk.stay.dto.AccommodationDto;

@Controller
public class ReservationController {
	
	@RequestMapping("/reservation")
	public String reservation(HttpServletRequest request, Model model) {
		
		/*
		String mb_id = request.getRemoteUser();
		String acm_code_w = request.getParameter("acm_code");
		int acm_code = Integer.parseInt(acm_code_w);
		String acm_charge_w = request.getParameter("acm_charge");
		int acm_charge = Integer.parseInt(acm_charge_w);
		String acm_availdate = request.getParameter("acm_availdate");
		String acm_checkin_time = request.getParameter("acm_checkin_time");
		String acm_checkout_time = request.getParameter("acm_checkout_time");
		String acm_guest_num_w = request.getParameter("acm_guest_num");
		int acm_guest_num = Integer.parseInt(acm_guest_num_w);
		
		AccommodationDto dto = new AccommodationDto(mb_id, acm_code, acm_charge, acm_availdate,
				acm_checkin_time,acm_checkout_time,acm_guest_num);
		
		model.addAttribute("rdto",dto);
		*/
		return "reservation";
	}

}
