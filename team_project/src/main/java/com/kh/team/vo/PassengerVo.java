package com.kh.team.vo;

import java.sql.Date;

public class PassengerVo {
	private int passenger_seq;
	private String m_id;
	private String passenger_depart_location;
	private String passenger_depart_time;
	private int driver_seq;
	private String is_approve;
	private Date apply_date;
	private String is_cancel;
	
	public PassengerVo() {
		super();
	}

	public PassengerVo(int passenger_seq, String m_id, String passenger_depart_location, String passenger_depart_time,
			int driver_seq) {
		super();
		this.passenger_seq = passenger_seq;
		this.m_id = m_id;
		this.passenger_depart_location = passenger_depart_location;
		this.passenger_depart_time = passenger_depart_time;
		this.driver_seq = driver_seq;
	}
	
	public PassengerVo(int passenger_seq, String m_id, String passenger_depart_location, String passenger_depart_time,
			int driver_seq, String is_approve, Date apply_date, String is_cancel) {
		super();
		this.passenger_seq = passenger_seq;
		this.m_id = m_id;
		this.passenger_depart_location = passenger_depart_location;
		this.passenger_depart_time = passenger_depart_time;
		this.driver_seq = driver_seq;
		this.is_approve = is_approve;
		this.apply_date = apply_date;
		this.is_cancel = is_cancel;
	}

	public int getPassenger_seq() {
		return passenger_seq;
	}

	public void setPassenger_seq(int passenger_seq) {
		this.passenger_seq = passenger_seq;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getPassenger_depart_location() {
		return passenger_depart_location;
	}

	public void setPassenger_depart_location(String passenger_depart_location) {
		this.passenger_depart_location = passenger_depart_location;
	}

	public String getPassenger_depart_time() {
		return passenger_depart_time;
	}

	public void setPassenger_depart_time(String passenger_depart_time) {
		this.passenger_depart_time = passenger_depart_time;
	}

	public int getDriver_seq() {
		return driver_seq;
	}

	public void setDriver_seq(int driver_seq) {
		this.driver_seq = driver_seq;
	}
	
	public String getIs_approve() {
		return is_approve;
	}

	public void setIs_approve(String is_approve) {
		this.is_approve = is_approve;
	}

	public Date getApply_date() {
		return apply_date;
	}

	public void setApply_date(Date apply_date) {
		this.apply_date = apply_date;
	}

	public String getIs_cancel() {
		return is_cancel;
	}

	public void setIs_cancel(String is_cancel) {
		this.is_cancel = is_cancel;
	}

	@Override
	public String toString() {
		return "PassengerVo [passenger_seq=" + passenger_seq + ", m_id=" + m_id + ", passenger_depart_location="
				+ passenger_depart_location + ", passenger_depart_time=" + passenger_depart_time + ", driver_seq="
				+ driver_seq + ", is_approve=" + is_approve + ", apply_date=" + apply_date + ", is_cancel=" + is_cancel
				+ "]";
	}

}
