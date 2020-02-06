package com.jsk.stay.dao;

import java.util.ArrayList;

import com.jsk.stay.dto.CSDto;

public interface CSDao {
	public ArrayList<CSDto> list(String mb_id) throws Exception;
	public ArrayList<CSDto> list2() throws Exception;
	public ArrayList<CSDto> content(int cs_code) throws Exception;
	public String mb_name(String mb_id);
	public void mbWritePro(CSDto dto) throws Exception;
}
