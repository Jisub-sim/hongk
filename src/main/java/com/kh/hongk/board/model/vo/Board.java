package com.kh.hongk.board.model.vo;

import java.sql.Date;

public class Board {
	private int bId;
	private String bTitle;
	private String bWriter;
	private String bContent;
	private String bCount;
	private Date create_date;
	private Date modify_date;
	private String b_Status;
	private String b_Type;
	private String b_Level;
	private int mNo;
	
	
	
	public Board () {}



	public Board(int bId, String bTitle, String bWriter, String bContent, String bCount, Date create_date,
			Date modify_date, String b_Status, String b_Type, String b_Level, int mNo) {
		super();
		this.bId = bId;
		this.bTitle = bTitle;
		this.bWriter = bWriter;
		this.bContent = bContent;
		this.bCount = bCount;
		this.create_date = create_date;
		this.modify_date = modify_date;
		this.b_Status = b_Status;
		this.b_Type = b_Type;
		this.b_Level = b_Level;
		this.mNo = mNo;
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



	public String getbCount() {
		return bCount;
	}



	public void setbCount(String bCount) {
		this.bCount = bCount;
	}



	public Date getCreate_date() {
		return create_date;
	}



	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}



	public Date getModify_date() {
		return modify_date;
	}



	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
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



	@Override
	public String toString() {
		return "Board [bId=" + bId + ", bTitle=" + bTitle + ", bWriter=" + bWriter + ", bContent=" + bContent
				+ ", bCount=" + bCount + ", create_date=" + create_date + ", modify_date=" + modify_date + ", b_Status="
				+ b_Status + ", b_Type=" + b_Type + ", b_Level=" + b_Level + ", mNo=" + mNo + "]";
	}

	
	
	
	
}
