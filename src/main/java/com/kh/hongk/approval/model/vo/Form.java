package com.kh.hongk.approval.model.vo;

import java.util.Date;

public class Form {
	private int form_no;
	private String form_name;
	private String form_content;
	private Date form_create_date;
	private String form_type;
	private String form_category;
	private int mno;
	
	public Form() {}

	public Form(int form_no, String form_name, String form_content, Date form_create_date, String form_type,
			String form_category, int mno) {
		super();
		this.form_no = form_no;
		this.form_name = form_name;
		this.form_content = form_content;
		this.form_create_date = form_create_date;
		this.form_type = form_type;
		this.form_category = form_category;
		this.mno = mno;
	}

	public int getForm_no() {
		return form_no;
	}

	public void setForm_no(int form_no) {
		this.form_no = form_no;
	}

	public String getForm_name() {
		return form_name;
	}

	public void setForm_name(String form_name) {
		this.form_name = form_name;
	}

	public String getForm_content() {
		return form_content;
	}

	public void setForm_content(String form_content) {
		this.form_content = form_content;
	}

	public Date getForm_create_date() {
		return form_create_date;
	}

	public void setForm_create_date(Date form_create_date) {
		this.form_create_date = form_create_date;
	}

	public String getForm_type() {
		return form_type;
	}

	public void setForm_type(String form_type) {
		this.form_type = form_type;
	}

	public String getForm_category() {
		return form_category;
	}

	public void setForm_category(String form_category) {
		this.form_category = form_category;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	@Override
	public String toString() {
		return "Form [form_no=" + form_no + ", form_name=" + form_name + ", form_content=" + form_content
				+ ", form_create_date=" + form_create_date + ", form_type=" + form_type + ", form_category="
				+ form_category + ", mno=" + mno + "]";
	}
	
}
