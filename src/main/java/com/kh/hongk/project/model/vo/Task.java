package com.kh.hongk.project.model.vo;

import java.sql.Date;

public class Task {
	private int twId;
	private String twTitle;
	private String twContent;
	private String twStatus;
	private Date twDate;
	private Date twEnd;
	private int ptId;
	private int twWriter;
	private int twManager;
	
	private String writer;
	private String manager;
	
	
	public Task() {}

	public Task(int twId, String twTitle, String twContent, String twStatus, Date twDate, Date twEnd, int ptId,
			int twWriter, int twManager) {
		super();
		this.twId = twId;
		this.twTitle = twTitle;
		this.twContent = twContent;
		this.twStatus = twStatus;
		this.twDate = twDate;
		this.twEnd = twEnd;
		this.ptId = ptId;
		this.twWriter = twWriter;
		this.twManager = twManager;
	}
	

	public Task(int twId, String twTitle, String twContent, String twStatus, Date twDate, Date twEnd, int ptId,
			int twWriter, int twManager, String writer, String manager) {
		super();
		this.twId = twId;
		this.twTitle = twTitle;
		this.twContent = twContent;
		this.twStatus = twStatus;
		this.twDate = twDate;
		this.twEnd = twEnd;
		this.ptId = ptId;
		this.twWriter = twWriter;
		this.twManager = twManager;
		this.writer = writer;
		this.manager = manager;
	}

	public int getTwId() {
		return twId;
	}

	public void setTwId(int twId) {
		this.twId = twId;
	}

	public String getTwTitle() {
		return twTitle;
	}

	public void setTwTitle(String twTitle) {
		this.twTitle = twTitle;
	}

	public String getTwContent() {
		return twContent;
	}

	public void setTwContent(String twContent) {
		this.twContent = twContent;
	}

	public String getTwStatus() {
		return twStatus;
	}

	public void setTwStatus(String twStatus) {
		this.twStatus = twStatus;
	}

	public Date getTwDate() {
		return twDate;
	}

	public void setTwDate(Date twDate) {
		this.twDate = twDate;
	}

	public Date getTwEnd() {
		return twEnd;
	}

	public void setTwEnd(Date twEnd) {
		this.twEnd = twEnd;
	}

	public int getPtId() {
		return ptId;
	}

	public void setPtId(int ptId) {
		this.ptId = ptId;
	}

	public int getTwWriter() {
		return twWriter;
	}

	public void setTwWriter(int twWriter) {
		this.twWriter = twWriter;
	}

	public int getTwManager() {
		return twManager;
	}

	public void setTwManager(int twManager) {
		this.twManager = twManager;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	@Override
	public String toString() {
		return "Task [twId=" + twId + ", twTitle=" + twTitle + ", twContent=" + twContent + ", twStatus=" + twStatus
				+ ", twDate=" + twDate + ", twEnd=" + twEnd + ", ptId=" + ptId + ", twWriter=" + twWriter
				+ ", twManager=" + twManager + ", writer=" + writer + ", manager=" + manager + "]";
	}

	
	
	

}
