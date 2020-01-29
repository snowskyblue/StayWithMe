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
		return result;
	}
}
