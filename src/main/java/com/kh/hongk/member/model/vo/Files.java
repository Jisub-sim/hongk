package com.kh.hongk.member.model.vo;

import java.sql.Date;

public class Files {
	private int file_no;
	private int ref_no;
	private String original_FileName;
	private String reName_FileName;
	private Date save_Date;
	private String File_type;
	
	public Files() {}
	
	public Files(int file_no, int ref_no, String original_FileName, String reName_FileName, Date save_Date,
			String file_type) {
		super();
		this.file_no = file_no;
		this.ref_no = ref_no;
		this.original_FileName = original_FileName;
		this.reName_FileName = reName_FileName;
		this.save_Date = save_Date;
		File_type = file_type;
	}

	public int getFile_no() {
		return file_no;
	}

	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}

	public int getRef_no() {
		return ref_no;
	}

	public void setRef_no(int ref_no) {
		this.ref_no = ref_no;
	}

	public String getOriginal_FileName() {
		return original_FileName;
	}

	public void setOriginal_FileName(String original_FileName) {
		this.original_FileName = original_FileName;
	}

	public String getReName_FileName() {
		return reName_FileName;
	}

	public void setReName_FileName(String reName_FileName) {
		this.reName_FileName = reName_FileName;
	}

	public Date getSave_Date() {
		return save_Date;
	}

	public void setSave_Date(Date save_Date) {
		this.save_Date = save_Date;
	}

	public String getFile_type() {
		return File_type;
	}

	public void setFile_type(String file_type) {
		File_type = file_type;
	}

	@Override
	public String toString() {
		return "Files [file_no=" + file_no + ", ref_no=" + ref_no + ", original_FileName=" + original_FileName
				+ ", reName_FileName=" + reName_FileName + ", save_Date=" + save_Date + ", File_type=" + File_type
				+ "]";
	}
}
