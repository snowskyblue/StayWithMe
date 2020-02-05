package com.jsk.stay.command;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.ui.Model;

import com.jsk.stay.dao.AcmDao;
import com.jsk.stay.dto.AccommodationDto;

public class AcmListCommand implements AcmCommand {

	@Override
	public void execute(Model model) {
		Map<String,Object> map = model.asMap();
		String mb_id = (String) map.get("mb_id");
		
		AcmDao dao = new AcmDao();
		ArrayList<AccommodationDto> dtos1 = dao.list1(mb_id);
		//ArrayList<AcmSubDto> dtos2 = dao.list2();
		model.addAttribute("list1", dtos1);
		//model.addAttribute("list2", dtos2);
	}

}
