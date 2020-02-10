package com.jsk.stay.dao;

import com.jsk.stay.dto.AccommodationDto;

public interface ReservationDao {

	public AccommodationDto reservation(int acm_code);
}
