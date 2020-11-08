package com.kh.hongk.project.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.vo.Pmember;
import com.kh.hongk.project.model.vo.Project;
import com.kh.hongk.project.model.vo.Pteam;
import com.kh.hongk.project.model.vo.Task;

public interface ProjectService {
	// 팀추가 시 조직도 가져오는 메소드
	public ArrayList<Member> selectProjectMember(int pId);
	// 내가 관련된 project List 가져오는 메소드
	public ArrayList<Project> selectmyProject(int mNo);
	// Click 된 Project Detail 가져오는 메소드
	public Project projectDetail(int pId);
	// Project에 맞는 Team list 가져오는 메소드
	public ArrayList<Pteam> selectTeamlist(int pId);
	// team 에 맞는 사원 정보 가져오는 메소드
	public ArrayList<Member> selectTmemberlist(int ptId);
	// team 삽입 하는 메소드
	public int insertPteam(Pteam pt);
	// 전체 조직도 가져오는 메소드
	public ArrayList<Member> selectMember();
	// Project 인원 편성 메소드
	public int insertPMember(Project p);
	// Pmember 수정 (team 추가)
	public int updatePMember(Pteam pt);
	// Team 정보 가져오기 메소드
	public Pteam selectPTeam(int ptId);
	// Team 수정하는 메소드
	public int teamUpdate(Pteam pt);
	// 기존 인원 삭제 메소드
	public int deletePMember(Project deleteP);
	// Team 삭제
	public int deleteTeam(int ptId);
	// progress 변경 메소드
	public int updateProgress(Project p);
	// mNo에 맞는 정보 가져오기 
	public Pmember selectMemberTeam(Pmember p);
	// task 삽입 메소드 
	public int insertTask(Task t);
	// task list 가져오는 메소드
	public ArrayList<Task> selectTaskList(Pmember p);
	

}
