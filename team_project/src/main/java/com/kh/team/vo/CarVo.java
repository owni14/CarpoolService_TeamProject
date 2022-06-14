package com.kh.team.vo;

import java.sql.Date;

public class CarVo {
	private String c_no;
	private String c_code;
	private String m_id;
	private Date c_regdate;
	private int c_people_count;
	
	public CarVo() {
		super();
	}
	
	public CarVo(String c_no, String c_code, String m_id, Date c_regdate, int c_people_count) {
		super();
		this.c_no = c_no;
		this.c_code = c_code;
		this.m_id = m_id;
		this.c_regdate = c_regdate;
		this.c_people_count = c_people_count;
	}

	public String getC_no() {
		return c_no;
	}

	public void setC_no(String c_no) {
		this.c_no = c_no;
	}

	public String getC_code() {
		return c_code;
	}

	public void setC_code(String c_code) {
		this.c_code = c_code;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public Date getC_regdate() {
		return c_regdate;
	}

	public void setC_regdate(Date c_regdate) {
		this.c_regdate = c_regdate;
	}

	public int getC_people_count() {
		return c_people_count;
	}

	public void setC_people_count(int c_people_count) {
		this.c_people_count = c_people_count;
	}

	@Override
	public String toString() {
		return "CarVo [c_no=" + c_no + ", c_code=" + c_code + ", m_id=" + m_id + ", c_regdate=" + c_regdate
				+ ", c_people_count=" + c_people_count + "]";
	}

}
