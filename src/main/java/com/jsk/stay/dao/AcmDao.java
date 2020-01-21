package com.jsk.stay.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.transaction.support.TransactionTemplate;

import com.jsk.stay.util.Constant;

public class AcmDao {
	
	JdbcTemplate template;
	PlatformTransactionManager transactionManager;
	TransactionTemplate transactionTemplate;
	
	public AcmDao() {
		this.template = Constant.template;
		this.transactionManager = Constant.transactionManager;
		this.transactionTemplate = Constant.transactionTemplate;
	}
	
	//setter methods
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public void setTransactionManager(PlatformTransactionManager transactionManager) {
		this.transactionManager = transactionManager;
	}
	
	public void setTransactionTemplate(TransactionTemplate transactionTemplate) {
		this.transactionTemplate = transactionTemplate;
	}
	
	public void write(
						final String acm_type,
						final String acm_room_type ,
						final String acm_bedding,
						final int acm_guest_num,
						final int acm_room_num,
						final int acm_bath_num,
						final int acm_area,
						final int acm_charge,
						final String acm_title,
						final String acm_info,
						final String acm_address,
						final String acm_add_detail,
						final int acm_zip, 
						final String acm_checkin_time,
						final String acm_checkout_time,
						final String acm_availdate, 
						String[] rules
						,String[] amenities
			) {
		//transaction 실행 방식
		TransactionDefinition definition = new DefaultTransactionDefinition();
		//transaction 상태
		TransactionStatus status = transactionManager.getTransaction(definition);
		try {
			template.update(new PreparedStatementCreator() {
				
				@Override
				public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
					
					System.out.println("dao클래스의 첫번째 update메서드accommodation PP_SEQ.nextval");
					String query = "insert into accommodation ( acm_code, acm_type,"
							+ "acm_room_type,acm_bedding,acm_guest_num,acm_room_num,"
							+ "acm_bath_num,acm_area,acm_charge,acm_title,acm_info,acm_address,acm_add_detail,acm_zip,acm_checkin_time,acm_checkout_time,acm_AVAILDATE) "
							+ "values (PP_SEQ.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					PreparedStatement pstmt = con.prepareStatement(query);
					pstmt.setString(1, acm_type);
					pstmt.setString(2, acm_room_type);
					pstmt.setString(3, acm_bedding);
					pstmt.setInt(4, acm_guest_num);
					pstmt.setInt(5, acm_room_num);
					pstmt.setInt(6, acm_bath_num);
					pstmt.setInt(7, acm_area);
					pstmt.setInt(8, acm_charge);
					pstmt.setString(9, acm_title);
					pstmt.setString(10, acm_info);
					/*pstmt.setString(11, acm_rule);*/
					pstmt.setString(11, acm_address);
					pstmt.setString(12, acm_add_detail);
					pstmt.setInt(13, acm_zip);
					pstmt.setString(14, acm_checkin_time);
					pstmt.setString(15, acm_checkout_time);
					pstmt.setString(16, acm_availdate);
					
					return pstmt;
				}
			});
			
			if(rules != null){
				for(int i=0; i < rules.length; i++) {
					final int x = i;
					template.update(new PreparedStatementCreator() {
						@Override
						public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
							System.out.println("dao클래스의 두번째 udate메서드 ACM_SUB rules PP_SEQ.currval");
							String query = "insert into ACM_SUB (acm_code, acm_rule) "
									+ "values (PP_SEQ.currval,?)";
							PreparedStatement pstmt = con.prepareStatement(query);
							pstmt.setString(1, rules[x]);
							return pstmt;
						}
					});
				}
			}
			
			if(amenities != null){
				for(int i=0; i < amenities.length; i++) {
					final int x = i;
					template.update(new PreparedStatementCreator() {
						@Override
						public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
							System.out.println("dao클래스의 세번째 udate메서드 ACM_SUB amenities PP_SEQ.currval");
							String query = "insert into ACM_SUB (acm_code, acm_amenity) "
									+ "values (PP_SEQ.currval,?)";
							PreparedStatement pstmt = con.prepareStatement(query);
							pstmt.setString(1, amenities[x]);
							return pstmt;
						}
					});
				}
			}
			
			transactionManager.commit(status); //정상처리시(DB에 commit)
		} catch(Exception e) {
			e.printStackTrace();
			transactionManager.rollback(status);
		}
		
	}
}
