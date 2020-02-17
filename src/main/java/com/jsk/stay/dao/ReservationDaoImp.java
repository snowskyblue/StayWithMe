package com.jsk.stay.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.ReservationDto;

public class ReservationDaoImp{

	@Autowired
	private SqlSession sqlSession;
	
	public AccommodationDto reservation(int acm_code) throws Exception {
		System.out.println(acm_code);
		return sqlSession.selectOne("reservationImport",acm_code);
	}
	
	public void reservationIn(ReservationDto dto) throws Exception {
		System.out.println(dto);
		sqlSession.insert("reservationIn",dto);
	}

	
}
