package com.jsk.stay.command;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.jsk.stay.dto.CSDto;


public interface CSCommand {
	public ArrayList<CSDto> list(String mb_id) throws Exception;
	public ArrayList<CSDto> list2() throws Exception;
	public ArrayList<CSDto> content(int cs_code) throws Exception;
	public String mbWrite(String mb_id);
	public void mbWritePro(CSDto dto) throws Exception;
	public void mbModifyPro(CSDto dto);
}
