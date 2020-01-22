package com.jsk.stay.dao;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.jsk.stay.dto.MemberDto;
import com.jsk.stay.util.Constant;

public class LoginDao implements IDao {
	
	JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	@Autowired
	private SqlSession sqlSession; //MYBatis�� ����ϱ� ���� ������ �������
	
	
	public LoginDao() {
		Constant.template = this.template;
	}

	@Override
	public MemberDto login(String mb_id) {
		System.out.println("id = " + mb_id);
		MemberDto memberDto = (MemberDto)sqlSession.selectOne("loginDao",mb_id);
		return memberDto;
	}

}
