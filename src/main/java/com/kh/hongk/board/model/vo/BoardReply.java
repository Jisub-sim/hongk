package com.kh.hongk.board.model.vo;

import java.util.Date;


public class BoardReply {
	private int rId;
	private String rContent;
	private String rWriter;
	private Date rCreateDate;
	private Date rModifyDate;
	private String rStatus;
	private int refBid;
	
	public BoardReply() {}

	public BoardReply(int rId, String rContent, String rWriter, Date rCreateDate, Date rModifyDate, String rStatus,
			int refBid) {
		super();
		this.rId = rId;
		this.rContent = rContent;
		this.rWriter = rWriter;
		this.rCreateDate = rCreateDate;
		this.rModifyDate = rModifyDate;
		this.rStatus = rStatus;
		this.refBid = refBid;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public String getrWriter() {
		return rWriter;
	}

	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}

	public Date getrCreateDate() {
		return rCreateDate;
	}

	public void setrCreateDate(Date rCreateDate) {
		this.rCreateDate = rCreateDate;
	}

	public Date getrModifyDate() {
		return rModifyDate;
	}

	public void setrModifyDate(Date rModifyDate) {
		this.rModifyDate = rModifyDate;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public int getRefBid() {
		return refBid;
	}

	public void setRefBid(int refBid) {
		this.refBid = refBid;
	}

	@Override
	public String toString() {
		return "Reply [rId=" + rId + ", rContent=" + rContent + ", rWriter=" + rWriter + ", rCreateDate=" + rCreateDate
				+ ", rModifyDate=" + rModifyDate + ", rStatus=" + rStatus + ", refBid=" + refBid + "]";
	}

	
	
}
