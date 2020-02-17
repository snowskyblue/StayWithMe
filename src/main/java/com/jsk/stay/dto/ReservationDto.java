package com.jsk.stay.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class ReservationDto {
	private String res_code;
	private String mb_id;
	private int acm_code;
	private String res_pay_method;
	private int res_amount;
	private Timestamp res_pay_date;
	private int res_guest_num;
	private Date res_checkin_date;
	private Date res_checkout_date;
	private boolean res_confirm;
	
	public String getRes_code() {
		return res_code;
	}
	public void setRes_code(String res_code) {
		this.res_code = res_code;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public int getAcm_code() {
		return acm_code;
	}
	public void setAcm_code(int acm_code) {
		this.acm_code = acm_code;
	}
	public String getRes_pay_method() {
		return res_pay_method;
	}
	public void setRes_pay_method(String res_pay_method) {
		this.res_pay_method = res_pay_method;
	}
	public int getRes_amount() {
		return res_amount;
	}
	public void setRes_amount(int res_amount) {
		this.res_amount = res_amount;
	}
	public Timestamp getRes_pay_date() {
		return res_pay_date;
	}
	public void setRes_pay_date(Timestamp res_pay_date) {
		this.res_pay_date = res_pay_date;
	}
	public int getRes_guest_num() {
		return res_guest_num;
	}
	public void setRes_guest_num(int res_guest_num) {
		this.res_guest_num = res_guest_num;
	}
	public Date getRes_checkin_date() {
		return res_checkin_date;
	}
	public void setRes_checkin_date(Date res_checkin_date) {
		this.res_checkin_date = res_checkin_date;
	}
	public Date getRes_checkout_date() {
		return res_checkout_date;
	}
	public void setRes_checkout_date(Date res_checkout_date) {
		this.res_checkout_date = res_checkout_date;
	}
	public boolean isRes_confirm() {
		return res_confirm;
	}
	public void setRes_confirm(boolean res_confirm) {
		this.res_confirm = res_confirm;
	}
	public ReservationDto(String res_code, String mb_id, int acm_code, String res_pay_method, int res_amount,
			Timestamp res_pay_date, int res_guest_num, Date res_checkin_date, Date res_checkout_date,
			boolean res_confirm) {
		super();
		this.res_code = res_code;
		this.mb_id = mb_id;
		this.acm_code = acm_code;
		this.res_pay_method = res_pay_method;
		this.res_amount = res_amount;
		this.res_pay_date = res_pay_date;
		this.res_guest_num = res_guest_num;
		this.res_checkin_date = res_checkin_date;
		this.res_checkout_date = res_checkout_date;
		this.res_confirm = res_confirm;
	}
	public ReservationDto() {
		super();
	}
	
	public ReservationDto(String res_code, String mb_id, int acm_code, String res_pay_method, int res_amount,
			 int res_guest_num, Date res_checkin_date, Date res_checkout_date) {
		super();
		this.res_code = res_code;
		this.mb_id = mb_id;
		this.acm_code = acm_code;
		this.res_pay_method = res_pay_method;
		this.res_amount = res_amount;
		this.res_guest_num = res_guest_num;
		this.res_checkin_date = res_checkin_date;
		this.res_checkout_date = res_checkout_date;
	}
}
