package com.kh.team.vo;

public class Grade_BenefitVo {
	private String g_code;
	private String g_name;
	private int g_benefit;
	public Grade_BenefitVo() {
		super();
	}
	public Grade_BenefitVo(String g_code, String g_name, int g_benefit) {
		super();
		this.g_code = g_code;
		this.g_name = g_name;
		this.g_benefit = g_benefit;
	}
	public String getG_code() {
		return g_code;
	}
	public void setG_code(String g_code) {
		this.g_code = g_code;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public int getG_benefit() {
		return g_benefit;
	}
	public void setG_benefit(int g_benefit) {
		this.g_benefit = g_benefit;
	}
	@Override
	public String toString() {
		return "Grade_Benefit [g_code=" + g_code + ", g_name=" + g_name + ", g_benefit=" + g_benefit + "]";
	}
	
	
}
