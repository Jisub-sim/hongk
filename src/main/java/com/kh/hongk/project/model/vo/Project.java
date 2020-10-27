package com.kh.hongk.project.model.vo;

import java.util.Date;

public class Project {
	private int pId;
	private String pTitle;
	private String pContent;
	private String progress;
	private Date pDate;
	private Date deadLine;
	private String pStatus;
	private int manager;
	private String mName;
	
	public Project() {}
	
	public Project(int pId, String pTitle, String pContent, String progress, Date pDate, Date deadLine, String pStatus,
			int manager) {
		super();
		this.pId = pId;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.progress = progress;
		this.pDate = pDate;
		this.deadLine = deadLine;
		this.pStatus = pStatus;
		this.manager = manager;
	}
	
	
	public Project(String pTitle, String pContent, Date pDate, Date deadLine, int manager) {
		super();
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pDate = pDate;
		this.deadLine = deadLine;
		this.manager = manager;
	}

	public Project(int pId, String pTitle, String pContent, String progress, Date pDate, Date deadLine, String pStatus,
			String mName) {
		super();
		this.pId = pId;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.progress = progress;
		this.pDate = pDate;
		this.deadLine = deadLine;
		this.pStatus = pStatus;
		this.mName = mName;
	}

	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public Date getpDate() {
		return pDate;
	}
	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}
	public Date getDeadLine() {
		return deadLine;
	}
	public void setDeadLine(Date deadLine) {
		this.deadLine = deadLine;
	}
	public String getpStatus() {
		return pStatus;
	}
	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}
	public int getManager() {
		return manager;
	}
	public void setManager(int manager) {
		this.manager = manager;
	}
	
	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	@Override
	public String toString() {
		return "Project [pId=" + pId + ", pTitle=" + pTitle + ", pContent=" + pContent + ", progress=" + progress
				+ ", pDate=" + pDate + ", deadLine=" + deadLine + ", pStatus=" + pStatus + ", manager=" + manager
				+ ", mName=" + mName + "]";
	}


	
}
