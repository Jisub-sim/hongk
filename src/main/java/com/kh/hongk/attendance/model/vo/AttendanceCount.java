package com.kh.hongk.attendance.model.vo;

public class AttendanceCount {

	private int overtimeCount;
	private int workCount;
	private int listCount;
	
	
	public AttendanceCount() {}


	public AttendanceCount(int overtimeCount, int workCount, int listCount) {
		super();
		this.overtimeCount = overtimeCount;
		this.workCount = workCount;
		this.listCount = listCount;
	}


	public int getOvertimeCount() {
		return overtimeCount;
	}


	public void setOvertimeCount(int overtimeCount) {
		this.overtimeCount = overtimeCount;
	}


	public int getWorkCount() {
		return workCount;
	}


	public void setWorkCount(int workCount) {
		this.workCount = workCount;
	}


	public int getListCount() {
		return listCount;
	}


	public void setListCount(int listCount) {
		this.listCount = listCount;
	}


	@Override
	public String toString() {
		return "AttendanceCount [overtimeCount=" + overtimeCount + ", workCount=" + workCount + ", listCount="
				+ listCount + "]";
	}
	
	
	
}
