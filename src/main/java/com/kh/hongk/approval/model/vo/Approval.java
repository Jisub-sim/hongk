package com.kh.hongk.approval.model.vo;

import java.util.Date;

public class Approval {
	private int ap_id;
	private Date approval_date;
	private int approval_lelvel;
	private String approval_status;
	private String approval_comment;
	private int approver_no;
	private int ea_no;

	private String mName;
	private String deptCode;
	private String deptTitle;
	private String job_Code;
	private String job_Title;
	

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getDeptTitle() {
		return deptTitle;
	}

	public void setDeptTitle(String deptTitle) {
		this.deptTitle = deptTitle;
	}

	public String getJob_Code() {
		return job_Code;
	}

	public void setJob_Code(String job_Code) {
		this.job_Code = job_Code;
	}

	public String getJob_Title() {
		return job_Title;
	}

	public void setJob_Title(String job_Title) {
		this.job_Title = job_Title;
	}

	public Approval() {}

	public Approval(int approval_lelvel, int approver_no) {
		super();
		this.approval_lelvel = approval_lelvel;
		this.approver_no = approver_no;
	}

	public Approval(int ap_id, Date approval_date, int approval_lelvel, String approval_status, String approval_comment,
			int approver_no, int ea_no) {
		super();
		this.ap_id = ap_id;
		this.approval_date = approval_date;
		this.approval_lelvel = approval_lelvel;
		this.approval_status = approval_status;
		this.approval_comment = approval_comment;
		this.approver_no = approver_no;
		this.ea_no = ea_no;
	}

	public int getAp_id() {
		return ap_id;
	}

	public void setAp_id(int ap_id) {
		this.ap_id = ap_id;
	}

	public Date getApproval_date() {
		return approval_date;
	}

	public void setApproval_date(Date approval_date) {
		this.approval_date = approval_date;
	}

	public int getApproval_lelvel() {
		return approval_lelvel;
	}

	public void setApproval_lelvel(int approval_lelvel) {
		this.approval_lelvel = approval_lelvel;
	}

	public String getApproval_status() {
		return approval_status;
	}

	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}

	public String getApproval_comment() {
		return approval_comment;
	}

	public void setApproval_comment(String approval_comment) {
		this.approval_comment = approval_comment;
	}

	public int getApprover_no() {
		return approver_no;
	}

	public void setApprover_no(int approver_no) {
		this.approver_no = approver_no;
	}

	public int getEa_no() {
		return ea_no;
	}

	public void setEa_no(int ea_no) {
		this.ea_no = ea_no;
	}

	@Override
	public String toString() {
		return "Approval [ap_id=" + ap_id + ", approval_date=" + approval_date + ", approval_lelvel=" + approval_lelvel
				+ ", approval_status=" + approval_status + ", approval_comment=" + approval_comment + ", approver_no="
				+ approver_no + ", ea_no=" + ea_no + ", mName=" + mName + ", deptCode=" + deptCode + ", deptTitle="
				+ deptTitle + ", job_Code=" + job_Code + ", job_Title=" + job_Title + "]";
	}

	
	

}
