package com.jsk.stay.dao;

import java.util.ArrayList;

import com.jsk.stay.dto.CSDto;

public interface CSDao {
	public ArrayList<CSDto> list(String mb_id) throws Exception;
	public ArrayList<CSDto> content(int cs_code) throws Exception;
}
