package com.kh.hongk.annual.model.vo;

import java.sql.Date;

public class Annual {
	private int annual_no;
	private Date annual_start;
	private Date annual_end;
	private double annual_day_count;
	private double annual_day_use;
	private double annual_day_remain;
	private int annual_type;
	private String annual_content;
	private String annual_halftime;
	private int mno;
	private Date annual_signupday;
	private String ann_status;
	private String annual_title;

	public Annual() {}

	public Annual(int annual_no, Date annual_start, Date annual_end, double annual_day_count, double annual_day_use,
			double annual_day_remain, int annual_type, String annual_content, String annual_halftime, int mno,
			Date annual_signupday, String ann_status, String annual_title) {
		super();
		this.annual_no = annual_no;
		this.annual_start = annual_start;
		this.annual_end = annual_end;
		this.annual_day_count = annual_day_count;
		this.annual_day_use = annual_day_use;
		this.annual_day_remain = annual_day_remain;
		this.annual_type = annual_type;
		this.annual_content = annual_content;
		this.annual_halftime = annual_halftime;
		this.mno = mno;
		this.annual_signupday = annual_signupday;
		this.ann_status = ann_status;
		this.annual_title = annual_title;
	}

	public int getAnnual_no() {
		return annual_no;
	}

	public void setAnnual_no(int annual_no) {
		this.annual_no = annual_no;
	}

	public Date getAnnual_start() {
		return annual_start;
	}

	public void setAnnual_start(Date annual_start) {
		this.annual_start = annual_start;
	}

	public Date getAnnual_end() {
		return annual_end;
	}

	public void setAnnual_end(Date annual_end) {
		this.annual_end = annual_end;
	}

	public double getAnnual_day_count() {
		return annual_day_count;
	}

	public void setAnnual_day_count(double annual_day_count) {
		this.annual_day_count = annual_day_count;
	}

	public double getAnnual_day_use() {
		return annual_day_use;
	}

	public void setAnnual_day_use(double annual_day_use) {
		this.annual_day_use = annual_day_use;
	}

	public double getAnnual_day_remain() {
		return annual_day_remain;
	}

	public void setAnnual_day_remain(double annual_day_remain) {
		this.annual_day_remain = annual_day_remain;
	}

	public int getAnnual_type() {
		return annual_type;
	}

	public void setAnnual_type(int annual_type) {
		this.annual_type = annual_type;
	}

	public String getAnnual_content() {
		return annual_content;
	}

	public void setAnnual_content(String annual_content) {
		this.annual_content = annual_content;
	}

	public String getAnnual_halftime() {
		return annual_halftime;
	}

	public void setAnnual_halftime(String annual_halftime) {
		this.annual_halftime = annual_halftime;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public Date getAnnual_signupday() {
		return annual_signupday;
	}

	public void setAnnual_signupday(Date annual_signupday) {
		this.annual_signupday = annual_signupday;
	}

	public String getAnn_status() {
		return ann_status;
	}

	public void setAnn_status(String ann_status) {
		this.ann_status = ann_status;
	}

	public String getAnnual_title() {
		return annual_title;
	}

	public void setAnnual_title(String annual_title) {
		this.annual_title = annual_title;
	}

	@Override
	public String toString() {
		return "Annual [annual_no=" + annual_no + ", annual_start=" + annual_start + ", annual_end=" + annual_end
				+ ", annual_day_count=" + annual_day_count + ", annual_day_use=" + annual_day_use
				+ ", annual_day_remain=" + annual_day_remain + ", annual_type=" + annual_type + ", annual_content="
				+ annual_content + ", annual_halftime=" + annual_halftime + ", mno=" + mno + ", annual_signupday="
				+ annual_signupday + ", ann_status=" + ann_status + ", annual_title=" + annual_title + "]";
	}

	





}