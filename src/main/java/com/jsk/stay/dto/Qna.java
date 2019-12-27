package com.jsk.stay.dto;

public class Qna {
	private int admin_code;
	private String qna_title;
	private String qna_content;
	public int getAdmin_code() {
		return admin_code;
	}
	public void setAdmin_code(int admin_code) {
		this.admin_code = admin_code;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Qna() {
		super();
	}
	public Qna(int admin_code, String qna_title, String qna_content) {
		super();
		this.admin_code = admin_code;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
	}
	
	
}
