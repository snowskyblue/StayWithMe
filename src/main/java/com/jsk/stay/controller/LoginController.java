package com.jsk.stay.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.jsk.stay.dao.LoginDao;
import com.jsk.stay.naver.NaverLoginBO;
import com.jsk.stay.util.Constant;

@Controller
public class LoginController {
	
	private LoginDao dao;
	
	private String apiResult = null;
	
	private NaverLoginBO naverLoginBO;
	//naverLoginBO변수를 만들어주기
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@Autowired
	public void setDao(LoginDao dao) {
		this.dao = dao;
		Constant.dao = this.dao;
	}
	

	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView loginform(@RequestParam(value = "log", required = false) String log,
			@RequestParam(value = "error", required = false) String error,HttpSession session, Model mo) {

		ModelAndView model = new ModelAndView();
		if (log != null) {
			model.addObject("log", "before login!");
		}
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버" + naverAuthUrl);
		mo.addAttribute("url", naverAuthUrl);
		
		
		model.setViewName("login");

		return model;
	}

	@RequestMapping("/index")
	public ModelAndView index(
			@RequestParam(value = "success", required = false) String success,
			@RequestParam(value = "logout", required = false) String logout) {
		ModelAndView model = new ModelAndView();
		if (success != null) {
			model.addObject("success", "before login!");
		}
		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("index");
		return model;
	}
	@RequestMapping("logout")
	public String logout() {
		return "logout";
	}
	
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		System.out.println("여기는  callback");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
       //로그인 사용자 정보를 읽어온다.
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
		model.addAttribute("result", apiResult);
                
		return "naverSuccess";
	}

}
