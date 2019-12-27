package com.jsk.stay.dto;

import java.sql.Timestamp;

public class Notice {
	private int admin_code;
	private String no_title;
	private String no_content;
	private Timestamp no_date;
	public Notice(int admin_code, String no_title, String no_content, Timestamp no_date) {
		super();
		this.admin_code = admin_code;
		this.no_title = no_title;
		this.no_content = no_content;
		this.no_date = no_date;
	}
	public Notice() {
		super();
	}
	public int getAdmin_code() {
		return admin_code;
	}
	public void setAdmin_code(int admin_code) {
		this.admin_code = admin_code;
	}
	public String getNo_title() {
		return no_title;
	}
	public void setNo_title(String no_title) {
		this.no_title = no_title;
	}
	public String getNo_content() {
		return no_content;
	}
	public void setNo_content(String no_content) {
		this.no_content = no_content;
	}
	public Timestamp getNo_date() {
		return no_date;
	}
	public void setNo_date(Timestamp no_date) {
		this.no_date = no_date;
	}
	
	
}
