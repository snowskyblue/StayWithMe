package com.jsk.stay.dao;

import java.util.List;

import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.CriteriaAcm;

public interface AcmSearchDao {
	public List<AccommodationDto> acmList(CriteriaAcm cri);
	public int acmListCount();
}
