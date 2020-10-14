package com.kh.hongk.project.model.service;

import java.util.ArrayList;

import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.vo.Project;
import com.kh.hongk.project.model.vo.Pteam;

public interface ProjectService {
	// 팀추가 시 조직도 가져오는 메소드
	public ArrayList<Member> selectProjectMember(int pId);
	// 내가 관련된 project List 가져오는 메소드
	public ArrayList<Project> selectmyProject(int mNo);
	// Click 된 Project Detail 가져오는 메소드
	public Project projectDetail(int pId);
	// Project에 맞는 Team list 가져오는 메소드
	public ArrayList<Pteam> selectTeamlist(int pId);
	// team 에 맞는 사원 정보 가져오기
	public ArrayList<Member> selectTmemberlist(int ptId);

}
