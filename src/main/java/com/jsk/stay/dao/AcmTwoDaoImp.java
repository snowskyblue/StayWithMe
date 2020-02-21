package com.jsk.stay.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.AcmSubDto;
import com.jsk.stay.dto.CriteriaAcm;

@Repository
public class AcmTwoDaoImp implements AcmTwoDao {
	@Autowired
	private SqlSession sql;
	
	public List<AccommodationDto> acmList(CriteriaAcm cri) {
		//HashMap map = new HashMap<CriteriaAcm, String>();
		//map.put("cri", cri);
		//map.put("location", location);
		//System.out.println("cri:" + cri.getRowStart());
		//System.out.println("loca"+ location);
		//System.out.println("lo: " + map.get(location));
		return sql.selectList("acm.acmList", cri);
	}
	
	public int acmListCount() {
		return sql.selectOne("acm.acmListCount");
	}
	
	public List<AccommodationDto> accommodation(int acm_code) {
		return sql.selectList("acm.accommodation", acm_code);
	}
	
	public List<AcmSubDto> amenity(int acm_code) {
		return sql.selectList("acm.amenity", acm_code);
	}
	
	public List<AcmSubDto> rule(int acm_code) {
		return sql.selectList("acm.rule", acm_code);
	}
}
