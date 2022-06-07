package com.kh.team.vo;

import java.sql.Date;

public class EventVo {
	private int event_seq;
	private String event_name;
	private Date event_startdate;
	private Date event_enddate;
	private String event_content;
	private String event_is_finish;
	private String event_img;
	private int event_max_count;
	private int event_point;
	
	public EventVo() {
		super();
	}

	public EventVo(int event_seq, String event_name, Date event_startdate, Date event_enddate, String event_content,
			String event_is_finish, String event_img, int event_max_count, int event_point) {
		super();
		this.event_seq = event_seq;
		this.event_name = event_name;
		this.event_startdate = event_startdate;
		this.event_enddate = event_enddate;
		this.event_content = event_content;
		this.event_is_finish = event_is_finish;
		this.event_img = event_img;
		this.event_max_count = event_max_count;
		this.event_point = event_point;
	}

	public int getEvent_seq() {
		return event_seq;
	}

	public void setEvent_seq(int event_seq) {
		this.event_seq = event_seq;
	}

	public String getEvent_name() {
		return event_name;
	}

	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}

	public Date getEvent_startdate() {
		return event_startdate;
	}

	public void setEvent_startdate(Date event_startdate) {
		this.event_startdate = event_startdate;
	}

	public Date getEvent_enddate() {
		return event_enddate;
	}

	public void setEvent_enddate(Date event_enddate) {
		this.event_enddate = event_enddate;
	}

	public String getEvent_content() {
		return event_content;
	}

	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}

	public String getEvent_is_finish() {
		return event_is_finish;
	}

	public void setEvent_is_finish(String event_is_finish) {
		this.event_is_finish = event_is_finish;
	}

	public String getEvent_img() {
		return event_img;
	}

	public void setEvent_img(String event_img) {
		this.event_img = event_img;
	}

	public int getEvent_max_count() {
		return event_max_count;
	}

	public void setEvent_max_count(int event_max_count) {
		this.event_max_count = event_max_count;
	}

	public int getEvent_point() {
		return event_point;
	}

	public void setEvent_point(int event_point) {
		this.event_point = event_point;
	}

	@Override
	public String toString() {
		return "EventVo [event_seq=" + event_seq + ", event_name=" + event_name + ", event_startdate=" + event_startdate
				+ ", event_enddate=" + event_enddate + ", event_content=" + event_content + ", event_is_finish="
				+ event_is_finish + ", event_img=" + event_img + ", event_max_count=" + event_max_count
				+ ", event_point=" + event_point + "]";
	}
	
}
