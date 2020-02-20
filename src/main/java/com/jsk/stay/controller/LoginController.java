package com.jsk.stay.controller;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.jsk.stay.dao.LoginDao;
import com.jsk.stay.dto.MemberDto;
import com.jsk.stay.naver.NaverLoginBO;
import com.jsk.stay.util.Constant;

import net.sf.json.JSON;
import net.sf.json.JSONArray;

@Controller
public class LoginController {
	
	private LoginDao dao;
	
	private String apiResult = null;
	
	private NaverLoginBO naverLoginBO;
	
	private JdbcTemplate template;
	private PlatformTransactionManager transactionManager;
	private TransactionTemplate transactionTemplate;
	
	//bean주입은 스프링 콘테이너 생성이 필요없는 @Autowired어노테이션을 사용
	//생성자 , 필드 ,set메서드로 bean생성
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constant.template = this.template;
	}
	
	@Autowired
	public void setTransactionManager(PlatformTransactionManager transactionManager) {
		this.transactionManager = transactionManager;
		Constant.transactionManager = this.transactionManager;
	}
	@Autowired
	public void setTransactionTemplate(TransactionTemplate transactionTemplate) {
		this.transactionTemplate = transactionTemplate;
		Constant.transactionTemplate = this.transactionTemplate;
	}

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
			@RequestParam(value = "error", required = false) String error) {

		ModelAndView model = new ModelAndView();
		if (log != null) {
			model.addObject("log", "before login!");
		}
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}
		
		model.setViewName("login");

		return model;
	}

	@RequestMapping("/index")
	public ModelAndView index(
			@RequestParam(value = "logout", required = false) String logout,
			@RequestParam(value = "loginS", required = false) String loginS,
			@RequestParam(value = "reservation", required = false) String reservation,
			HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		if (loginS != null) {
			Constant.visitMN += 1;
			System.out.println("로그인");
		}
		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		if (reservation != null) {
			model.addObject("reservation", "예약이 완료 되었습니다.");
		}
		model.setViewName("index");
		return model;
	}
	@RequestMapping("logout")
	public String logout() {
		return "logout";
	}
	
	@RequestMapping(value = "socialPhone", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, HttpServletRequest request,HttpServletResponse response, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws Exception {
		System.out.println("여기는  callback");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
       //로그인 사용자 정보를 읽어온다.
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
	    
	    JSONParser parser = new JSONParser();
	    
	    JSONObject object = (JSONObject)parser.parse(apiResult);
	    System.out.println("1" + object);
	    
	    String parse_response1 = (String)object.get("resultcode");
	    String parse_response2 = (String)object.get("message");
	    JSONObject parse_response3 = (JSONObject)object.get("response");
	    
	    System.out.println("2" + parse_response3);
	    System.out.println("3" + parse_response2);
	    System.out.println("4" + parse_response1);
	    
	    String id = (String) parse_response3.get("id");
	    		
	    String name = (String) parse_response3.get("name");
	    
	    String pwd = (String) parse_response3.get("name"); 
	    
	    String email = (String) parse_response3.get("email");
	    
	    String gender1 = (String) parse_response3.get("gender");
	    char[] gender2 = gender1.toCharArray();
	    char gender = gender2[0];
	    
	    String birthday = (String) parse_response3.get("birthday");
	    
	    MemberDto dto = new MemberDto(id,pwd,name,birthday,gender,email);
	    
	    MemberDto dto1 = dao.information(id);
	    System.out.println(dto1);
	    
	    if(dto1 != null) {
	    	return "index";
	    }
	    model.addAttribute("apiResult",apiResult);

		return "socialPhone";
	}
	
	@RequestMapping(value = "nlogin", method = { RequestMethod.GET, RequestMethod.POST })
	public void nlogin(Model model, HttpSession session,HttpServletResponse response) throws IOException {
		
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//인증 URL을 생성
		
		System.out.println("네이버" + naverAuthUrl);
		
		// 생성한 인증 URL을 View로 전달
		response.sendRedirect(naverAuthUrl);
	}
	
	@RequestMapping("socialLogin")
	public void socialLogin(Model model, HttpServletRequest request) throws Exception {
		System.out.println("소환");
		
		String apiResult = request.getParameter("apiResult");
		
		JSONParser parser = new JSONParser();
	    
	    JSONObject object = (JSONObject)parser.parse(apiResult);
	    System.out.println("1" + object);
	    
	    String parse_response1 = (String)object.get("resultcode");
	    String parse_response2 = (String)object.get("message");
	    JSONObject parse_response3 = (JSONObject)object.get("response");
	    
	    System.out.println("2" + parse_response3);
	    System.out.println("3" + parse_response2);
	    System.out.println("4" + parse_response1);
	    
	    String id = (String) parse_response3.get("id");
	    		
	    String name = (String) parse_response3.get("name");
	    
	    String pwd = (String) parse_response3.get("name"); 
	    
	    String email = (String) parse_response3.get("email");
	    
	    String gender1 = (String) parse_response3.get("gender");
	    char[] gender2 = gender1.toCharArray();
	    char gender = gender2[0];
	    
	    String birthday = (String) parse_response3.get("birthday");
	    
	    MemberDto dto = new MemberDto(id,pwd,name,birthday,gender,email);
		
		String mb_phone = request.getParameter("mb_phone");
		System.out.println(mb_phone);
		
		System.out.println(dto.getMb_birthdate());
		
		dto.setMb_phone(mb_phone);
		System.out.println(dto);
		
		dao.socialLogin(dto);
		
	}
	
}