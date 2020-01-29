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
}
