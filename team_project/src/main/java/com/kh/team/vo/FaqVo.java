package com.kh.team.vo;

public class FaqVo {
	private int faq_seq;
	private String faq_title;
	private String faq_content;
	
	public FaqVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FaqVo(int faq_seq, String faq_title, String faq_content) {
		super();
		this.faq_seq = faq_seq;
		this.faq_title = faq_title;
		this.faq_content = faq_content;
	}

	public int getFaq_seq() {
		return faq_seq;
	}

	public void setFaq_seq(int faq_seq) {
		this.faq_seq = faq_seq;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	@Override
	public String toString() {
		return "FaqVo [faq_seq=" + faq_seq + ", faq_title=" + faq_title + ", faq_content=" + faq_content + "]";
	}
	
}
