package com.jsk.stay.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jsk.stay.dto.AccommodationDto;

public class ReservationDao {

	@Autowired
	private SqlSession sqlSession;
	
	
	public AccommodationDto reservation(int acm_code) {
		System.out.println(acm_code);
		AccommodationDto dto = sqlSession.selectOne("Reservation",acm_code);
		
		return dto;
	}

	
}
