package com.jsk.stay.command;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.jsk.stay.dto.CSDto;


public interface CSCommand {
	public ArrayList<CSDto> list(String mb_id) throws Exception;
}
