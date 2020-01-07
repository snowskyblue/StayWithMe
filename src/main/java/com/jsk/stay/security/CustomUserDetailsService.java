package com.jsk.stay.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.jsk.stay.dao.MDao;
import com.jsk.stay.dto.MemberDto;
import com.jsk.stay.util.Constant;

//spring security를 사용하면 클라이언트에서 요청(j_spring_security_check)하면 이곳으로 요청됨
public class CustomUserDetailsService implements UserDetailsService{
	
	@Override //security에서 호출하는 메서드
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MDao dao = Constant.dao;
		MemberDto dto = dao.login(username);
		
		System.out.println("dto" + dto);
		if(dto == null) {
			System.out.println("null");
			throw  new UsernameNotFoundException("No user found with username");
		}
		String pw = dto.getMb_pwd();
		System.out.println("pw : " + pw);
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		roles.add(new SimpleGrantedAuthority("ROLE_USER")); //변경
		UserDetails user = new User(username, pw , roles);

		return user;
	}
}
