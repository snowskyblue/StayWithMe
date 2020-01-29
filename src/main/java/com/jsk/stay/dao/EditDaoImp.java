package com.jsk.stay.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class EditDaoImp implements EditDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void pwd(String id, String pw) {
		
		sqlSession.update(id,pw);
	}

}
