package com.jsk.stay.controller;

import java.io.File;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jsk.stay.command.AcmCommand;
import com.jsk.stay.command.AcmWriteCommand;
import com.jsk.stay.util.Constant;

@Controller
@MultipartConfig(maxFileSize=1024*1024*4,location="D:/upimage/") //다운로드
public class AcmController {
	
	AcmCommand command = null;
	private JdbcTemplate template;
	/*transaction*/
	private PlatformTransactionManager transactionManager;
	
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
	
	@RequestMapping("/addAcm")
	public String addAcm() {
		return "addAcm";
	}
	
	@RequestMapping("/write") //다중 파일 업로드 처리
	public String write(MultipartHttpServletRequest mtfRequest, HttpServletRequest request, Model model) {
		System.out.println("write()");
		
		//복수개의 파일을 얻기 위해 getFiles(form의 name속성)
		List<MultipartFile> fileList = mtfRequest.getFiles("acm_img");
		System.out.println("멀티파트파일 리스트를 form의 리퀘스트에서부터 얻어냄");
		//MultipartFile객체를 얻어냄, 이때는 getParameter(일반 input)대신 getFile() 메서드 사용
		String path = "D:/upimage/"; //업로드된 파일 저장 위치
		String fileRoots = "";
		for (MultipartFile mf : fileList) {
			//폼에서 전달된 파일 이름
			String orginFileName = mf.getOriginalFilename();
			//업로드된 파일크기
			long fileSize = mf.getSize();
			System.out.println("originFileName: "+ orginFileName);
			System.out.println("fileSize: "+ fileSize );
			String safeFile = path + System.currentTimeMillis() + orginFileName; //pathname
			String dfile = System.currentTimeMillis() + orginFileName;
			System.out.println(" dfile: "+  dfile );
			String fileRoot = path + dfile; //db에 저장될 파일 전체 경로
			fileRoots += fileRoot + " ";
			try {
				mf.transferTo(new File(safeFile));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println(fileRoots);
		model.addAttribute("fileRoots", fileRoots);
		
		model.addAttribute("request", request);
		command = new AcmWriteCommand();
		System.out.println("컨트롤러에서 커맨드클래스 생성 완료");
		command.execute(model);
		System.out.println("컨트롤러에서 커맨드클래스의 엑스큐트메서드 호출 완료");
		return "index";
		
	}
	/*@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		System.out.println("write()");
		
		model.addAttribute("request", request);
		command = new AcmWriteCommand();
		System.out.println("컨트롤러에서 커맨드클래스 생성 완료");
		command.execute(model);
		System.out.println("컨트롤러에서 커맨드클래스의 엑스큐트메서드 호출 완료");
		return "index";
		
	}*/
}
