package com.kh.team.vo;

public class Driver_EvlVo {
	
	private int de_seq;
	private int de_drive_count;
	private String m_id;
	private String g_code;
	private int evl1;
	private int evl2;
	private int evl3;
	private int evl4;
	private int evl5;
	
	public Driver_EvlVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Driver_EvlVo(int de_seq, int de_drive_count, String m_id, String g_code, int evl1, int evl2, int evl3,
			int evl4, int evl5) {
		super();
		this.de_seq = de_seq;
		this.de_drive_count = de_drive_count;
		this.m_id = m_id;
		this.g_code = g_code;
		this.evl1 = evl1;
		this.evl2 = evl2;
		this.evl3 = evl3;
		this.evl4 = evl4;
		this.evl5 = evl5;
	}

	public int getDe_seq() {
		return de_seq;
	}

	public void setDe_seq(int de_seq) {
		this.de_seq = de_seq;
	}

	public int getDe_drive_count() {
		return de_drive_count;
	}

	public void setDe_drive_count(int de_drive_count) {
		this.de_drive_count = de_drive_count;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getG_code() {
		return g_code;
	}

	public void setG_code(String g_code) {
		this.g_code = g_code;
	}

	public int getEvl1() {
		return evl1;
	}

	public void setEvl1(int evl1) {
		this.evl1 = evl1;
	}

	public int getEvl2() {
		return evl2;
	}

	public void setEvl2(int evl2) {
		this.evl2 = evl2;
	}

	public int getEvl3() {
		return evl3;
	}

	public void setEvl3(int evl3) {
		this.evl3 = evl3;
	}

	public int getEvl4() {
		return evl4;
	}

	public void setEvl4(int evl4) {
		this.evl4 = evl4;
	}

	public int getEvl5() {
		return evl5;
	}

	public void setEvl5(int evl5) {
		this.evl5 = evl5;
	}

	@Override
	public String toString() {
		return "Driver_EvlVo [de_seq=" + de_seq + ", de_drive_count=" + de_drive_count + ", m_id=" + m_id + ", g_code="
				+ g_code + ", evl1=" + evl1 + ", evl2=" + evl2 + ", evl3=" + evl3 + ", evl4=" + evl4 + ", evl5=" + evl5
				+ "]";
	}
	
}
