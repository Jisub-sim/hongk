package com.kh.hongk.calendar.model.service;

import java.util.ArrayList;

import com.kh.hongk.annual.model.vo.Annual;
import com.kh.hongk.calendar.model.vo.Calendar1;
import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.vo.Pmember;
import com.kh.hongk.project.model.vo.Project;
import com.kh.hongk.project.model.vo.Pteam;

public interface CalendarService {
	// 캘린더 일정 리스트 가져오는 메소드 
	ArrayList<Calendar1> selectCalendarList(Calendar1 c);
	// 일일 개인일정  리스트 가져오는 메소드
	ArrayList<Calendar1> selectOnedayList(Calendar1 c);
	// 일정 등록 전 프로젝트명 찾아오는 메소드
	ArrayList<Project> selectProjectTitleList();
	// 일정 등록 전 같은 날, 같은 시간 일정 있는지 확인하는 메소드
	ArrayList<Calendar1> selectInsertCheck(Calendar1 c);
	// 일정 등록 전 휴가, 반차 확인하는 메소드
	ArrayList<Annual> selectCalAnnualCheck(String cDate);
	// 일일 일정 등록하는 메소드
	int insertCalendar(Calendar1 c);
	// 수정 화면에 일일 일정 가져오는 메소드
	Calendar1 selectOnedayUpView(int cId);
	// 일일 일정 수정하는 메소드
	int updateCalendar(Calendar1 c);
	// 일일 일정 삭제하는 메소드
	int delectCalendar(int cId);
	// 월간 부서일정 부서원 리스트 가져오는 메소드
	ArrayList<Member> selectCalDMemberList(String deptCode);
	// 로그인유저 팀정보 가져오는 메소드(아래 팀원 리스트 가져올때 사용)
	Pmember selectCalPid(int mNo);
	// 월간 팀일정 팀원 리스트 가져오는 메소드
	ArrayList<Member> selectCalTMemberList(int pId);
	// 휴가, 반차 리스트 가져오는 메소드
	ArrayList<Annual> selectCalAnnualList(int mNo);
	
	
	
	
	


}
