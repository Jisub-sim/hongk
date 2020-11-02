package com.kh.hongk.attendance.model.vo;

import java.util.Date;

public class Attendance {
	private int attendance_no;
	private Date work_on;
	private Date work_off;
	private int attendance_type;
	
	public Attendance() {}
	
	public Attendance(int attendance_no, Date work_on, Date work_off, int attendance_type) {
		super();
		this.attendance_no = attendance_no;
		this.work_on = work_on;
		this.work_off = work_off;
		this.attendance_type = attendance_type;
	}
	public int getAttendance_no() {
		return attendance_no;
	}
	public void setAttendance_no(int attendance_no) {
		this.attendance_no = attendance_no;
	}
	public Date getWork_on() {
		return work_on;
	}
	public void setWork_on(Date work_on) {
		this.work_on = work_on;
	}
	public Date getWork_off() {
		return work_off;
	}
	public void setWork_off(Date work_off) {
		this.work_off = work_off;
	}
	public int getAttendance_type() {
		return attendance_type;
	}
	public void setAttendance_type(int attendance_type) {
		this.attendance_type = attendance_type;
	}
	@Override
	public String toString() {
		return "Attendance [attendance_no=" + attendance_no + ", work_on=" + work_on + ", work_off=" + work_off
				+ ", attendance_type=" + attendance_type + "]";
	}
	
	
	
	
}
