package com.jsk.stay.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jsk.stay.command.CSCommandImp;
import com.jsk.stay.dto.CSDto;

@Controller
public class CSController {
	
	@Autowired
	private CSCommandImp com;
	
	@RequestMapping("/csMember")
	public String csMember(Model model, Principal principal) throws Exception {
		/*try {
			String mb_id = null;
			if(principal.getName() != null) {
				mb_id = principal.getName();
				System.out.println("csMb_id: " + mb_id);
				model.addAttribute("list", com.list(mb_id));
			
			}
		}
		catch(NullPointerException e) {
			model.addAttribute("list", "login");
		}*/
		model.addAttribute("list", com.list2());
		
		return "cs/csMember";
	}
	
	@RequestMapping("/csContent")
	public String csContent(HttpServletRequest request, Model model) throws Exception {
		String cs_code = request.getParameter("cs_code");
		System.out.println("cs_code: " + cs_code);
		model.addAttribute("content", com.content(Integer.parseInt(cs_code)));
		System.out.println("여기까지2");
		return "cs/content";
	}
	
	@RequestMapping("/csMbWrite")
	public String mbWrite(Model model, Principal principal) {
		String mb_id = principal.getName();
		System.out.println("csMb_id: " + mb_id);
		model.addAttribute("mb_id", mb_id);
		model.addAttribute("mb_name", com.mbWrite(mb_id));
		return "cs/mbWrite";
	}
	
	@RequestMapping("/csMbWritePro")
	public String mbWritePro(CSDto dto) throws Exception {
		System.out.println("됐나?1");
		com.mbWritePro(dto);
		return "redirect:csMember";
	}
	
	@RequestMapping("/csMbModify")
	public String mbModify(Model model, HttpServletRequest request, CSDto dto) {
		String cs_code = request.getParameter("cs_code");
		String cs_title = request.getParameter("cs_title");
		String cs_content = request.getParameter("cs_content");
		System.out.println("cs_code: " + cs_code);
		model.addAttribute("cs_code", Integer.parseInt(cs_code));
		model.addAttribute("cs_title", cs_title);
		model.addAttribute("cs_content", cs_content);

		//model.addAttribute("modify", com.content(Integer.parseInt(cs_code)));
		
		return "cs/mbModify";
	}
	
	@RequestMapping("/csMbModifyPro")
	public String mbModifyPro(@ModelAttribute CSDto dto, Model model) {
		//String cs_code = request.getParameter("cs_code");
		//String cs_title = request.getParameter("cs_title");
		//String cs_content = request.getParameter("cs_content");

		//model.addAttribute("content", com.mbModifyPro(Integer.parseInt(cs_code), cs_title, cs_content));
		
		com.mbModifyPro(dto);
		model.addAttribute("cs_code", dto.getCs_code());
		return "redirect:csContent";
	}
}
