package com.jsk.stay.dto;

import java.sql.Timestamp;

public class Member {
	private int mb_code;
	private String mb_id;
	private String mb_name;
	private String mb_pwd;
	private Timestamp mb_birthdate;
	private String mb_sex;
	private int mb_phone;
	private String mb_email;
	private Timestamp mb_signin;
	private Timestamp mb_signout;
	private String mb_temppwd;
	private boolean mb_host;
	private String mb_profile;
	private String mb_grade;
	public int getMb_code() {
		return mb_code;
	}
	
	public Member(int mb_code, String mb_id, String mb_name, String mb_pwd, Timestamp mb_birthdate, String mb_sex,
			int mb_phone, String mb_email, Timestamp mb_signin, Timestamp mb_signout, String mb_temppwd,
			boolean mb_host, String mb_profile, String mb_grade) {
		super();
		this.mb_code = mb_code;
		this.mb_id = mb_id;
		this.mb_name = mb_name;
		this.mb_pwd = mb_pwd;
		this.mb_birthdate = mb_birthdate;
		this.mb_sex = mb_sex;
		this.mb_phone = mb_phone;
		this.mb_email = mb_email;
		this.mb_signin = mb_signin;
		this.mb_signout = mb_signout;
		this.mb_temppwd = mb_temppwd;
		this.mb_host = mb_host;
		this.mb_profile = mb_profile;
		this.mb_grade = mb_grade;
	}
	public Member() {
		super();
	}
	
	public void setMb_code(int mb_code) {
		this.mb_code = mb_code;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getMb_name() {
		return mb_name;
	}
	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}
	public String getMb_pwd() {
		return mb_pwd;
	}
	public void setMb_pwd(String mb_pwd) {
		this.mb_pwd = mb_pwd;
	}
	public Timestamp getMb_birthdate() {
		return mb_birthdate;
	}
	public void setMb_birthdate(Timestamp mb_birthdate) {
		this.mb_birthdate = mb_birthdate;
	}
	public String getMb_sex() {
		return mb_sex;
	}
	public void setMb_sex(String mb_sex) {
		this.mb_sex = mb_sex;
	}
	public int getMb_phone() {
		return mb_phone;
	}
	public void setMb_phone(int mb_phone) {
		this.mb_phone = mb_phone;
	}
	public String getMb_email() {
		return mb_email;
	}
	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}
	public Timestamp getMb_signin() {
		return mb_signin;
	}
	public void setMb_signin(Timestamp mb_signin) {
		this.mb_signin = mb_signin;
	}
	public Timestamp getMb_signout() {
		return mb_signout;
	}
	public void setMb_signout(Timestamp mb_signout) {
		this.mb_signout = mb_signout;
	}
	public String getMb_temppwd() {
		return mb_temppwd;
	}
	public void setMb_temppwd(String mb_temppwd) {
		this.mb_temppwd = mb_temppwd;
	}
	public boolean isMb_host() {
		return mb_host;
	}
	public void setMb_host(boolean mb_host) {
		this.mb_host = mb_host;
	}
	public String getMb_profile() {
		return mb_profile;
	}
	public void setMb_profile(String mb_profile) {
		this.mb_profile = mb_profile;
	}
	public String getMb_grade() {
		return mb_grade;
	}
	public void setMb_grade(String mb_grade) {
		this.mb_grade = mb_grade;
	}

	

}
