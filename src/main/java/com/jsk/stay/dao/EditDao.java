package com.jsk.stay.dao;

public interface EditDao {

	public void pwd(String id, String pw);
	public void email(String id, String email);
	public void phone(String id, String phone);
	public void address(String id, String ho_address, String ho_add_detail, int ho_zip);
}
