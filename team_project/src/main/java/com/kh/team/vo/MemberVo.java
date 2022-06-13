package com.kh.team.vo;

import java.sql.Date;
import java.util.List;

public class MemberVo {
	private String m_id;
	private String m_name;
	private String m_pw;
	private String gender;
	private String m_company;
	private String m_dept;
	private String m_is_drop;
	private int m_point;
	private int m_evl;
	private int m_blackpoint;
	private Date m_joindate;
	private String m_is_smoke;
	private String m_address;
	private String m_cellphone;
	
	public MemberVo() {
		super();
	}
	
	

	public MemberVo(String m_id, String m_name, String m_pw, String gender, String m_company, String m_dept,
			String m_is_smoke, String m_address, String m_cellphone) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_pw = m_pw;
		this.gender = gender;
		this.m_company = m_company;
		this.m_dept = m_dept;
		this.m_is_smoke = m_is_smoke;
		this.m_address = m_address;
		this.m_cellphone = m_cellphone;
	}



	public MemberVo(String m_id, String m_name, String m_pw, String gender, String m_company, String m_dept,
			String m_address, String m_cellphone) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_pw = m_pw;
		this.gender = gender;
		this.m_company = m_company;
		this.m_dept = m_dept;
		this.m_address = m_address;
		this.m_cellphone = m_cellphone;
	}

	public MemberVo(String m_id, String m_name, String m_pw, String gender, String m_company, String m_dept,
			String m_is_drop, int m_point, int m_evl, int m_blackpoint, Date m_joindate, String m_is_smoke,
			String m_address, String m_cellphone) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_pw = m_pw;
		this.gender = gender;
		this.m_company = m_company;
		this.m_dept = m_dept;
		this.m_is_drop = m_is_drop;
		this.m_point = m_point;
		this.m_evl = m_evl;
		this.m_blackpoint = m_blackpoint;
		this.m_joindate = m_joindate;
		this.m_is_smoke = m_is_smoke;
		this.m_address = m_address;
		this.m_cellphone = m_cellphone;
	}


	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getM_company() {
		return m_company;
	}

	public void setM_company(String m_company) {
		this.m_company = m_company;
	}

	public String getM_dept() {
		return m_dept;
	}

	public void setM_dept(String m_dept) {
		this.m_dept = m_dept;
	}

	public String getM_is_drop() {
		return m_is_drop;
	}

	public void setM_is_drop(String m_is_drop) {
		this.m_is_drop = m_is_drop;
	}

	public int getM_point() {
		return m_point;
	}

	public void setM_point(int m_point) {
		this.m_point = m_point;
	}

	public int getM_evl() {
		return m_evl;
	}

	public void setM_evl(int m_evl) {
		this.m_evl = m_evl;
	}

	public int getM_blackpoint() {
		return m_blackpoint;
	}

	public void setM_blackpoint(int m_blackpoint) {
		this.m_blackpoint = m_blackpoint;
	}

	public Date getM_joindate() {
		return m_joindate;
	}

	public void setM_joindate(Date m_joindate) {
		this.m_joindate = m_joindate;
	}

	public String getM_is_smoke() {
		return m_is_smoke;
	}

	public void setM_is_smoke(String m_is_smoke) {
		this.m_is_smoke = m_is_smoke;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public String getM_cellphone() {
		return m_cellphone;
	}

	public void setM_cellphone(String m_cellphone) {
		this.m_cellphone = m_cellphone;
	}



	@Override
	public String toString() {
		return "MemberVo [m_id=" + m_id + ", m_name=" + m_name + ", m_pw=" + m_pw + ", gender=" + gender
				+ ", m_company=" + m_company + ", m_dept=" + m_dept + ", m_is_drop=" + m_is_drop + ", m_point="
				+ m_point + ", m_evl=" + m_evl + ", m_blackpoint=" + m_blackpoint + ", m_joindate=" + m_joindate
				+ ", m_is_smoke=" + m_is_smoke + ", m_address=" + m_address + ", m_cellphone=" + m_cellphone + "]";
	}



	

	
	
}
