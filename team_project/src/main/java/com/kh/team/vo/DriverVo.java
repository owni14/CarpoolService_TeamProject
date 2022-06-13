package com.kh.team.vo;

public class DriverVo {
	private int driver_seq;
	private String m_id;
	private String driver_depart_location;
	private String driver_is_smoke;
	private String driver_comment;
	private String driver_depart_time;
	
	public DriverVo() {
		super();
	}

	public DriverVo(int driver_seq, String m_id, String driver_depart_location, String driver_is_smoke,
			String driver_comment, String driver_depart_time) {
		super();
		this.driver_seq = driver_seq;
		this.m_id = m_id;
		this.driver_depart_location = driver_depart_location;
		this.driver_is_smoke = driver_is_smoke;
		this.driver_comment = driver_comment;
		this.driver_depart_time = driver_depart_time;
	}
	
	public DriverVo(String m_id, String driver_depart_location, String driver_is_smoke, String driver_comment,
			String driver_depart_time) {
		super();
		this.m_id = m_id;
		this.driver_depart_location = driver_depart_location;
		this.driver_is_smoke = driver_is_smoke;
		this.driver_comment = driver_comment;
		this.driver_depart_time = driver_depart_time;
	}

	public int getDriver_seq() {
		return driver_seq;
	}

	public void setDriver_seq(int driver_seq) {
		this.driver_seq = driver_seq;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getDriver_depart_location() {
		return driver_depart_location;
	}

	public void setDriver_depart_location(String driver_depart_location) {
		this.driver_depart_location = driver_depart_location;
	}

	public String getDriver_is_smoke() {
		return driver_is_smoke;
	}

	public void setDriver_is_smoke(String driver_is_smoke) {
		this.driver_is_smoke = driver_is_smoke;
	}

	public String getDriver_comment() {
		return driver_comment;
	}

	public void setDriver_comment(String driver_comment) {
		this.driver_comment = driver_comment;
	}

	public String getDriver_depart_time() {
		return driver_depart_time;
	}

	public void setDriver_depart_time(String driver_depart_time) {
		this.driver_depart_time = driver_depart_time;
	}

	@Override
	public String toString() {
		return "DriverVo [driver_seq=" + driver_seq + ", m_id=" + m_id + ", driver_depart_location="
				+ driver_depart_location + ", driver_is_smoke=" + driver_is_smoke + ", driver_comment=" + driver_comment
				+ ", driver_depart_time=" + driver_depart_time + "]";
	}

}
