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
	
	public ArrayList<CSDto> list2() throws Exception {
		return dao.list2();
	};
	
	public ArrayList<CSDto> content(int cs_code) throws Exception {
		return dao.content(cs_code);
	}
	
	public String mbWrite(String mb_id) {
		return dao.mbWrite(mb_id);
	}
	
	public void mbWritePro(CSDto dto) throws Exception {
		dao.mbWritePro(dto);
	}
	
	public void mbModifyPro(CSDto dto) {
		dao.mbModifyPro(dto);
	}
	
	public void mbDelete(int cs_code) {
		dao.mbDelete(cs_code);
	}
	
	public void adReplyPro(CSDto dto) {
		dao.adReplyPro(dto);
	}
	
	public ArrayList<CSDto> reply(int cs_group) {
		return dao.reply(cs_group);
	}
	
	public void adModifyPro(CSDto dto)	{
		dao.adModifyPro(dto);
	}
	
	public void adDelete(int cs_code, int cs_group) {
		dao.adDelete(cs_code, cs_group);
	}
}
