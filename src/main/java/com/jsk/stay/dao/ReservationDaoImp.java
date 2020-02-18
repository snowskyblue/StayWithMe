package com.jsk.stay.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.ReservationDto;

public class ReservationDaoImp implements ReservationDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public AccommodationDto reservation(int acm_code) throws Exception {
		System.out.println(acm_code);
		return sqlSession.selectOne("reservationImport",acm_code);
	}
	
	@Override
	public void reservationIn(ReservationDto dto) throws Exception {
		System.out.println(dto);
		sqlSession.insert("reservationIn",dto);
	}
	/*
	@Override
	public List<ReservationDto> reservationList(String mb_id) throws Exception {
		System.out.println(mb_id);
		return sqlSession.selectList("reservationList",mb_id);
	}
*/
	
}
