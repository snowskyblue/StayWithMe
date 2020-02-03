package com.jsk.stay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jsk.stay.dao.HostDao;
import com.jsk.stay.dto.HostDto;

@Controller
public class HostController {
	
	@Autowired
	private HostDao dao;
	
	@RequestMapping("hostJoin")
	public String hostJoin() {
		return "hostJoin";
	}
	
	@RequestMapping("hostWrite") 
	public String hostWrite(HostDto dto, Model model) {
		dao.writeDao(dto);
		//return "addAcm"
		return "preHostGrade";
		
		//writeForm에서 오는 request에서 뺌//content dao로 받을 경우 그냥 (0,값,값)으로 받을 수 있음
		/*
		String mb_id = dto.getMb_id();
		String ho_address = dto.getHo_address();
		String ho_add_detail = dto.getHo_add_detail();
		int ho_zip = dto.getHo_zip();
		String ho_account = dto.getHo_account();
		String ho_acc_num = dto.getHo_acc_num();*/
		/*
		String mb_id = request.getParameter("mb_id");
		String ho_address = request.getParameter("ho_address");
		String ho_add_detail = request.getParameter("ho_add_detail");
		int ho_zip = Integer.parseInt(request.getParameter("ho_zip"));
		String ho_account = request.getParameter("ho_account");
		String ho_acc_num = request.getParameter("ho_acc_num");*/
		
		/*dao.writeDao(mb_id, ho_address, ho_add_detail,ho_zip, ho_account,ho_acc_num);*/
	}
	
	@RequestMapping("/hostBoard")
	public String hostBoard(Model model) {
		model.addAttribute("hostJoin", "success");
		return "hostBoard";
	}

}
