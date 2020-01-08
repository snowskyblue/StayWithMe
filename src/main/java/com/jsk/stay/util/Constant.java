package com.jsk.stay.util;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.PlatformTransactionManager;

import com.jsk.stay.dao.LoginDao;
import com.jsk.stay.dto.MemberDto;

public class Constant {
	@Autowired
	private SqlSession sqlSession;
	
	public static JdbcTemplate template; 
	public static PlatformTransactionManager transactionManager;
	public static LoginDao dao;
	
	public MemberDto login(String mb_id) {
		System.out.println("id = " + mb_id);
		return (MemberDto)sqlSession.selectOne("loginDao",mb_id);
	}
}