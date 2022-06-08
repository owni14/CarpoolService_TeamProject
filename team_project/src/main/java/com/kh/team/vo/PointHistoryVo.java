package com.kh.team.vo;

import java.sql.Date;

public class PointHistoryVo {
	public int p_seq;
	public String m_id;
	public String pc_code;
	public Date p_date;
	
	public PointHistoryVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PointHistoryVo(String m_id, String pc_code) {
		super();
		this.m_id = m_id;
		this.pc_code = pc_code;
	}

	public PointHistoryVo(int p_seq, String m_id, String pc_code, Date p_date) {
		super();
		this.p_seq = p_seq;
		this.m_id = m_id;
		this.pc_code = pc_code;
		this.p_date = p_date;
	}

	public int getP_seq() {
		return p_seq;
	}

	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getPc_code() {
		return pc_code;
	}

	public void setPc_code(String pc_code) {
		this.pc_code = pc_code;
	}

	public Date getP_date() {
		return p_date;
	}

	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}

	@Override
	public String toString() {
		return "PointHistory [p_seq=" + p_seq + ", m_id=" + m_id + ", pc_code=" + pc_code + ", p_date=" + p_date + "]";
	}

}
