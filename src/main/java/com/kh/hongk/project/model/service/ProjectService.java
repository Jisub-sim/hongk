package com.kh.hongk.project.model.service;

import java.io.File;
import java.util.ArrayList;

import com.kh.hongk.approval.model.vo.PageInfo;
import com.kh.hongk.member.model.vo.Files;
import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.vo.Pmember;
import com.kh.hongk.project.model.vo.Project;
import com.kh.hongk.project.model.vo.Pteam;
import com.kh.hongk.project.model.vo.Reply;
import com.kh.hongk.project.model.vo.Request;
import com.kh.hongk.project.model.vo.Task;
import com.kh.hongk.project.model.vo.TrReply;

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
	// task detail 가져오는 메소드
	public Task selectTask(int twId);
	// mNo 한명 가져오기
	public Member selectMemberOne(int twManager);
	// manager update 메소드
	public int updateManager(Task t);
	// 업무 파일 등록 메소드 
	public int insertFile(Files f);
	// file list 가져오는 메소드
	public ArrayList<Files> selectFileList(int twId,PageInfo pi);
	// file 갯수 Count
	public int fListCount(int twId);
	// 댓글 추가 메소드 
	public int insertReply(Reply r);
	// 댓글 리스트 가져오는 메소드
	public ArrayList<Reply> selectReplyList(int twId);
	// twork댓글 지우는 메소드
	public int deleteReply(int wrId);
	// pId task Count 메소드
	public ArrayList selectTaskCount(int pId);
	// 완료된 pId task 메소드
	public ArrayList<Pteam> selectCompleteTask(int pId);
	// task 상태 변경 메소드
	public int twStatusUpdate(int twId);
	// ptId 이외의 team 가져오는 메소드
	public ArrayList<Pteam> selectOtherTeam(Pmember pm);
	// Request 삽입 메소드
	public int insertRequest(Request rq);
	// ptId에 맞는 요청 가져오는 메소드
	public ArrayList<Request> selectRequestList(int ptId);
	// trId에 맞는 Request 가져오기 메소드
	public Request selectAsk(int trId);
	// request 담당자 지정 메소드
	public int updateRequestManager(Request rq);
	// TrReply Insert 메소드
	public int insertTrReply(TrReply reply);
	// TrReply List 가져오는 메소드
	public 	ArrayList<TrReply> selectTrlist(int trId);
	// TrReply 삭제 메소드
	public int deleteRReply(int rrId);
	// Ask File insert 메소드
	public int insertAFile(Files f);
	// ask File select 메소드
	public Files selectAskFile(int trId);
	// main 상위 5개 pId만 뽑는 메소드
	public ArrayList<Project> selectmyProjectMain(int mNo);
	
	

}
