package com.jsk.stay.command;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsk.stay.dao.JoinDao;
import com.jsk.stay.dto.MemberDto;


@Service
public class JoinCommandImp implements JoinCommand {

	@Autowired
	private JoinDao joinDao;
	
	@Override
	public void memberJoinProcess(MemberDto dto) throws Exception {
		joinDao.memberJoinMethod(dto);
	}
	
	@Override
	public int idCheck(String mb_id) throws Exception {
		return joinDao.idCheck(mb_id);
	}
	
	@Override
	public int phoneCheck(String mb_phone) throws Exception {
		return joinDao.phoneCheck(mb_phone);
	}
}
