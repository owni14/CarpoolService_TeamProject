package com.kh.team.vo;

public class Passenger_EvlVo {
	private int pe_seq;
	private int pe_ride_count;
	private String m_id;
	private String g_code;
	public Passenger_EvlVo() {
		super();
	}
	public Passenger_EvlVo(int pe_seq, int pe_ride_count, String m_id, String g_code) {
		super();
		this.pe_seq = pe_seq;
		this.pe_ride_count = pe_ride_count;
		this.m_id = m_id;
		this.g_code = g_code;
	}
	public int getPe_seq() {
		return pe_seq;
	}
	public void setPe_seq(int pe_seq) {
		this.pe_seq = pe_seq;
	}
	public int getPe_ride_count() {
		return pe_ride_count;
	}
	public void setPe_ride_count(int pe_ride_count) {
		this.pe_ride_count = pe_ride_count;
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
	@Override
	public String toString() {
		return "Passenger_Evl [pe_seq=" + pe_seq + ", pe_ride_count=" + pe_ride_count + ", m_id=" + m_id + ", g_code="
				+ g_code + "]";
	}
	
	
}
