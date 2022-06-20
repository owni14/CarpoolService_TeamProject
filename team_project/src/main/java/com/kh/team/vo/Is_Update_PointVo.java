package com.kh.team.vo;

import java.sql.Date;

public class Is_Update_PointVo {
	private int iup_seq;
	private Date iup_date;
	private String iup_what;
	public Is_Update_PointVo() {
		super();
	}
	public Is_Update_PointVo(int iup_seq, Date iup_date, String iup_what) {
		super();
		this.iup_seq = iup_seq;
		this.iup_date = iup_date;
		this.iup_what = iup_what;
	}
	public int getIup_seq() {
		return iup_seq;
	}
	public void setIup_seq(int iup_seq) {
		this.iup_seq = iup_seq;
	}
	public Date getIup_date() {
		return iup_date;
	}
	public void setIup_date(Date iup_date) {
		this.iup_date = iup_date;
	}
	public String getIup_what() {
		return iup_what;
	}
	public void setIup_what(String iup_what) {
		this.iup_what = iup_what;
	}
	@Override
	public String toString() {
		return "Is_Update_PointVo [iup_seq=" + iup_seq + ", iup_date=" + iup_date + ", iup_what=" + iup_what + "]";
	}
	
	
}
