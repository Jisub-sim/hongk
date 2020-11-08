package com.kh.hongk.calendar.model.vo;

import java.sql.Date;

public class Calendar1 {
	private int cId;
	private String cDate;
	private String cBeginTime;
	private String cEndTime;
	private String cKind;
	private String cTitle;
	private String cPlace;
	private int mName;
	private String pTitle;
	
	public Calendar1() {}

	public Calendar1(int cId, String cDate, String cBeginTime, String cEndTime, String cKind, String cTitle,
			String cPlace, int mName, String pTitle) {
		super();
		this.cId = cId;
		this.cDate = cDate;
		this.cBeginTime = cBeginTime;
		this.cEndTime = cEndTime;
		this.cKind = cKind;
		this.cTitle = cTitle;
		this.cPlace = cPlace;
		this.mName = mName;
		this.pTitle = pTitle;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getcDate() {
		return cDate;
	}

	public void setcDate(String cDate) {
		this.cDate = cDate;
	}

	public String getcBeginTime() {
		return cBeginTime;
	}

	public void setcBeginTime(String cBeginTime) {
		this.cBeginTime = cBeginTime;
	}

	public String getcEndTime() {
		return cEndTime;
	}

	public void setcEndTime(String cEndTime) {
		this.cEndTime = cEndTime;
	}

	public String getcKind() {
		return cKind;
	}

	public void setcKind(String cKind) {
		this.cKind = cKind;
	}

	public String getcTitle() {
		return cTitle;
	}

	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}

	public String getcPlace() {
		return cPlace;
	}

	public void setcPlace(String cPlace) {
		this.cPlace = cPlace;
	}

	public int getmName() {
		return mName;
	}

	public void setmName(int mName) {
		this.mName = mName;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	@Override
	public String toString() {
		return "Calendar1 [cId=" + cId + ", cDate=" + cDate + ", cBeginTime=" + cBeginTime + ", cEndTime=" + cEndTime
				+ ", cKind=" + cKind + ", cTitle=" + cTitle + ", cPlace=" + cPlace + ", mName=" + mName + ", pTitle="
				+ pTitle + "]";
	}

	

	

	
	
	
	
	
	
}
