package com.kh.hongk.work.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Work {
	private int work_no;
	private int mno;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date work_date;
	private Date work_time;
	private String work_content;
	private int work_type;
	@DateTimeFormat(pattern = "HH:mm")
	private Date start_time;
	@DateTimeFormat(pattern = "HH:mm")
	private Date end_time;
	private String wk_status;
	private String work_title;
	
	public Work() {}

	public Work(int work_no, int mno, Date work_date, Date work_time, String work_content, int work_type,
			Date start_time, Date end_time, String wk_status, String work_title) {
		super();
		this.work_no = work_no;
		this.mno = mno;
		this.work_date = work_date;
		this.work_time = work_time;
		this.work_content = work_content;
		this.work_type = work_type;
		this.start_time = start_time;
		this.end_time = end_time;
		this.wk_status = wk_status;
		this.work_title = work_title;
	}

	public int getWork_no() {
		return work_no;
	}

	public void setWork_no(int work_no) {
		this.work_no = work_no;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public Date getWork_date() {
		return work_date;
	}

	public void setWork_date(Date work_date) {
		this.work_date = work_date;
	}

	public Date getWork_time() {
		return work_time;
	}

	public void setWork_time(Date work_time) {
		this.work_time = work_time;
	}

	public String getWork_content() {
		return work_content;
	}

	public void setWork_content(String work_content) {
		this.work_content = work_content;
	}

	public int getWork_type() {
		return work_type;
	}

	public void setWork_type(int work_type) {
		this.work_type = work_type;
	}

	public Date getStart_time() {
		return start_time;
	}

	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}

	public Date getEnd_time() {
		return end_time;
	}

	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}

	public String getWk_status() {
		return wk_status;
	}

	public void setWk_status(String wk_status) {
		this.wk_status = wk_status;
	}

	public String getWork_title() {
		return work_title;
	}

	public void setWork_title(String work_title) {
		this.work_title = work_title;
	}

	@Override
	public String toString() {
		return "Work [work_no=" + work_no + ", mno=" + mno + ", work_date=" + work_date + ", work_time=" + work_time
				+ ", work_content=" + work_content + ", work_type=" + work_type + ", start_time=" + start_time
				+ ", end_time=" + end_time + ", wk_status=" + wk_status + ", work_title=" + work_title + "]";
	}

	
	
	
}

