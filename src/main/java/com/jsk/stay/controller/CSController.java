package com.jsk.stay.controller;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		model.addAttribute("mb_name", com.mb_name(mb_id));
		return "cs/mbWrite";
	}
	
	@RequestMapping("/csMbWritePro")
	public String mbWritePro(CSDto dto) throws Exception {
		System.out.println("됐나?1");
		com.mbWritePro(dto);
		return "redirect:csMember";
	}
	
}
