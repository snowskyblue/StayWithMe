package com.jsk.stay.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
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
@MultipartConfig(maxFileSize=1024*1024*4)
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
	/*
	@RequestMapping("/write") //���� ���� ���ε� ó��
	public String write(MultipartHttpServletRequest mtfRequest, HttpServletRequest request, Model model) {
		System.out.println("write()");
		
		//�������� ������ ��� ���� getFiles(form�� name�Ӽ�)
		List<MultipartFile> fileList = mtfRequest.getFiles("acm_img");
		System.out.println("��Ƽ��Ʈ���� ����Ʈ�� form�� ������Ʈ�������� ��");
		//MultipartFile��ü�� ��, �̶��� getParameter(�Ϲ� input)��� getFile() �޼��� ���
		String path = "D:/upimage/"; //���ε�� ���� ���� ��ġ
		String fileRoots = "";
		for (MultipartFile mf : fileList) {
			//������ ���޵� ���� �̸�
			String orginFileName = mf.getOriginalFilename();
			//���ε�� ����ũ��
			long fileSize = mf.getSize();
			System.out.println("originFileName: "+ orginFileName);
			System.out.println("fileSize: "+ fileSize );
			String safeFile = path + System.currentTimeMillis() + orginFileName; //pathname
			String dfile = System.currentTimeMillis() + orginFileName;
			System.out.println(" dfile: "+  dfile );
			String fileRoot = path + dfile; //db�� ����� ���� ��ü ���
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
		System.out.println("��Ʈ�ѷ����� Ŀ�ǵ�Ŭ���� ���� �Ϸ�");
		command.execute(model);
		System.out.println("��Ʈ�ѷ����� Ŀ�ǵ�Ŭ������ ����ťƮ�޼��� ȣ�� �Ϸ�");
		return "index";
		
	}*/
	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		System.out.println("write()");
		
		model.addAttribute("request", request);
		command = new AcmWriteCommand();
		System.out.println("��Ʈ�ѷ����� Ŀ�ǵ�Ŭ���� ���� �Ϸ�");
		command.execute(model);
		System.out.println("��Ʈ�ѷ����� Ŀ�ǵ�Ŭ������ ����ťƮ�޼��� ȣ�� �Ϸ�");
		return "hostJoin";
		
	}
	
	@RequestMapping("ckedit")
	public void ckedit(MultipartHttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("ckedit ����");
		String path = "/stay/editUpload";
		String real_save_path = request.getServletContext().getRealPath(path);
		System.out.println("real_save_path " + real_save_path);
		MultipartFile mf = request.getFile("upload");
		String originFileName = mf.getOriginalFilename();
		System.out.println("originFileName " + originFileName);
		long fileSize = mf.getSize(); 
		System.out.println("originFileName : " + originFileName);
		System.out.println("fileSize of the MultipartFile : " + fileSize);	
		String safeFile ="D:/webSpring_workspace/stay/src/main/webapp/resources/editUpload/" + originFileName;
		String safeFile1 ="D:/tomcat/apache-tomcat-8.5.47/wtpwebapps/stay/resources/editUpload/" + originFileName;		
		System.out.println("safeFile : " + safeFile);
		try {
			mf.transferTo(new File(safeFile));
			mf.transferTo(new File(safeFile1));
		} catch (Exception e) {			
			e.printStackTrace();
		}
		JSONObject outData = new JSONObject(); //json ��ü ����
		outData.put("uploaded", true);
		//��û ���(Scheme : �������� http ServerName:localhost ServerPort:8181
		outData.put("url", request.getScheme() + "://" + request.getServerName() + ":" + 
				request.getServerPort() + path + "/" + originFileName);
		
		System.out.println(request.getScheme() + "://" + request.getServerName() + ":" + 
				request.getServerPort() + path + "/" + originFileName);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(outData.toString());
	}
}
