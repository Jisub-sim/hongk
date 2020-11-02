package com.kh.hongk.approval.model.vo;

public class Referrer {

	private int re_no;
	private int ea_no;
	private String mName;
	
	public Referrer() {}

	public Referrer(int re_no, int ea_no) {
		super();
		this.re_no = re_no;
		this.ea_no = ea_no;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public int getRe_no() {
		return re_no;
	}

	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}

	public int getEa_no() {
		return ea_no;
	}

	public void setEa_no(int ea_no) {
		this.ea_no = ea_no;
	}

	@Override
	public String toString() {
		return "Referrer [re_no=" + re_no + ", ea_no=" + ea_no + "]";
	}
	
}
