package com.jsk.stay.dao;

import java.sql.SQLException;

public interface FindIdPwdDao {
	public String findId_phoneCheck(String mb_name, String mb_phone);
}
