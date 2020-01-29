package com.jsk.stay.dto;

import java.sql.Timestamp;

public class CSDto {
	private int cs_code;
	private String admin_id;
	private String mb_id;
	private String cs_title;
	private String cs_content;
	private Timestamp cs_date;
	private char cs_complete;
	
	public CSDto() {
		super();
	}
	
	public CSDto(int cs_code, String admin_id, String mb_id, String cs_title, String cs_content, Timestamp cs_date,
			char cs_complete) {
		super();
		this.cs_code = cs_code;
		this.admin_id = admin_id;
		this.mb_id = mb_id;
		this.cs_title = cs_title;
		this.cs_content = cs_content;
		this.cs_date = cs_date;
		this.cs_complete = cs_complete;
	}
	
	public int getCs_code() {
		return cs_code;
	}
	public void setCs_code(int cs_code) {
		this.cs_code = cs_code;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getCs_title() {
		return cs_title;
	}
	public void setCs_title(String cs_title) {
		this.cs_title = cs_title;
	}
	public String getCs_content() {
		return cs_content;
	}
	public void setCs_content(String cs_content) {
		this.cs_content = cs_content;
	}
	public Timestamp getCs_date() {
		return cs_date;
	}
	public void setCs_date(Timestamp cs_date) {
		this.cs_date = cs_date;
	}
	public char getCs_complete() {
		return cs_complete;
	}
	public void setCs_complete(char cs_complete) {
		this.cs_complete = cs_complete;
	}

	
}