package com.jsk.stay.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.jsk.stay.dao.AcmDao;
import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.AcmSubDto;

public class AcmContentCommand implements AcmCommand {

	@Override
	public void execute(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int acm_code = Integer.parseInt(request.getParameter("acm_code"));
		System.out.println("acm_code AcmContentCommand : "+ acm_code);
		AcmDao dao = new AcmDao();
		AccommodationDto dto = dao.contentView(acm_code);
		ArrayList<AcmSubDto> subDtos = dao.list2(acm_code);
		model.addAttribute("dto", dto);
		model.addAttribute("subDtos",subDtos);
	}

}
