package com.jsk.stay.dao;

import com.jsk.stay.dto.MemberDto;

public interface IDao {
	public MemberDto login(String mb_id);
	
}