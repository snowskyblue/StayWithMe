package com.jsk.stay.dao;

import com.jsk.stay.dto.MemberDto;

public interface EditDao {

	public void myPagePwd(String id, String pw);
	public void myPageEmail(String id, String email);
	public void myPagePhone(String id, String phone);
	public void myPageAddress(String id, String ho_address, String ho_add_detail, int ho_zip);
}
