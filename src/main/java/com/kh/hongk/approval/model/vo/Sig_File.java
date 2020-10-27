package com.kh.hongk.approval.model.vo;

import java.util.Date;

public class Sig_File {
	private int sig_no;
	private int file_no;
	private int mno;
	private String sig_status;
	
	private String reName_FileName;
	private String original_FileName;
	private Date save_Date;
	

	public Sig_File() {}


	public Sig_File(int sig_no, int file_no, int mno, String sig_status, String reName_FileName,
			String original_FileName, Date save_Date) {
		super();
		this.sig_no = sig_no;
		this.file_no = file_no;
		this.mno = mno;
		this.sig_status = sig_status;
		this.reName_FileName = reName_FileName;
		this.original_FileName = original_FileName;
		this.save_Date = save_Date;
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


	public String getSig_status() {
		return sig_status;
	}


	public void setSig_status(String sig_status) {
		this.sig_status = sig_status;
	}


	public String getReName_FileName() {
		return reName_FileName;
	}


	public void setReName_FileName(String reName_FileName) {
		this.reName_FileName = reName_FileName;
	}


	public String getOriginal_FileName() {
		return original_FileName;
	}


	public void setOriginal_FileName(String original_FileName) {
		this.original_FileName = original_FileName;
	}


	public Date getSave_Date() {
		return save_Date;
	}


	public void setSave_Date(Date save_Date) {
		this.save_Date = save_Date;
	}


	@Override
	public String toString() {
		return "Sig_File [sig_no=" + sig_no + ", file_no=" + file_no + ", mno=" + mno + ", sig_status=" + sig_status
				+ ", reName_FileName=" + reName_FileName + ", original_FileName=" + original_FileName + ", save_Date="
				+ save_Date + "]";
	}

	


	
}
