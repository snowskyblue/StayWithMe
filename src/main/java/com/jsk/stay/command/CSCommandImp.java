package com.jsk.stay.command;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsk.stay.dao.CSDaoImp;
import com.jsk.stay.dto.CSDto;

@Service
public class CSCommandImp implements CSCommand {
	
	@Autowired
	private CSDaoImp dao;
	
	public ArrayList<CSDto> list(String mb_id) throws Exception {
		return dao.list(mb_id);
	}
	
	public ArrayList<CSDto> content(int cs_code) throws Exception {
		return dao.content(cs_code);
	}
	
	public String mb_name(String mb_id) {
		return dao.mb_name(mb_id);
	}
	
	public void mbWritePro(CSDto dto) throws Exception {
		dao.mbWritePro(dto);
	}
}
