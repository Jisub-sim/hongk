package com.kh.hongk.project.model.vo;

public class Pmember {
	private int mNo;
	private String pKinds;
	private String pmStatus;
	private int ptId;
	private int pId;
	
	public Pmember() {}

	public Pmember(int mNo, String pKinds, String pmStatus, int ptId, int pId) {
		super();
		this.mNo = mNo;
		this.pKinds = pKinds;
		this.pmStatus = pmStatus;
		this.ptId = ptId;
		this.pId = pId;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getpKinds() {
		return pKinds;
	}

	public void setpKinds(String pKinds) {
		this.pKinds = pKinds;
	}

	public String getPmStatus() {
		return pmStatus;
	}

	public void setPmStatus(String pmStatus) {
		this.pmStatus = pmStatus;
	}

	public int getPtId() {
		return ptId;
	}

	public void setPtId(int ptId) {
		this.ptId = ptId;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	@Override
	public String toString() {
		return "Pmember [mNo=" + mNo + ", pKinds=" + pKinds + ", pmStatus=" + pmStatus + ", ptId=" + ptId + ", pId="
				+ pId + "]";
	}
	
	

}
