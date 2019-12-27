package com.jsk.stay.dto;

import java.sql.Timestamp;

public class Event {

	private int admin_code;
	private String ev_title;
	private String ev_content;
	private Timestamp ev_date;
	public Event(int admin_code, String ev_title, String ev_content, Timestamp ev_date) {
		super();
		this.admin_code = admin_code;
		this.ev_title = ev_title;
		this.ev_content = ev_content;
		this.ev_date = ev_date;
	}
	public Event() {
		super();
	}
	public int getAdmin_code() {
		return admin_code;
	}
	public void setAdmin_code(int admin_code) {
		this.admin_code = admin_code;
	}
	public String getEv_title() {
		return ev_title;
	}
	public void setEv_title(String ev_title) {
		this.ev_title = ev_title;
	}
	public String getEv_content() {
		return ev_content;
	}
	public void setEv_content(String ev_content) {
		this.ev_content = ev_content;
	}
	public Timestamp getEv_date() {
		return ev_date;
	}
	public void setEv_date(Timestamp ev_date) {
		this.ev_date = ev_date;
	}
	
	
}
