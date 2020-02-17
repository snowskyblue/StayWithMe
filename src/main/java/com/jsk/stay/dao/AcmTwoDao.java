package com.jsk.stay.dao;

import java.util.List;

import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.AcmSubDto;
import com.jsk.stay.dto.CriteriaAcm;

public interface AcmTwoDao {
	public List<AccommodationDto> acmList(CriteriaAcm cri);
	public int acmListCount();
	public List<AccommodationDto> accommodation(int acm_code);
	public List<AcmSubDto> amenity(int acm_code);
	public List<AcmSubDto> rule(int acm_code);
}
