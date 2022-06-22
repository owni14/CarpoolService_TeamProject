package com.kh.team.vo;

public class Driver_EvlVo {
	
	
	
	private int de_seq;
	private int de_drive_count;
	private String m_id;
	private String g_code;
	private int de_driver_evl;
	
	public Driver_EvlVo() {
		super();
	}
	
	public Driver_EvlVo(int de_seq, int de_drive_count, String m_id, String g_code) {
		super();
		this.de_seq = de_seq;
		this.de_drive_count = de_drive_count;
		this.m_id = m_id;
		this.g_code = g_code;
	}

	public Driver_EvlVo(int de_seq, int de_drive_count, String m_id, String g_code, int de_driver_evl) {
		super();
		this.de_seq = de_seq;
		this.de_drive_count = de_drive_count;
		this.m_id = m_id;
		this.g_code = g_code;
		this.de_driver_evl = de_driver_evl;
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

	public int getDe_driver_evl() {
		return de_driver_evl;
	}

	public void setDe_driver_evl(int de_driver_evl) {
		this.de_driver_evl = de_driver_evl;
	}

	@Override
	public String toString() {
		return "Driver_EvlVo [de_seq=" + de_seq + ", de_drive_count=" + de_drive_count + ", m_id=" + m_id + ", g_code="
				+ g_code + ", de_driver_evl=" + de_driver_evl + "]";
	}

}
