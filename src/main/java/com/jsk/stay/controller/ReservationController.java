package com.jsk.stay.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jsk.stay.command.Command;
import com.jsk.stay.command.ReservationCommand;
import com.jsk.stay.dao.LoginDao;
import com.jsk.stay.dao.ReservationDaoImp;
import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.MemberDto;
import com.jsk.stay.dto.ReservationDto;
import com.jsk.stay.util.Constant;

@Controller
public class ReservationController {
	
	@Autowired
	ReservationDaoImp dao;
	
	@Autowired
	LoginDao dao1;
	
	Command com;
	
	
	@RequestMapping("/reservation")
	public String reservation(HttpServletRequest request, Model model,
			@RequestParam(value = "fail", required = false) String fail) {
		
		String acm_code_w = request.getParameter("acm_code");
		int acm_code = Integer.parseInt(acm_code_w);
		
		AccommodationDto dto = new AccommodationDto();
		MemberDto dto1 = new MemberDto();
		System.out.println("1");
		try {
			dto = dao.reservation(acm_code);
			System.out.println(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (fail != null) {
			model.addAttribute("fail",fail);
		}
		dto1 = dao1.information(request.getRemoteUser());
		System.out.println("2");
		model.addAttribute("rdto",dto);
		model.addAttribute("dto",dto1);
		return "reservation";
	}
	
	@RequestMapping("/reser")
	public void res(HttpServletRequest request, Model model) {
		
		String checkIn = request.getParameter("checkIn");
		System.out.println(checkIn);
		String checkOut = request.getParameter("checkOut");
		System.out.println(checkOut);
		String acm_code_w = request.getParameter("acm_code");
		int acm_code = Integer.parseInt(acm_code_w);
		System.out.println(acm_code);
		String amount_w = request.getParameter("amount");
		int amount = Integer.parseInt(amount_w);
		System.out.println(amount);
		String guest_num_w = request.getParameter("guestNum");
		int guest_num = Integer.parseInt(guest_num_w);
		System.out.println(guest_num);
		String pay_method = request.getParameter("pay_method");
		System.out.println(pay_method);
		String imp_uid = request.getParameter("imp_uid");
		System.out.println(imp_uid);
		String mb_id = request.getRemoteUser();
		System.out.println(mb_id);
		String acm_title = request.getParameter("acm_title"); 
		String acm_address = request.getParameter("acm_address"); 
		String acm_add_detail = request.getParameter("acm_add_detail"); 
		String card_name = request.getParameter("card_name"); 
		
		ReservationDto dto = new ReservationDto(imp_uid, mb_id,acm_code,pay_method,amount,guest_num,checkIn,checkOut,acm_title,acm_address,acm_add_detail,card_name);
		
		System.out.println("dto" + dto);
		try {
			dao.reservationIn(dto);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return;
	}
	
	@RequestMapping("reservationCheck")
	public String reservationCheck(HttpServletRequest request, Model model) throws Exception {
		 
		String mb_id = request.getRemoteUser();
		System.out.println(mb_id);
		List<ReservationDto> dto =  dao.reservationList(mb_id);
		
		System.out.println(dto);
		
		model.addAttribute("list",dto);
		
		return "reservationCheck";
	}
	
	@RequestMapping("resReceipt")
	@ResponseBody
	public ReservationDto resReeceipt(HttpServletRequest request, Model model) throws Exception {
		
		String res_code = request.getParameter("res_code");
		System.out.println(res_code);

		ReservationDto dto = dao.resReceipt(res_code);
		
		return dto;
	}
	
}
