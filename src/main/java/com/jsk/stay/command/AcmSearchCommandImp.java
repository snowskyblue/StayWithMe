package com.jsk.stay.command;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsk.stay.dao.AcmSearchDaoImp;
import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.CriteriaAcm;

@Service
public class AcmSearchCommandImp implements AcmSearchCommand {
	
	@Autowired
	private AcmSearchDaoImp dao;
	
	public List<AccommodationDto> acmList(CriteriaAcm cri) {
		return dao.acmList(cri);
	}
	
	public int acmListCount() {
		return dao.acmListCount();
	}
}
