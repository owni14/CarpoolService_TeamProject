package com.kh.team.vo;

import java.sql.Date;

public class ApproveWaitVo {
	private int aw_seq;
	private String aw_license_img;
	private String m_id;
	private Date aw_egdate;
	
	public ApproveWaitVo() {
		super();
	}

	public ApproveWaitVo(int aw_seq, String aw_license_img, String m_id, Date aw_egdate) {
		super();
		this.aw_seq = aw_seq;
		this.aw_license_img = aw_license_img;
		this.m_id = m_id;
		this.aw_egdate = aw_egdate;
	}

	public int getAw_seq() {
		return aw_seq;
	}

	public void setAw_seq(int aw_seq) {
		this.aw_seq = aw_seq;
	}

	public String getAw_license_img() {
		return aw_license_img;
	}

	public void setAw_license_img(String aw_license_img) {
		this.aw_license_img = aw_license_img;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public Date getAw_egdate() {
		return aw_egdate;
	}

	public void setAw_egdate(Date aw_egdate) {
		this.aw_egdate = aw_egdate;
	}

	@Override
	public String toString() {
		return "Approve_waitVo [aw_seq=" + aw_seq + ", aw_license_img=" + aw_license_img + ", m_id=" + m_id
				+ ", aw_egdate=" + aw_egdate + "]";
	}
	
}	
