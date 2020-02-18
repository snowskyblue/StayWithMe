package com.jsk.stay.dao;

import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.ReservationDto;

public interface ReservationDao {

	public AccommodationDto reservation(int acm_code) throws Exception;
	public void reservationIn(ReservationDto dto) throws Exception;
	//public ReservationDto reservationList(String mb_id) throws Exception;
}
