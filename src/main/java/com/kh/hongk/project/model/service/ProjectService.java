package com.kh.hongk.project.model.service;

import java.util.ArrayList;

import com.kh.hongk.member.model.vo.Member;

public interface ProjectService {
	// 팀추가 시 조직도 가져오는 메소드
	ArrayList<Member> selectMemberList();

}
