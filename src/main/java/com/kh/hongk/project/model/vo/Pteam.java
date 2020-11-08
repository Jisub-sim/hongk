package com.kh.hongk.project.model.vo;

import java.util.List;

public class Pteam {
	private int ptId;
	private String ptTitle;
	private String ptContent;
	private String ptStatus;
	private int pId;
	private int mCount;
	private String mList; // teamcare memberList 가져오기 위한 임의 변수
	private List TmList;
	private int tCount; // Task Count
	private int persent; 
	public Pteam() {}

	public Pteam(int ptId, String ptTitle, String ptContent, String ptStatus, int pId, int mCount, String mList,
			List tmList) {
		super();
		this.ptId = ptId;
		this.ptTitle = ptTitle;
		this.ptContent = ptContent;
		this.ptStatus = ptStatus;
		this.pId = pId;
		this.mCount = mCount;
		this.mList = mList;
		TmList = tmList;
	}



	public Pteam(int ptId, String ptTitle, String ptContent, String ptStatus, int pId, int mCount, String mList,
			List tmList, int tCount, int persent) {
		super();
		this.ptId = ptId;
		this.ptTitle = ptTitle;
		this.ptContent = ptContent;
		this.ptStatus = ptStatus;
		this.pId = pId;
		this.mCount = mCount;
		this.mList = mList;
		TmList = tmList;
		this.tCount = tCount;
		this.persent = persent;
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

	public List getTmList() {
		return TmList;
	}

	public void setTmList(List tmList) {
		TmList = tmList;
	}
	
	public int gettCount() {
		return tCount;
	}

	public void settCount(int tCount) {
		this.tCount = tCount;
	}

	public int getPersent() {
		return persent;
	}

	public void setPersent(int persent) {
		this.persent = persent;
	}

	@Override
	public String toString() {
		return "Pteam [ptId=" + ptId + ", ptTitle=" + ptTitle + ", ptContent=" + ptContent + ", ptStatus=" + ptStatus
				+ ", pId=" + pId + ", mCount=" + mCount + ", mList=" + mList + ", TmList=" + TmList + ", tCount="
				+ tCount + ", persent=" + persent + "]";
	}
	

	
}

