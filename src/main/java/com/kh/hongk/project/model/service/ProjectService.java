package com.kh.hongk.project.model.service;

import java.util.ArrayList;

import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.vo.Project;

public interface ProjectService {
	// 팀추가 시 조직도 가져오는 메소드
	public ArrayList<Member> selectMemberList();
	// 내가 관련된 project List 가져오는 메소드
	public ArrayList<Project> selectmyProject(int mNo);

}
