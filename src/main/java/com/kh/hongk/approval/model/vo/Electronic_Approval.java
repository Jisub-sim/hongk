package com.kh.hongk.approval.model.vo;

import java.util.Date;

public class Electronic_Approval {
	private int ea_no;
	private Date draftng_date;
	private Date complete_date;
	private String ea_type;
	private String ea_title;
	private String ea_content;
	private String ea_status;
	private int drafter;
	private int form_no;

	public Electronic_Approval() {}

	public Electronic_Approval(int ea_no, Date draftng_date, Date complete_date, String ea_type, String ea_title,
			String ea_content, String ea_status, int drafter, int form_no) {
		super();
		this.ea_no = ea_no;
		this.draftng_date = draftng_date;
		this.complete_date = complete_date;
		this.ea_type = ea_type;
		this.ea_title = ea_title;
		this.ea_content = ea_content;
		this.ea_status = ea_status;
		this.drafter = drafter;
		this.form_no = form_no;
	}

	public int getEa_no() {
		return ea_no;
	}

	public void setEa_no(int ea_no) {
		this.ea_no = ea_no;
	}

	public Date getDraftng_date() {
		return draftng_date;
	}

	public void setDraftng_date(Date draftng_date) {
		this.draftng_date = draftng_date;
	}

	public Date getComplete_date() {
		return complete_date;
	}

	public void setComplete_date(Date complete_date) {
		this.complete_date = complete_date;
	}

	public String getEa_type() {
		return ea_type;
	}

	public void setEa_type(String ea_type) {
		this.ea_type = ea_type;
	}

	public String getEa_title() {
		return ea_title;
	}

	public void setEa_title(String ea_title) {
		this.ea_title = ea_title;
	}

	public String getEa_content() {
		return ea_content;
	}

	public void setEa_content(String ea_content) {
		this.ea_content = ea_content;
	}

	public String getEa_status() {
		return ea_status;
	}

	public void setEa_status(String ea_status) {
		this.ea_status = ea_status;
	}

	public int getDrafter() {
		return drafter;
	}

	public void setDrafter(int drafter) {
		this.drafter = drafter;
	}

	public int getForm_no() {
		return form_no;
	}

	public void setForm_no(int form_no) {
		this.form_no = form_no;
	}

	@Override
	public String toString() {
		return "electronic_approval [ea_no=" + ea_no + ", draftng_date=" + draftng_date + ", complete_date="
				+ complete_date + ", ea_type=" + ea_type + ", ea_title=" + ea_title + ", ea_content=" + ea_content
				+ ", ea_status=" + ea_status + ", drafter=" + drafter + ", form_no=" + form_no + "]";
	}
	
	
}
