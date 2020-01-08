package com.jsk.stay.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;

import com.jsk.stay.util.Constant;


public class AcmDao {
	
	JdbcTemplate template;
	
	public AcmDao() {
		this.template = Constant.template;
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
						final String acm_rule,
						final String acm_address,
						final String acm_add_detail,
						final int acm_zip, 
						final String acm_checkin_time,
						final String acm_checkout_time, 
						final String acm_img, 
						final String acm_availdate
			) {
		this.template.update(new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				
				System.out.println("dao≈¨∑°Ω∫");
				String query = "insert into accommodation ( acm_code, acm_type,"
						+ "acm_room_type,acm_bedding,acm_guest_num,acm_room_num,"
						+ "acm_bath_num,acm_area,acm_charge,acm_title,acm_info,acm_rule,acm_address,acm_add_detail,acm_zip,acm_checkin_time,acm_checkout_time,acm_img,acm_AVAILDATE) "
						+ "values (PP_SEQ.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
				pstmt.setString(11, acm_rule);
				pstmt.setString(12, acm_address);
				pstmt.setString(13, acm_add_detail);
				pstmt.setInt(14, acm_zip);
				pstmt.setString(15, acm_checkin_time);
				pstmt.setString(16, acm_checkout_time);
				pstmt.setString(17, acm_img);
				pstmt.setString(18, acm_availdate);
				
				return pstmt;
			}
		});
	}
}
