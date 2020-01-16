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
						final String acm_img, 
						final String acm_availdate, 
						String ame_wifi, String ame_tv, String ame_kitchen, String ame_aircon, String ame_room_lock, String ame_towel, String ame_washer, String ame_dryer, String ame_shower, String ame_hair_dryer, String ame_fan, String ame_extinguisher, String ame_balcony, String ame_garden, String ame_heater, String ame_infodesk, String ame_breakfast, String ame_bbq, String ame_park
						, String[] rules
			) {
		System.out.println("AcmDao 클래스에서 " + ame_wifi + ame_park);
		//transaction 실행 방식
		TransactionDefinition definition = new DefaultTransactionDefinition();
		//transaction 상태
		TransactionStatus status = transactionManager.getTransaction(definition);
		try {
			template.update(new PreparedStatementCreator() {
				
				@Override
				public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
					
					System.out.println("dao클래스 PP_SEQ.nextval");
					String query = "insert into accommodation ( acm_code, acm_type,"
							+ "acm_room_type,acm_bedding,acm_guest_num,acm_room_num,"
							+ "acm_bath_num,acm_area,acm_charge,acm_title,acm_info,acm_address,acm_add_detail,acm_zip,acm_checkin_time,acm_checkout_time,acm_img,acm_AVAILDATE) "
							+ "values (PP_SEQ.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
					pstmt.setString(16, acm_img);
					pstmt.setString(17, acm_availdate);
					
					return pstmt;
				}
			});

			template.update(new PreparedStatementCreator() {
				
				@Override
				public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
					
					System.out.println("dao클래스의 두번째 udate문 PP_SEQ.currval");
					String query = "insert into amenity (acm_code, ame_wifi,  ame_tv,  ame_kitchen,  ame_aircon,  ame_room_lock,ame_towel,  ame_washer,  ame_dryer,  ame_shower,  ame_hair_dryer, ame_fan,  ame_extinguisher,  ame_balcony,  ame_garden,  ame_heater, ame_infodesk,ame_breakfast, ame_bbq, ame_park) "
							+ "values (PP_SEQ.currval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					PreparedStatement pstmt = con.prepareStatement(query);
					pstmt.setString(1, ame_wifi);
					pstmt.setString(2, ame_tv);
					pstmt.setString(3, ame_kitchen );
					pstmt.setString(4, ame_aircon);
					pstmt.setString(5, ame_room_lock);
					pstmt.setString(6, ame_towel);
					pstmt.setString(7, ame_washer);
					pstmt.setString(8, ame_dryer);
					pstmt.setString(9, ame_shower);
					pstmt.setString(10, ame_hair_dryer);
					pstmt.setString(11, ame_fan);
					pstmt.setString(12, ame_extinguisher);
					pstmt.setString(13, ame_balcony);
					pstmt.setString(14, ame_garden);
					pstmt.setString(15, ame_heater);
					pstmt.setString(16, ame_infodesk);
					pstmt.setString(17, ame_breakfast);
					pstmt.setString(18, ame_bbq);
					pstmt.setString(19, ame_park);
					
					return pstmt;
				}
			});
			
			if(rules != null){
				for(int i=0; i < rules.length; i++) {
					final int x = i;
					template.update(new PreparedStatementCreator() {
						@Override
						public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
							System.out.println("dao클래스의 세번째 udate문 PP_SEQ.currval");
							String query = "insert into ACM_SUB (acm_code, acm_rule) "
									+ "values (PP_SEQ.currval,?)";
							PreparedStatement pstmt = con.prepareStatement(query);
							pstmt.setString(1, rules[x]);
							return pstmt;
						}
					});
				}
			}
			
			
			
			/*template.update(psc);
			 * String[] rules = request.getParameterValues("acm_rule");       

        		if(rules != null){
		        	for(int i=0; i < rules.length; i++)
		        	String sql = "insert into test values" + "("+ rules[i] +")" ;
		        	
		        	}
        }
        */
			
			transactionManager.commit(status); //정상처리시(DB에 commit)
		} catch(Exception e) {
			e.printStackTrace();
			transactionManager.rollback(status);
		}
		
	}
}
