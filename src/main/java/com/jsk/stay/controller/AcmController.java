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
@MultipartConfig(maxFileSize=1024*1024*4,location="D:/upimage/") //�ٿ�ε�
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
		
	}
	/*@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		System.out.println("write()");
		
		model.addAttribute("request", request);
		command = new AcmWriteCommand();
		System.out.println("��Ʈ�ѷ����� Ŀ�ǵ�Ŭ���� ���� �Ϸ�");
		command.execute(model);
		System.out.println("��Ʈ�ѷ����� Ŀ�ǵ�Ŭ������ ����ťƮ�޼��� ȣ�� �Ϸ�");
		return "index";
		
	}*/
}
