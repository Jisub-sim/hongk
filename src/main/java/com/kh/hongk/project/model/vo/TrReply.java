package com.kh.hongk.project.model.vo;

import java.sql.Date;

public class TrReply {
	private int rrId;
	private String rrTitle;
	private String rrContent;
	private Date rrDate;
	private String rrStatus;
	private int trId;
	private int mNo;
	private String mName;
	
	public TrReply() {}

	

	public TrReply(int rrId, String rrTitle, String rrContent, Date rrDate, String rrStatus, int trId, int mNo) {
		super();
		this.rrId = rrId;
		this.rrTitle = rrTitle;
		this.rrContent = rrContent;
		this.rrDate = rrDate;
		this.rrStatus = rrStatus;
		this.trId = trId;
		this.mNo = mNo;
	}



	public int getRrId() {
		return rrId;
	}

	public void setRrId(int rrId) {
		this.rrId = rrId;
	}

	public String getRrTitle() {
		return rrTitle;
	}

	public void setRrTitle(String rrTitle) {
		this.rrTitle = rrTitle;
	}

	public String getRrContent() {
		return rrContent;
	}

	public void setRrContent(String rrContent) {
		this.rrContent = rrContent;
	}

	public Date getRrDate() {
		return rrDate;
	}

	public void setRrDate(Date rrDate) {
		this.rrDate = rrDate;
	}

	public String getRrStatus() {
		return rrStatus;
	}

	public void setRrStatus(String rrStatus) {
		this.rrStatus = rrStatus;
	}

	public int getTrId() {
		return trId;
	}

	public void setTrId(int trId) {
		this.trId = trId;
	}

	public int getmNo() {
		return mNo;
	}



	public void setmNo(int mNo) {
		this.mNo = mNo;
	}



	@Override
	public String toString() {
		return "TrReply [rrId=" + rrId + ", rrTitle=" + rrTitle + ", rrContent=" + rrContent + ", rrDate=" + rrDate
				+ ", rrStatus=" + rrStatus + ", trId=" + trId + ", mNo=" + mNo + "]";
	}
	
	
}
