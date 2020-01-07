package com.jsk.stay.dto;

import java.sql.Timestamp;

public class CsDto {
	private int cs_code;
	private String admin_id;
	private String mb_id;
	private String cs_que;
	private String cs_ans;
	private Timestamp cs_que_date;
	private Timestamp cs_ans_date;
	private boolean cs_complete;
	public CsDto() {
		super();
	}
	public CsDto(int cs_code, String admin_id, String mb_id, String cs_que, String cs_ans, Timestamp cs_que_date,
			Timestamp cs_ans_date, boolean cs_complete) {
		super();
		this.cs_code = cs_code;
		this.admin_id = admin_id;
		this.mb_id = mb_id;
		this.cs_que = cs_que;
		this.cs_ans = cs_ans;
		this.cs_que_date = cs_que_date;
		this.cs_ans_date = cs_ans_date;
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
	public String getCs_que() {
		return cs_que;
	}
	public void setCs_que(String cs_que) {
		this.cs_que = cs_que;
	}
	public String getCs_ans() {
		return cs_ans;
	}
	public void setCs_ans(String cs_ans) {
		this.cs_ans = cs_ans;
	}
	public Timestamp getCs_que_date() {
		return cs_que_date;
	}
	public void setCs_que_date(Timestamp cs_que_date) {
		this.cs_que_date = cs_que_date;
	}
	public Timestamp getCs_ans_date() {
		return cs_ans_date;
	}
	public void setCs_ans_date(Timestamp cs_ans_date) {
		this.cs_ans_date = cs_ans_date;
	}
	public boolean isCs_complete() {
		return cs_complete;
	}
	public void setCs_complete(boolean cs_complete) {
		this.cs_complete = cs_complete;
	}
	
	
}