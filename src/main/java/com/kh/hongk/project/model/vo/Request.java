package com.kh.hongk.project.model.vo;

import java.sql.Date;

public class Request {
	private int trId;
	private String trTitle;
	private String trContent;
	private String trType;
	private int priority;
	private Date trDate;
	private String trStatus;
	private int ptId;
	private int trWriter;
	private int trManager;
	
	private String writer;
	private String Manager; 
	
	public Request() {}

	public Request(int trId, String trTitle, String trContent, String trType, int priority, Date trDate,
			String trStatus, int ptId, int trWriter, int trManager) {
		super();
		this.trId = trId;
		this.trTitle = trTitle;
		this.trContent = trContent;
		this.trType = trType;
		this.priority = priority;
		this.trDate = trDate;
		this.trStatus = trStatus;
		this.ptId = ptId;
		this.trWriter = trWriter;
		this.trManager = trManager;
	}
	

	public Request(int trId, String trTitle, String trContent, String trType, int priority, Date trDate,
			String trStatus, int ptId, int trWriter, int trManager, String writer, String manager) {
		super();
		this.trId = trId;
		this.trTitle = trTitle;
		this.trContent = trContent;
		this.trType = trType;
		this.priority = priority;
		this.trDate = trDate;
		this.trStatus = trStatus;
		this.ptId = ptId;
		this.trWriter = trWriter;
		this.trManager = trManager;
		this.writer = writer;
		Manager = manager;
	}

	public int getTrId() {
		return trId;
	}

	public void setTrId(int trId) {
		this.trId = trId;
	}

	public String getTrTitle() {
		return trTitle;
	}

	public void setTrTitle(String trTitle) {
		this.trTitle = trTitle;
	}

	public String getTrContent() {
		return trContent;
	}

	public void setTrContent(String trContent) {
		this.trContent = trContent;
	}

	public String getTrType() {
		return trType;
	}

	public void setTrType(String trType) {
		this.trType = trType;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public Date getTrDate() {
		return trDate;
	}

	public void setTrDate(Date trDate) {
		this.trDate = trDate;
	}

	public String getTrStatus() {
		return trStatus;
	}

	public void setTrStatus(String trStatus) {
		this.trStatus = trStatus;
	}

	public int getPtId() {
		return ptId;
	}

	public void setPtId(int ptId) {
		this.ptId = ptId;
	}

	public int getTrWriter() {
		return trWriter;
	}

	public void setTrWriter(int trWriter) {
		this.trWriter = trWriter;
	}

	public int getTrManager() {
		return trManager;
	}

	public void setTrManager(int trManager) {
		this.trManager = trManager;
	}

	public String getManager() {
		return Manager;
	}

	public void setManager(String manager) {
		Manager = manager;
	}
	

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "Request [trId=" + trId + ", trTitle=" + trTitle + ", trContent=" + trContent + ", trType=" + trType
				+ ", priority=" + priority + ", trDate=" + trDate + ", trStatus=" + trStatus + ", ptId=" + ptId
				+ ", trWriter=" + trWriter + ", trManager=" + trManager + ", writer=" + writer + ", Manager=" + Manager
				+ "]";
	}

	

	
	
}
