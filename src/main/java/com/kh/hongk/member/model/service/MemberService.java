package com.kh.hongk.member.model.service;

import java.util.ArrayList;

import com.kh.hongk.member.model.vo.Member;

public interface MemberService {
	
	// 로그인 메소드
	public Member loginMember(Member m);

	// 부서 및 직급 조회
	public ArrayList<Member> jobList();
	public ArrayList<Member> deptList();
	// 아이디 중복 체크를 위한 메소드
	public int checkIdDup(String id);

	// 회원 가입
	public int insertMember(Member m);
	// 회원 정보 수정
	public int updateMember(Member m);
	
	public Member selectattmember(Member m);



}
