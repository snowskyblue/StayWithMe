package com.jsk.stay.dto;

public class Review {

	private int acm_code;
	private int mb_code;
	private String rev_comment;
	private String rev_img;
	private int rev_star;
	public Review(int acm_code, int mb_code, String rev_comment, String rev_img, int rev_star) {
		super();
		this.acm_code = acm_code;
		this.mb_code = mb_code;
		this.rev_comment = rev_comment;
		this.rev_img = rev_img;
		this.rev_star = rev_star;
	}
	public Review() {
		super();
	}
	public int getAcm_code() {
		return acm_code;
	}
	public void setAcm_code(int acm_code) {
		this.acm_code = acm_code;
	}
	public int getMb_code() {
		return mb_code;
	}
	public void setMb_code(int mb_code) {
		this.mb_code = mb_code;
	}
	public String getRev_comment() {
		return rev_comment;
	}
	public void setRev_comment(String rev_comment) {
		this.rev_comment = rev_comment;
	}
	public String getRev_img() {
		return rev_img;
	}
	public void setRev_img(String rev_img) {
		this.rev_img = rev_img;
	}
	public int getRev_star() {
		return rev_star;
	}
	public void setRev_star(int rev_star) {
		this.rev_star = rev_star;
	}
	
	
}
