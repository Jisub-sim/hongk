package com.kh.hongk.approval.model.vo;

public class Sig_File {
	private int sig_no;
	private int file_no;
	private int mno;
	private String sig_statis;
	
	public Sig_File() {}

	public Sig_File(int sig_no, int file_no, int mno, String sig_statis) {
		super();
		this.sig_no = sig_no;
		this.file_no = file_no;
		this.mno = mno;
		this.sig_statis = sig_statis;
	}

	public int getSig_no() {
		return sig_no;
	}

	public void setSig_no(int sig_no) {
		this.sig_no = sig_no;
	}

	public int getFile_no() {
		return file_no;
	}

	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getSig_statis() {
		return sig_statis;
	}

	public void setSig_statis(String sig_statis) {
		this.sig_statis = sig_statis;
	}

	@Override
	public String toString() {
		return "Sig_File [sig_no=" + sig_no + ", file_no=" + file_no + ", mno=" + mno + ", sig_statis=" + sig_statis
				+ "]";
	}
	
}
