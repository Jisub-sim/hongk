package com.kh.hongk.board.model.vo;

import java.sql.Date;

public class Board {
	private int bId;
	private String bTitle;
	private String bWriter;
	private String bContent;
	private int bCount;
	private Date createDate;
	private Date modifyDate;
	private String b_Status;
	private String b_Type;
	private String b_Level;
	private int mNo;
	private int file_No;
	
	public Board () {}

	public Board(int bId, String bTitle, String bWriter, String bContent, int bCount, Date createDate, Date modifyDate,
			String b_Status, String b_Type, String b_Level, int mNo, int file_No) {
		super();
		this.bId = bId;
		this.bTitle = bTitle;
		this.bWriter = bWriter;
		this.bContent = bContent;
		this.bCount = bCount;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.b_Status = b_Status;
		this.b_Type = b_Type;
		this.b_Level = b_Level;
		this.mNo = mNo;
		this.file_No = file_No;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getB_Status() {
		return b_Status;
	}

	public void setB_Status(String b_Status) {
		this.b_Status = b_Status;
	}

	public String getB_Type() {
		return b_Type;
	}

	public void setB_Type(String b_Type) {
		this.b_Type = b_Type;
	}

	public String getB_Level() {
		return b_Level;
	}

	public void setB_Level(String b_Level) {
		this.b_Level = b_Level;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getFile_No() {
		return file_No;
	}

	public void setFile_No(int file_No) {
		this.file_No = file_No;
	}

	@Override
	public String toString() {
		return "Board [bId=" + bId + ", bTitle=" + bTitle + ", bWriter=" + bWriter + ", bContent=" + bContent
				+ ", bCount=" + bCount + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", b_Status="
				+ b_Status + ", b_Type=" + b_Type + ", b_Level=" + b_Level + ", mNo=" + mNo + ", file_No=" + file_No
				+ "]";
	}
	
	

	
	
}
