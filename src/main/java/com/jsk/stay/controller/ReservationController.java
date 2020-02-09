package com.jsk.stay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jsk.stay.command.ReservationCommand;
import com.jsk.stay.dto.AccommodationDto;

@Controller
public class ReservationController {
	
	ReservationCommand com;
	
	@RequestMapping("/reservation")
	public String reservation(HttpServletRequest request, Model model) {
		
		com = new ReservationCommand();
		com.execute(model, request);
		
		
		return "reservation";
	}

}
