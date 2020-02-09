package com.jsk.stay.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.jsk.stay.dao.ReservationDao;
import com.jsk.stay.dto.AccommodationDto;

public class ReservationCommand implements Command{
	
	@Autowired
	ReservationDao dao;

	@Override
	public void execute(Model model, HttpServletRequest request) {
		/*
		String mb_id = request.getRemoteUser();
		String acm_code_w = request.getParameter("acm_code");
		int acm_code = Integer.parseInt(acm_code_w);
		
		AccommodationDto dto = dao.reservation(acm_code);
		*/
		AccommodationDto dto = new AccommodationDto("",20,20000,"03/05/2020","","",6);
		
		model.addAttribute("rdto",dto);
	}

	
	
}
