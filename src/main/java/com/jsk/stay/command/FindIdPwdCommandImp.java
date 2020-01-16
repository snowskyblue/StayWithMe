package com.jsk.stay.command;

import com.jsk.stay.dao.AcmDao;
import com.jsk.stay.dao.FindIdPwdDaoImp;

public class FindIdPwdCommandImp implements FindIdPwdCommand {
	@Override
	public String findId_phoneCheck(String mb_name, String mb_phone) {
		FindIdPwdDaoImp dao = new FindIdPwdDaoImp();
		System.out.println("FindIdPwdCommand");
		return dao.findId_phoneCheck(mb_name, mb_phone);
	}
}
