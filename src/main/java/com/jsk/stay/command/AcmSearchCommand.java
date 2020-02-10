package com.jsk.stay.command;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.jsk.stay.dao.AcmSearchDao;
import com.jsk.stay.dao.AcmSearchDaoImp;
import com.jsk.stay.dto.AccommodationDto;

public interface AcmSearchCommand {
	
	public List<AccommodationDto> acmList();
}
