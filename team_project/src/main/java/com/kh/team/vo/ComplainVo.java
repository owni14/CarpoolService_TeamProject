package com.kh.team.vo;

import java.sql.Date;

public class ComplainVo {
	private int complain_seq;
	private String admin_code;
	private String m_id;
	private String complain_content;
	private Date complain_regdate;
	private int complain_group;
	private String complain_attach_file;
	private String complain_classification;
	private String complain_is_finish;
	private String complain_answer;
	
	public ComplainVo() {
		super();
	}

	public ComplainVo(String admin_code, String m_id, String complain_content, String complain_classification) {
		super();
		this.admin_code = admin_code;
		this.m_id = m_id;
		this.complain_content = complain_content;
		this.complain_classification = complain_classification;
	}

	public ComplainVo(int complain_seq, String admin_code, String m_id, String complain_content, Date complain_regdate,
			int complain_group, String complain_attach_file, String complain_classification, String complain_is_finish,
			String complain_answer) {
		super();
		this.complain_seq = complain_seq;
		this.admin_code = admin_code;
		this.m_id = m_id;
		this.complain_content = complain_content;
		this.complain_regdate = complain_regdate;
		this.complain_group = complain_group;
		this.complain_attach_file = complain_attach_file;
		this.complain_classification = complain_classification;
		this.complain_is_finish = complain_is_finish;
		this.complain_answer = complain_answer;
	}

	public int getComplain_seq() {
		return complain_seq;
	}

	public void setComplain_seq(int complain_seq) {
		this.complain_seq = complain_seq;
	}

	public String getAdmin_code() {
		return admin_code;
	}

	public void setAdmin_code(String admin_code) {
		this.admin_code = admin_code;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getComplain_content() {
		return complain_content;
	}

	public void setComplain_content(String complain_content) {
		this.complain_content = complain_content;
	}

	public Date getComplain_regdate() {
		return complain_regdate;
	}

	public void setComplain_regdate(Date complain_regdate) {
		this.complain_regdate = complain_regdate;
	}

	public int getComplain_group() {
		return complain_group;
	}

	public void setComplain_group(int complain_group) {
		this.complain_group = complain_group;
	}

	public String getComplain_attach_file() {
		return complain_attach_file;
	}

	public void setComplain_attach_file(String complain_attach_file) {
		this.complain_attach_file = complain_attach_file;
	}

	public String getComplain_classification() {
		return complain_classification;
	}

	public void setComplain_classification(String complain_classification) {
		this.complain_classification = complain_classification;
	}

	public String getComplain_is_finish() {
		return complain_is_finish;
	}

	public void setComplain_is_finish(String complain_is_finish) {
		this.complain_is_finish = complain_is_finish;
	}

	public String getComplain_answer() {
		return complain_answer;
	}

	public void setComplain_answer(String complain_answer) {
		this.complain_answer = complain_answer;
	}

	@Override
	public String toString() {
		return "ComplainVo [complain_seq=" + complain_seq + ", admin_code=" + admin_code + ", m_id=" + m_id
				+ ", complain_content=" + complain_content + ", complain_regdate=" + complain_regdate
				+ ", complain_group=" + complain_group + ", complain_attach_file=" + complain_attach_file
				+ ", complain_classification=" + complain_classification + ", complain_is_finish=" + complain_is_finish
				+ ", complain_answer=" + complain_answer + "]";
	}

	
}
