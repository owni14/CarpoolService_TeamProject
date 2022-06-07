package com.kh.team.vo;

public class PointCodeVo {
	private String pc_code;
	private String pc_desc;
	private int pc_point;
	
	public PointCodeVo() {
		super();
	}

	public PointCodeVo(String pc_code, String pc_desc, int pc_point) {
		super();
		this.pc_code = pc_code;
		this.pc_desc = pc_desc;
		this.pc_point = pc_point;
	}

	public String getPc_code() {
		return pc_code;
	}

	public void setPc_code(String pc_code) {
		this.pc_code = pc_code;
	}

	public String getPc_desc() {
		return pc_desc;
	}

	public void setPc_desc(String pc_desc) {
		this.pc_desc = pc_desc;
	}

	public int getPc_point() {
		return pc_point;
	}

	public void setPc_point(int pc_point) {
		this.pc_point = pc_point;
	}

	@Override
	public String toString() {
		return "PointCodeVo [pc_code=" + pc_code + ", pc_desc=" + pc_desc + ", pc_point=" + pc_point + "]";
	}
	
	
}
