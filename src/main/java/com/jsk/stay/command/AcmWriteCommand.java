package com.jsk.stay.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.jsk.stay.dao.AcmDao;

public class AcmWriteCommand implements AcmCommand {

	@Override
	public void execute(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String acm_img = (String) map.get("fileRoots");
		
		System.out.println("커맨드클래스의 엑스큐트 메서드 안 ok");
		System.out.println("acm_img  "  + acm_img);
		
		
		String acm_type = request.getParameter("acm_type");
		String acm_room_type = request.getParameter("acm_room_type");
		String bed = request.getParameter("bed");
		String floor = request.getParameter("floor");
		String acm_bedding = bed + ", " +  floor;
		int acm_guest_num = Integer.parseInt(request.getParameter("acm_guest_num"));
		int acm_room_num = Integer.parseInt(request.getParameter("acm_room_num"));
		int acm_bath_num = Integer.parseInt(request.getParameter("acm_bath_num"));
		int acm_area = Integer.parseInt(request.getParameter("acm_area"));
		int acm_charge = Integer.parseInt(request.getParameter("acm_charge"));
		String acm_title = request.getParameter("acm_title");
		String acm_info = request.getParameter("acm_info");
		String infant = request.getParameter("infant");
		String child = request.getParameter("child");
		String pet = request.getParameter("pet");
		String smoking = request.getParameter("smoking");
		String party = request.getParameter("party");
		String commercial = request.getParameter("commercial");

		String acm_rule = infant + " " + child + " " + pet + " " + smoking + " " + party + " " + commercial;
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		String extraAddress = request.getParameter("extraAddress");

		String acm_address = address + extraAddress;
		String acm_add_detail = detailAddress;
		
		int acm_zip = Integer.parseInt(request.getParameter("postcode"));
		String acm_checkin_time = request.getParameter("acm_checkin_time");
		String acm_checkout_time = request.getParameter("acm_checkout_time");
		//String acm_img = request.getParameter("fileRoots");
		String acm_availdate = request.getParameter("acm_availdate");
		AcmDao dao = new AcmDao();
		dao.write(
				acm_type,
				acm_room_type,
				acm_bedding,
				acm_guest_num,
				acm_room_num,
				acm_bath_num,
				acm_area,
				acm_charge,
				acm_title,
				acm_info,
				acm_rule,
				acm_address,
				acm_add_detail,
				acm_zip,
				acm_checkin_time,
				acm_checkout_time,
				acm_img,
				acm_availdate
		);
	}

}
