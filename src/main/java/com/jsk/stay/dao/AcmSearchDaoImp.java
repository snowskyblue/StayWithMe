package com.jsk.stay.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsk.stay.dto.AccommodationDto;

@Repository
public class AcmSearchDaoImp implements AcmSearchDao {
	@Autowired
	private SqlSession sql;
	
	public List<AccommodationDto> acmList() {
		return sql.selectList("acm.acmList");
	}
}
