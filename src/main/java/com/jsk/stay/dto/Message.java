package com.jsk.stay.dto;

import java.sql.Timestamp;

public class Message {
	private int mb_code;
	private int acm_code;
	private String msg_content;
	private Timestamp msg_send_date;
	private Timestamp msg_receive_date;
	private boolean msg_is_read;
	public int getMb_code() {
		return mb_code;
	}
	public void setMb_code(int mb_code) {
		this.mb_code = mb_code;
	}
	public int getAcm_code() {
		return acm_code;
	}
	public void setAcm_code(int acm_code) {
		this.acm_code = acm_code;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public Timestamp getMsg_send_date() {
		return msg_send_date;
	}
	public void setMsg_send_date(Timestamp msg_send_date) {
		this.msg_send_date = msg_send_date;
	}
	public Timestamp getMsg_receive_date() {
		return msg_receive_date;
	}
	public void setMsg_receive_date(Timestamp msg_receive_date) {
		this.msg_receive_date = msg_receive_date;
	}
	public boolean isMsg_is_read() {
		return msg_is_read;
	}
	public void setMsg_is_read(boolean msg_is_read) {
		this.msg_is_read = msg_is_read;
	}
	public Message(int mb_code, int acm_code, String msg_content, Timestamp msg_send_date, Timestamp msg_receive_date,
			boolean msg_is_read) {
		super();
		this.mb_code = mb_code;
		this.acm_code = acm_code;
		this.msg_content = msg_content;
		this.msg_send_date = msg_send_date;
		this.msg_receive_date = msg_receive_date;
		this.msg_is_read = msg_is_read;
	}
	public Message() {
		super();
	}
	
	}
