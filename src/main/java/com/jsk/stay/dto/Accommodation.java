package com.jsk.stay.dto;

import java.sql.Timestamp;

public class Accommodation {
	private int acm_code;
	private String acm_img;
	private String acm_info;
	private String acm_rule;
	private int acm_charge;
	private Timestamp acm_availdate;
	private Timestamp acm_checkin_time;
	private Timestamp acm_ckeckout_time;
	private String acm_type;
	private String acm_room_type;
	private int acm_guest_num;
	private int acm_room_num;
	private int acm_bath_num;
	private int acm_area;
	private int acm_min_date;
	private String acm_bedding;
	private String acm_address;
	private String acm_add_detail;
	private String acm_title;
	
	public Accommodation(int acm_code, String acm_img, String acm_info, String acm_rule, int acm_charge,
			Timestamp acm_availdate, Timestamp acm_checkin_time, Timestamp acm_ckeckout_time, String acm_type,
			String acm_room_type, int acm_guest_num, int acm_room_num, int acm_bath_num, int acm_area, int acm_min_date,
			String acm_bedding, String acm_address, String acm_add_detail, String acm_title) {
		super();
		this.acm_code = acm_code;
		this.acm_img = acm_img;
		this.acm_info = acm_info;
		this.acm_rule = acm_rule;
		this.acm_charge = acm_charge;
		this.acm_availdate = acm_availdate;
		this.acm_checkin_time = acm_checkin_time;
		this.acm_ckeckout_time = acm_ckeckout_time;
		this.acm_type = acm_type;
		this.acm_room_type = acm_room_type;
		this.acm_guest_num = acm_guest_num;
		this.acm_room_num = acm_room_num;
		this.acm_bath_num = acm_bath_num;
		this.acm_area = acm_area;
		this.acm_min_date = acm_min_date;
		this.acm_bedding = acm_bedding;
		this.acm_address = acm_address;
		this.acm_add_detail = acm_add_detail;
		this.acm_title = acm_title;
	}
	public Accommodation() {
		super();
	}
	
	
	public int getAcm_code() {
		return acm_code;
	}
	public void setAcm_code(int acm_code) {
		this.acm_code = acm_code;
	}
	public String getAcm_img() {
		return acm_img;
	}
	public void setAcm_img(String acm_img) {
		this.acm_img = acm_img;
	}
	public String getAcm_info() {
		return acm_info;
	}
	public void setAcm_info(String acm_info) {
		this.acm_info = acm_info;
	}
	public String getAcm_rule() {
		return acm_rule;
	}
	public void setAcm_rule(String acm_rule) {
		this.acm_rule = acm_rule;
	}
	public int getAcm_charge() {
		return acm_charge;
	}
	public void setAcm_charge(int acm_charge) {
		this.acm_charge = acm_charge;
	}
	public Timestamp getAcm_availdate() {
		return acm_availdate;
	}
	public void setAcm_availdate(Timestamp acm_availdate) {
		this.acm_availdate = acm_availdate;
	}
	public Timestamp getAcm_checkin_time() {
		return acm_checkin_time;
	}
	public void setAcm_checkin_time(Timestamp acm_checkin_time) {
		this.acm_checkin_time = acm_checkin_time;
	}
	public Timestamp getAcm_ckeckout_time() {
		return acm_ckeckout_time;
	}
	public void setAcm_ckeckout_time(Timestamp acm_ckeckout_time) {
		this.acm_ckeckout_time = acm_ckeckout_time;
	}
	public String getAcm_type() {
		return acm_type;
	}
	public void setAcm_type(String acm_type) {
		this.acm_type = acm_type;
	}
	public String getAcm_room_type() {
		return acm_room_type;
	}
	public void setAcm_room_type(String acm_room_type) {
		this.acm_room_type = acm_room_type;
	}
	public int getAcm_guest_num() {
		return acm_guest_num;
	}
	public void setAcm_guest_num(int acm_guest_num) {
		this.acm_guest_num = acm_guest_num;
	}
	public int getAcm_room_num() {
		return acm_room_num;
	}
	public void setAcm_room_num(int acm_room_num) {
		this.acm_room_num = acm_room_num;
	}
	public int getAcm_bath_num() {
		return acm_bath_num;
	}
	public void setAcm_bath_num(int acm_bath_num) {
		this.acm_bath_num = acm_bath_num;
	}
	public int getAcm_area() {
		return acm_area;
	}
	public void setAcm_area(int acm_area) {
		this.acm_area = acm_area;
	}
	public int getAcm_min_date() {
		return acm_min_date;
	}
	public void setAcm_min_date(int acm_min_date) {
		this.acm_min_date = acm_min_date;
	}
	public String getAcm_bedding() {
		return acm_bedding;
	}
	public void setAcm_bedding(String acm_bedding) {
		this.acm_bedding = acm_bedding;
	}
	public String getAcm_address() {
		return acm_address;
	}
	public void setAcm_address(String acm_address) {
		this.acm_address = acm_address;
	}
	public String getAcm_add_detail() {
		return acm_add_detail;
	}
	public void setAcm_add_detail(String acm_add_detail) {
		this.acm_add_detail = acm_add_detail;
	}
	public String getAcm_title() {
		return acm_title;
	}
	public void setAcm_title(String acm_title) {
		this.acm_title = acm_title;
	}
	
	
	
}
