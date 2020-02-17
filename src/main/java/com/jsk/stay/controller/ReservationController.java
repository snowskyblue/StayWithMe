package com.jsk.stay.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jsk.stay.command.Command;
import com.jsk.stay.command.ReservationCommand;
import com.jsk.stay.dao.LoginDao;
import com.jsk.stay.dao.ReservationDaoImp;
import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.MemberDto;

@Controller
public class ReservationController {
	
	@Autowired
	ReservationDaoImp dao;
	
	@Autowired
	LoginDao dao1;
	
	Command com;
	
	
	@RequestMapping("/reservation")
	public String reservation(HttpServletRequest request, Model model) {
		
		//int acm_code = Integer.parseInt(request.getParameter("acm_code"));
		AccommodationDto dto = new AccommodationDto();
		MemberDto dto1 = new MemberDto();
		System.out.println("1");
		try {
			dto = dao.reservation(20);
		} catch (Exception e) {
			e.printStackTrace();
		}
		dto1 = dao1.information(request.getRemoteUser());
		System.out.println("2");
		model.addAttribute("rdto",dto);
		model.addAttribute("dto",dto1);
		return "reservation";
	}
	
	@RequestMapping("/reservationCheck")
	public void reservationCheck(HttpServletRequest request, Model model) {
		
		com = new ReservationCommand();
		com.execute(model, request);
			
	}
}
