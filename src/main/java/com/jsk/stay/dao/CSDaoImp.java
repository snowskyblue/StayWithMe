package com.jsk.stay.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsk.stay.dto.CSDto;

@Repository
public class CSDaoImp implements CSDao {
	@Autowired
	private SqlSession sql;
	
	public ArrayList<CSDto> list(String mb_id) throws Exception {
		ArrayList<CSDto> result = (ArrayList) sql.selectList("cs.list", mb_id);
		System.out.println(result);
		return result;
	}
	
	public ArrayList<CSDto> list2() throws Exception {
		ArrayList<CSDto> result = (ArrayList) sql.selectList("cs.list2");
		System.out.println(result);
		return result;
	}
	
	public ArrayList<CSDto> content(int cs_code) throws Exception {
		ArrayList<CSDto> result = (ArrayList) sql.selectList("cs.content", cs_code);
		System.out.println("¿©±â±îÁö");
		System.out.println(result);
		return result;
	}
	
	public String mbWrite(String mb_id) {
		String mb_name = sql.selectOne("cs.mbWrite", mb_id);
		return mb_name;
	}
	
	public void mbWritePro(CSDto dto) throws Exception {
		System.out.println("µÆ³ª?2");
		sql.insert("cs.mbWritePro", dto);
		System.out.println("µÆ³ª?3");
	}
	
	public void mbModifyPro(CSDto dto) {
		//CSDto dto = new CSDto(cs_code, cs_title, cs_content);
		sql.update("cs.mbModifyPro", dto);

	}
}
