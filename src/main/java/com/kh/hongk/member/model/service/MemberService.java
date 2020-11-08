package com.kh.hongk.member.model.service;

import com.kh.hongk.attendance.model.vo.Attendance;
import com.kh.hongk.member.model.vo.Member;

public interface MemberService {
	
	// 로그인 메소드
	public Member loginMember(Member m);

	//public Member attTime(int getmNo);

	public Attendance AttendancenceSelect(int mNo);

	public Member selectattmember(Member m);



}
