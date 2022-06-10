package com.kh.team.vo;

public class EventParticipationVo {
	private int ep_seq;	
	private String m_id;
	private int event_seq;
	private String ep_is_winner;
	
	public EventParticipationVo() {
		super();
	}

	public EventParticipationVo(int ep_seq, String m_id, int event_seq, String ep_is_winner) {
		super();
		this.ep_seq = ep_seq;
		this.m_id = m_id;
		this.event_seq = event_seq;
		this.ep_is_winner = ep_is_winner;
	}

	public int getEp_seq() {
		return ep_seq;
	}

	public void setEp_seq(int ep_seq) {
		this.ep_seq = ep_seq;
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

	public String getEp_is_winner() {
		return ep_is_winner;
	}

	public void setEp_is_winner(String ep_is_winner) {
		this.ep_is_winner = ep_is_winner;
	}

	@Override
	public String toString() {
		return "EventParticipationVo [ep_seq=" + ep_seq + ", m_id=" + m_id + ", event_seq=" + event_seq
				+ ", ep_is_winner=" + ep_is_winner + "]";
	}
	
	

}
