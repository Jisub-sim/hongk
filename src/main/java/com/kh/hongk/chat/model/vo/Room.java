package com.kh.hongk.chat.model.vo;

import java.sql.Date;

public class Room {
	private int chNo;
	private String fromId;
	private String toId;
	private String chatContent;
	private Date chatTime;
	
	public Room() {}

	public Room(int chNo, String fromId, String toId, String chatContent, Date chatTime) {
		super();
		this.chNo = chNo;
		this.fromId = fromId;
		this.toId = toId;
		this.chatContent = chatContent;
		this.chatTime = chatTime;
	}

	public int getChNo() {
		return chNo;
	}

	public void setChNo(int chNo) {
		this.chNo = chNo;
	}

	public String getFromId() {
		return fromId;
	}

	public void setFromId(String fromId) {
		this.fromId = fromId;
	}

	public String getToId() {
		return toId;
	}

	public void setToId(String toId) {
		this.toId = toId;
	}

	public String getChatContent() {
		return chatContent;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	public Date getChatTime() {
		return chatTime;
	}

	public void setChatTime(Date chatTime) {
		this.chatTime = chatTime;
	}

	@Override
	public String toString() {
		return "Room [chNo=" + chNo + ", fromId=" + fromId + ", toId=" + toId + ", chatContent=" + chatContent
				+ ", chatTime=" + chatTime + "]";
	}
	
	
	
	
	
}

