package com.kh.hongk.attendance.model.service;

import java.util.ArrayList;

import com.kh.hongk.attendance.model.vo.Attendance;

public interface AttendanceService {

	// 출근 입력 메소드
	public int Attendanceinsert(int mno);

	// 출근 시간 보여지기
	public Attendance AttendancenceSelect(int mNo);

	// 퇴근 입력 메소드
	public int AttendanceUpdate(int mNo);

	// 지각 입력
	public int AttendanceOverinsert(int mNo);

	// 지각 조회
	public int selectListovertimeCount(int mNo);

	// 정상근무 조회
	public int selectListworkCount(int mNo);

	// 지각포함 조회
	public int selectListCount(int mNo);

	int AttendanceListinsert(Attendance att);

	// 근태 전체 리스트 불러오기
	public ArrayList<Attendance> selectList(int mNo);


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
