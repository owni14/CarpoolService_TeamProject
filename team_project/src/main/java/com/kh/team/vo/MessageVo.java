package com.kh.team.vo;

import java.sql.Date;

public class MessageVo {
	private int message_seq;
	private String receiver_m_id;
	private String receiver_black_id; // 신고 받은 사람에게 신고 완료 됨을 보내기 위한 변수 (관리자 페이지 : 신고 회원 관리에서만 사용)
	private String receiver_admin_code;
	private String sender_m_id;
	private String sender_admin_code;
	private String content;
	private Date senddate;
	private Date opendate;
	private int blacklist_seq;
	
	public MessageVo() {
		super();
	}
	
	public MessageVo(String receiver_m_id, String sender_admin_code, String content) {
		super();
		this.receiver_m_id = receiver_m_id;
		this.sender_admin_code = sender_admin_code;
		this.content = content;
	}

	public MessageVo(String receiver_m_id, String receiver_admin_code, String sender_m_id, String sender_admin_code,
			String content) {
		super();
		this.receiver_m_id = receiver_m_id;
		this.receiver_admin_code = receiver_admin_code;
		this.sender_m_id = sender_m_id;
		this.sender_admin_code = sender_admin_code;
		this.content = content;
	}



	public MessageVo(int message_seq, String receiver_m_id, String receiver_admin_code, String sender_m_id,
			String sender_admin_code, String content, Date senddate, Date opendate) {
		super();
		this.message_seq = message_seq;
		this.receiver_m_id = receiver_m_id;
		this.receiver_admin_code = receiver_admin_code;
		this.sender_m_id = sender_m_id;
		this.sender_admin_code = sender_admin_code;
		this.content = content;
		this.senddate = senddate;
		this.opendate = opendate;
	}


	public int getMessage_seq() {
		return message_seq;
	}


	public void setMessage_seq(int message_seq) {
		this.message_seq = message_seq;
	}


	public String getReceiver_m_id() {
		return receiver_m_id;
	}


	public void setReceiver_m_id(String receiver_m_id) {
		this.receiver_m_id = receiver_m_id;
	}


	public String getReceiver_admin_code() {
		return receiver_admin_code;
	}


	public void setReceiver_admin_code(String receiver_admin_code) {
		this.receiver_admin_code = receiver_admin_code;
	}


	public String getSender_m_id() {
		return sender_m_id;
	}


	public void setSender_m_id(String sender_m_id) {
		this.sender_m_id = sender_m_id;
	}


	public String getSender_admin_code() {
		return sender_admin_code;
	}


	public void setSender_admin_code(String sender_admin_code) {
		this.sender_admin_code = sender_admin_code;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getSenddate() {
		return senddate;
	}


	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}


	public Date getOpendate() {
		return opendate;
	}


	public void setOpendate(Date opendate) {
		this.opendate = opendate;
	}

	public int getBlacklist_seq() {
		return blacklist_seq;
	}


	public void setBlacklist_seq(int blacklist_seq) {
		this.blacklist_seq = blacklist_seq;
	}

	
	public void setReceiver_black_id(String receiver_black_id) {
		this.receiver_black_id = receiver_black_id;
	}


	public String getReceiver_black_id() {
		return receiver_black_id;
	}


	@Override
	public String toString() {
		return "MessageVo [message_seq=" + message_seq + ", receiver_m_id=" + receiver_m_id + ", receiver_black_id="
				+ receiver_black_id + ", receiver_admin_code=" + receiver_admin_code + ", sender_m_id=" + sender_m_id
				+ ", sender_admin_code=" + sender_admin_code + ", content=" + content + ", senddate=" + senddate
				+ ", opendate=" + opendate + ", blacklist_seq=" + blacklist_seq + "]";
	}


}
