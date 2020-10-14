package com.kh.hongk.project.model.vo;

import java.util.List;

public class Pteam {
	private int ptId;
	private String ptTitle;
	private String ptContent;
	private String ptStatus;
	private int pId;
	private int mCount;
	private String mList;
	
	public Pteam() {}

	public Pteam(int ptId, String ptTitle, String ptContent, String ptStatus, int pId) {
		super();
		this.ptId = ptId;
		this.ptTitle = ptTitle;
		this.ptContent = ptContent;
		this.ptStatus = ptStatus;
		this.pId = pId;
	}
	

	public Pteam(int ptId, String ptTitle, String ptContent, String ptStatus, int pId, int mCount) {
		super();
		this.ptId = ptId;
		this.ptTitle = ptTitle;
		this.ptContent = ptContent;
		this.ptStatus = ptStatus;
		this.pId = pId;
		this.mCount = mCount;
	}
	

	public Pteam(int ptId, String ptTitle, String ptContent, String ptStatus, int pId, int mCount, String mList) {
		super();
		this.ptId = ptId;
		this.ptTitle = ptTitle;
		this.ptContent = ptContent;
		this.ptStatus = ptStatus;
		this.pId = pId;
		this.mCount = mCount;
		this.mList = mList;
	}

	public int getPtId() {
		return ptId;
	}

	public void setPtId(int ptId) {
		this.ptId = ptId;
	}

	public String getPtTitle() {
		return ptTitle;
	}

	public void setPtTitle(String ptTitle) {
		this.ptTitle = ptTitle;
	}

	public String getPtContent() {
		return ptContent;
	}

	public void setPtContent(String ptContent) {
		this.ptContent = ptContent;
	}

	public String getPtStatus() {
		return ptStatus;
	}

	public void setPtStatus(String ptStatus) {
		this.ptStatus = ptStatus;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public int getmCount() {
		return mCount;
	}

	public void setmCount(int mCount) {
		this.mCount = mCount;
	}

	public String getmList() {
		return mList;
	}

	public void setmList(String mList) {
		this.mList = mList;
	}

	@Override
	public String toString() {
		return "Pteam [ptId=" + ptId + ", ptTitle=" + ptTitle + ", ptContent=" + ptContent + ", ptStatus=" + ptStatus
				+ ", pId=" + pId + ", mCount=" + mCount + ", mList=" + mList + "]";
	}

	

	

}
