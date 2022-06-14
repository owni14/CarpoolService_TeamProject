package com.kh.team.vo;

import java.sql.Date;

public class MemberUpdateVo {
	private int memberupdate_seq;
	private String m_id;
	private String admin_code;
	private Date update_date;
	private String update_reason;
	
	public MemberUpdateVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MemberUpdateVo(String m_id, String admin_code, String update_reason) {
		super();
		this.m_id = m_id;
		this.admin_code = admin_code;
		this.update_reason = update_reason;
	}



	public MemberUpdateVo(int memberupdate_seq, String m_id, String admin_code, Date update_date,
			String update_reason) {
		super();
		this.memberupdate_seq = memberupdate_seq;
		this.m_id = m_id;
		this.admin_code = admin_code;
		this.update_date = update_date;
		this.update_reason = update_reason;
	}

	public int getMemberupdate_seq() {
		return memberupdate_seq;
	}

	public void setMemberupdate_seq(int memberupdate_seq) {
		this.memberupdate_seq = memberupdate_seq;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getAdmin_code() {
		return admin_code;
	}

	public void setAdmin_code(String admin_code) {
		this.admin_code = admin_code;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public String getUpdate_reason() {
		return update_reason;
	}

	public void setUpdate_reason(String update_reason) {
		this.update_reason = update_reason;
	}

	@Override
	public String toString() {
		return "MemberUpdateVo [memberupdate_seq=" + memberupdate_seq + ", m_id=" + m_id + ", admin_code=" + admin_code
				+ ", update_date=" + update_date + ", update_reason=" + update_reason + "]";
	}

	
}
