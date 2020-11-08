package com.kh.hongk.attendance.model.service;

import java.util.ArrayList;

import com.kh.hongk.annual.model.vo.PageInfo;
import com.kh.hongk.attendance.model.vo.Attendance;
import com.kh.hongk.attendance.model.vo.Search;

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
	public ArrayList<Attendance> selectList(int mNo, PageInfo pi);

	// 전체 게시글 수 불러오기
	public int selectallListCount(int mNo);

	// 검색 Count
	public int shListCount(int mNo, Search search);

	// 검색 리스트
	public ArrayList<Attendance> attSearch(PageInfo pi, Search search);

	// 미처리
	public int selectworkoffCount(int mNo);




	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
