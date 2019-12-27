package com.jsk.stay.dto;

import java.sql.Timestamp;

public class Cs {
	private int admin_code;
	private int mb_code;
	private String cs_que;
	private String cs_ans;
	private Timestamp cs_que_date;
	private Timestamp cs_ans_date;
	private boolean cs_complete;
	public Cs(int admin_code, int mb_code, String cs_que, String cs_ans, Timestamp cs_que_date, Timestamp cs_ans_date,
			boolean cs_complete) {
		super();
		this.admin_code = admin_code;
		this.mb_code = mb_code;
		this.cs_que = cs_que;
		this.cs_ans = cs_ans;
		this.cs_que_date = cs_que_date;
		this.cs_ans_date = cs_ans_date;
		this.cs_complete = cs_complete;
	}
	public Cs() {
		super();
	}
	public int getAdmin_code() {
		return admin_code;
	}
	public void setAdmin_code(int admin_code) {
		this.admin_code = admin_code;
	}
	public int getMb_code() {
		return mb_code;
	}
	public void setMb_code(int mb_code) {
		this.mb_code = mb_code;
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
