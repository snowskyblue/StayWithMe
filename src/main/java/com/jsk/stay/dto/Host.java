package com.jsk.stay.dto;

public class Host {

	private int ho_code;
	private int mb_code;
	private String ho_address;
	private String ho_add_detail;
	private String ho_account;
	private String ho_acc_num;
	private int acm_code1;
	private int acm_code2;
	private int acm_code3;
	public Host(int ho_code, int mb_code, String ho_address, String ho_add_detail, String ho_account, String ho_acc_num,
			int acm_code1, int acm_code2, int acm_code3) {
		super();
		this.ho_code = ho_code;
		this.mb_code = mb_code;
		this.ho_address = ho_address;
		this.ho_add_detail = ho_add_detail;
		this.ho_account = ho_account;
		this.ho_acc_num = ho_acc_num;
		this.acm_code1 = acm_code1;
		this.acm_code2 = acm_code2;
		this.acm_code3 = acm_code3;
	}
	public Host() {
		super();
	}
	public int getHo_code() {
		return ho_code;
	}
	public void setHo_code(int ho_code) {
		this.ho_code = ho_code;
	}
	public int getMb_code() {
		return mb_code;
	}
	public void setMb_code(int mb_code) {
		this.mb_code = mb_code;
	}
	public String getHo_address() {
		return ho_address;
	}
	public void setHo_address(String ho_address) {
		this.ho_address = ho_address;
	}
	public String getHo_add_detail() {
		return ho_add_detail;
	}
	public void setHo_add_detail(String ho_add_detail) {
		this.ho_add_detail = ho_add_detail;
	}
	public String getHo_account() {
		return ho_account;
	}
	public void setHo_account(String ho_account) {
		this.ho_account = ho_account;
	}
	public String getHo_acc_num() {
		return ho_acc_num;
	}
	public void setHo_acc_num(String ho_acc_num) {
		this.ho_acc_num = ho_acc_num;
	}
	public int getAcm_code1() {
		return acm_code1;
	}
	public void setAcm_code1(int acm_code1) {
		this.acm_code1 = acm_code1;
	}
	public int getAcm_code2() {
		return acm_code2;
	}
	public void setAcm_code2(int acm_code2) {
		this.acm_code2 = acm_code2;
	}
	public int getAcm_code3() {
		return acm_code3;
	}
	public void setAcm_code3(int acm_code3) {
		this.acm_code3 = acm_code3;
	}
	
	
}
