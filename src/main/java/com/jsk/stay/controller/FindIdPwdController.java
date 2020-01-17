package com.jsk.stay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jsk.stay.command.FindIdPwdCommand;
import com.jsk.stay.command.FindIdPwdCommandImp;
import com.jsk.stay.util.Constant;

@Controller
public class FindIdPwdController {
	
	private JdbcTemplate template;
	
	FindIdPwdCommandImp com;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constant.template = this.template;
	}

	//ajax�� ���̵�&��й�ȣ ã�� �������� �̵�
	@RequestMapping("/findIdPwd")
	public String findIdPwd(HttpServletRequest request) {
		//String foundId2 = request.getParameter("foundId");
		//model.addAttribute("foundId2", foundId2);
		//System.out.println("foundId2: " + foundId2);
		return "findIdPwd";
	}
	
	//ȸ������ �� �� ������ ��ġ�ϴ� ���̵� ������ ajax���� ���̵� data�� ����. ������ notFoundId�� ���ϵ�.
	@ResponseBody
	@RequestMapping("/findIdCheck")
	public String findIdCheckpro(HttpServletRequest request) {
		System.out.println("/findIdCheck");
		String mb_name = request.getParameter("mb_name");
		System.out.println(mb_name);
		String mb_phone = request.getParameter("mb_phone");
		System.out.println(mb_phone);
		
		com = new FindIdPwdCommandImp();
		String result = com.findId_phoneCheck(mb_name, mb_phone);
		
		System.out.println(result);
		
		return result;
	}
	
	//ajax�� finIdPwd���������� ã�� ���̵��� �޾� ���̵� ��ȸ ���� �������� �̵�
	@RequestMapping("/findIdSuccess")
	public String findIdSuccess(HttpServletRequest request, Model model) {
		String foundId = request.getParameter("foundId");
		System.out.println("foundId : " + foundId);
		model.addAttribute("foundId", foundId);
		return "findIdSuccess";
	}
	
	@ResponseBody
	@RequestMapping("/findPwd_idCheck")
	public String findPwd_idCheck(HttpServletRequest request) {
		System.out.println("/findPwd_idCheck");
		String mb_id = request.getParameter("mb_id");
		System.out.println("findPwd_id : " + mb_id);
		
		com = new FindIdPwdCommandImp();
		String result = com.findPwd_idCheck(mb_id);
		
		System.out.println(result);
		return result;
	}
}
