package com.jsk.stay.command;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.ui.Model;

import com.jsk.stay.dao.AcmDao;
import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.AcmSubDto;

public class AcmListCommand implements AcmCommand {

	@Override
	public void execute(Model model) {
		System.out.println("AcmListCommand execute ¸Þ¼­µå µé¾î¿È");
		
		Map<String,Object> map = model.asMap();
		System.out.println("¸ðµ¨ ¸ãÀ¸·Î");
		String mb_id = (String) map.get("mb_id");
		System.out.println("aaaaaaa");
		AcmDao dao = new AcmDao();
		System.out.println("bbbb " + mb_id);
		ArrayList<AccommodationDto> dtos1 = dao.list1(mb_id);
		ArrayList<AcmSubDto> dtos2 = dao.list2(134);
		System.out.println("cccccc");
		for(int i=0; i< dtos1.size(); i++){
			System.out.println("getAcm_code() : "+ dtos1.get(i).getAcm_code());
			System.out.println("getMb_id() : "+ dtos1.get(i).getMb_id());
		}	
		for(int i=0; i< dtos2.size(); i++){
			System.out.println("getAcm_code() : "+ dtos2.get(i).getAcm_rule());
			System.out.println("getMb_id() : "+ dtos2.get(i).getAcm_amenity());
		}	
		//ArrayList<AcmSubDto> dtos2 = dao.list2();
		model.addAttribute("list", dtos1);
		model.addAttribute("list2", dtos2);
	}

}
