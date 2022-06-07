package com.kh.team.vo;

import java.sql.Date;

public class AdminVo {
	private String admin_code;
	private Date admin_regdate;
	
	public AdminVo() {
		super();
	}

	public AdminVo(String admin_code, Date admin_regdate) {
		super();
		this.admin_code = admin_code;
		this.admin_regdate = admin_regdate;
	}

	public String getAdmin_code() {
		return admin_code;
	}

	public void setAdmin_code(String admin_code) {
		this.admin_code = admin_code;
	}

	public Date getAdmin_regdate() {
		return admin_regdate;
	}

	public void setAdmin_regdate(Date admin_regdate) {
		this.admin_regdate = admin_regdate;
	}

	@Override
	public String toString() {
		return "AdminVo [admin_code=" + admin_code + ", admin_regdate=" + admin_regdate + "]";
	}
	
}
