package com.kh.hongk.project.model.vo;

import java.sql.Date;

public class Reply {
	private int wrId;
	private String wrContent;
	private String wrStatus;
	private Date wrDate;
	private int twId;
	private int mNo;
	private String mName;
	public Reply() {}


	public Reply(int wrId, String wrContent, String wrStatus, Date wrDate, int twId, int mNo, String mName) {
		super();
		this.wrId = wrId;
		this.wrContent = wrContent;
		this.wrStatus = wrStatus;
		this.wrDate = wrDate;
		this.twId = twId;
		this.mNo = mNo;
		this.mName = mName;
	}



	public int getWrId() {
		return wrId;
	}

	public void setWrId(int wrId) {
		this.wrId = wrId;
	}

	public String getWrContent() {
		return wrContent;
	}

	public void setWrContent(String wrContent) {
		this.wrContent = wrContent;
	}

	public String getWrStatus() {
		return wrStatus;
	}

	public void setWrStatus(String wrStatus) {
		this.wrStatus = wrStatus;
	}

	public Date getWrDate() {
		return wrDate;
	}

	public void setWrDate(Date wrDate) {
		this.wrDate = wrDate;
	}

	public int getTwId() {
		return twId;
	}

	public void setTwId(int twId) {
		this.twId = twId;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	
	public String getmName() {
		return mName;
	}


	public void setmName(String mName) {
		this.mName = mName;
	}


	@Override
	public String toString() {
		return "Reply [wrId=" + wrId + ", wrContent=" + wrContent + ", wrStatus=" + wrStatus + ", wrDate=" + wrDate
				+ ", twId=" + twId + ", mNo=" + mNo + ", mName=" + mName + "]";
	}


	
	
	
}
