package com.kh.hongk.board.model.vo;

import java.util.Date;

public class Reply{
	
	private int rId;
	private String rContent;
	private String rWriter;
	private Date r_Create_Date;
	private Date r_Modify_Date;
	private String r_Status;
	private int refBid;
	
	public Reply() {
		
	}

	public Reply(int rId, String rContent, String rWriter, Date r_Create_Date, Date r_Modify_Date, String r_Status,
			int refBid) {
		super();
		this.rId = rId;
		this.rContent = rContent;
		this.rWriter = rWriter;
		this.r_Create_Date = r_Create_Date;
		this.r_Modify_Date = r_Modify_Date;
		this.r_Status = r_Status;
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

	public Date getR_Create_Date() {
		return r_Create_Date;
	}

	public void setR_Create_Date(Date r_Create_Date) {
		this.r_Create_Date = r_Create_Date;
	}

	public Date getR_Modify_Date() {
		return r_Modify_Date;
	}

	public void setR_Modify_Date(Date r_Modify_Date) {
		this.r_Modify_Date = r_Modify_Date;
	}

	public String getR_Status() {
		return r_Status;
	}

	public void setR_Status(String r_Status) {
		this.r_Status = r_Status;
	}

	public int getRefBid() {
		return refBid;
	}

	public void setRefBid(int refBid) {
		this.refBid = refBid;
	}

	@Override
	public String toString() {
		return "Reply [rId=" + rId + ", rContent=" + rContent + ", rWriter=" + rWriter + ", r_Create_Date="
				+ r_Create_Date + ", r_Modify_Date=" + r_Modify_Date + ", r_Status=" + r_Status + ", refBid=" + refBid
				+ "]";
	}

	
	
	

}
