package com.kh.team.vo;

import java.sql.Date;

public class BlackListVo {
	private int blacklist_seq;
	private String m_id;
	private String black_m_id;
	private String black_content;
	private String black_is_processed;
	private Date black_regdate;
	private int black_score;
	private String admin_code;
	private String admin_check; // 관리자 페이지에서 신고 리스트 승인, 반려 정하는 경우
	public BlackListVo() {
		super();
	}

	
	public BlackListVo(String m_id, String black_m_id, String black_content) {
		super();
		this.m_id = m_id;
		this.black_m_id = black_m_id;
		this.black_content = black_content;
	}



	public BlackListVo(int blacklist_seq, String m_id, String black_m_id, String black_content,
			String black_is_processed, Date black_regdate) {
		super();
		this.blacklist_seq = blacklist_seq;
		this.m_id = m_id;
		this.black_m_id = black_m_id;
		this.black_content = black_content;
		this.black_is_processed = black_is_processed;
		this.black_regdate = black_regdate;
	}


	public BlackListVo(int blacklist_seq, String m_id, String black_m_id, String black_content,
			String black_is_processed, Date black_regdate, int black_score, String admin_code) {
		super();
		this.blacklist_seq = blacklist_seq;
		this.m_id = m_id;
		this.black_m_id = black_m_id;
		this.black_content = black_content;
		this.black_is_processed = black_is_processed;
		this.black_regdate = black_regdate;
		this.black_score = black_score;
		this.admin_code = admin_code;
	}


	public int getBlacklist_seq() {
		return blacklist_seq;
	}

	public void setBlacklist_seq(int blacklist_seq) {
		this.blacklist_seq = blacklist_seq;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getBlack_m_id() {
		return black_m_id;
	}

	public void setBlack_m_id(String black_m_id) {
		this.black_m_id = black_m_id;
	}

	public String getBlack_content() {
		return black_content;
	}

	public void setBlack_content(String black_content) {
		this.black_content = black_content;
	}

	public String getBlack_is_processed() {
		return black_is_processed;
	}

	public void setBlack_is_processed(String black_is_processed) {
		this.black_is_processed = black_is_processed;
	}

	public Date getBlack_regdate() {
		return black_regdate;
	}

	public void setBlack_regdate(Date black_regdate) {
		this.black_regdate = black_regdate;
	}

	
	public int getBlack_score() {
		return black_score;
	}


	public void setBlack_score(int black_score) {
		this.black_score = black_score;
	}


	public String getAdmin_code() {
		return admin_code;
	}


	public void setAdmin_code(String admin_code) {
		this.admin_code = admin_code;
	}


	public String getAdmin_check() {
		return admin_check;
	}


	public void setAdmin_check(String admin_check) {
		this.admin_check = admin_check;
	}


	@Override
	public String toString() {
		return "BlackListVo [blacklist_seq=" + blacklist_seq + ", m_id=" + m_id + ", black_m_id=" + black_m_id
				+ ", black_content=" + black_content + ", black_is_processed=" + black_is_processed + ", black_regdate="
				+ black_regdate + ", black_score=" + black_score + ", admin_code=" + admin_code + ", admin_check="
				+ admin_check + "]";
	}

	
}
