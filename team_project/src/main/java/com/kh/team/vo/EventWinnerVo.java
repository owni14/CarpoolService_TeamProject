package com.kh.team.vo;

public class EventWinnerVo {
	private int e_winner_seq;
	private String m_id;
	private int event_seq;
	private String e_winner_is_get;
	
	public EventWinnerVo() {
		super();
	}

	public EventWinnerVo(int e_winner_seq, String m_id, int event_seq, String e_winner_is_get) {
		super();
		this.e_winner_seq = e_winner_seq;
		this.m_id = m_id;
		this.event_seq = event_seq;
		this.e_winner_is_get = e_winner_is_get;
	}

	public int getE_winner_seq() {
		return e_winner_seq;
	}

	public void setE_winner_seq(int e_winner_seq) {
		this.e_winner_seq = e_winner_seq;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getEvent_seq() {
		return event_seq;
	}

	public void setEvent_seq(int event_seq) {
		this.event_seq = event_seq;
	}

	public String getE_winner_is_get() {
		return e_winner_is_get;
	}

	public void setE_winner_is_get(String e_winner_is_get) {
		this.e_winner_is_get = e_winner_is_get;
	}

	@Override
	public String toString() {
		return "EventWinnerVo [e_winner_seq=" + e_winner_seq + ", m_id=" + m_id + ", event_seq=" + event_seq
				+ ", e_winner_is_get=" + e_winner_is_get + "]";
	}
	
}
