package com.kh.hongk.member.model.service;

import java.util.ArrayList;

import com.kh.hongk.member.model.vo.Member;

public interface MemberService {
	
	// 로그인 메소드
	public Member loginMember(Member m);

	public ArrayList<Member> selectList();




}
