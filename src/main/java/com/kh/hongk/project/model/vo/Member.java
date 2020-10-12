package com.kh.hongk.project.model.vo;

import java.sql.Date;

public class Member {
	private int mNo;
	private String mId;
	private String mPwd;
	private String mName;
	private int age;
	private String gender;
	private String email;
	private String address;
	private String phone;
	private String exNumber;
	private Date hireDate;
	private Date entDate;
	private String mLevel;
	private String mStatus;
	private String deptCode;
	private String jobCode;

	public Member() {}

	public Member(int mNo, String mId, String mPwd, String mName, int age, String gender, String email, String address,
			String phone, String exNumber, Date hireDate, Date entDate, String mLevel, String mStatus, String deptCode,
			String jobCode) {
		super();
		this.mNo = mNo;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mName = mName;
		this.age = age;
		this.gender = gender;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.exNumber = exNumber;
		this.hireDate = hireDate;
		this.entDate = entDate;
		this.mLevel = mLevel;
		this.mStatus = mStatus;
		this.deptCode = deptCode;
		this.jobCode = jobCode;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPwd() {
		return mPwd;
	}

	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getExNumber() {
		return exNumber;
	}

	public void setExNumber(String exNumber) {
		this.exNumber = exNumber;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}

	public Date getEntDate() {
		return entDate;
	}

	public void setEntDate(Date entDate) {
		this.entDate = entDate;
	}

	public String getmLevel() {
		return mLevel;
	}

	public void setmLevel(String mLevel) {
		this.mLevel = mLevel;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getJobCode() {
		return jobCode;
	}

	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}

	@Override
	public String toString() {
		return "Member [mNo=" + mNo + ", mId=" + mId + ", mPwd=" + mPwd + ", mName=" + mName + ", age=" + age
				+ ", gender=" + gender + ", email=" + email + ", address=" + address + ", phone=" + phone
				+ ", exNumber=" + exNumber + ", hireDate=" + hireDate + ", entDate=" + entDate + ", mLevel=" + mLevel
				+ ", mStatus=" + mStatus + ", deptCode=" + deptCode + ", jobCode=" + jobCode + "]";
	}
	
}
