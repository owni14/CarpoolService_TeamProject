package com.kh.team.vo;

import java.sql.Date;

public class CarVo {
	private String c_no;
	private String c_code;
	private String m_id;
	private String c_is_driver;
	private Date c_approvedate;
	
	public CarVo() {
		super();
	}
	
	public CarVo(String c_no, String c_code, String m_id, String c_is_driver, Date c_approvedate) {
		super();
		this.c_no = c_no;
		this.c_code = c_code;
		this.m_id = m_id;
		this.c_is_driver = c_is_driver;
		this.c_approvedate = c_approvedate;
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

	public String getC_is_driver() {
		return c_is_driver;
	}

	public void setC_is_driver(String c_is_driver) {
		this.c_is_driver = c_is_driver;
	}

	public Date getC_approvedate() {
		return c_approvedate;
	}

	public void setC_approvedate(Date c_approvedate) {
		this.c_approvedate = c_approvedate;
	}

	@Override
	public String toString() {
		return "CarVo [c_no=" + c_no + ", c_code=" + c_code + ", m_id=" + m_id + ", c_is_driver=" + c_is_driver
				+ ", c_approvedate=" + c_approvedate + "]";
	}
	
}
