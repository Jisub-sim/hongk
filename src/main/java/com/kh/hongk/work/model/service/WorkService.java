package com.kh.hongk.work.model.service;

import java.util.ArrayList;

import com.kh.hongk.annual.model.vo.PageInfo;
import com.kh.hongk.approval.model.vo.Approval;
import com.kh.hongk.approval.model.vo.Electronic_Approval;
import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.work.model.vo.Work;

public interface WorkService {

	// 근무 신청 내용
	public int workinsert(Work wk);

	// 나의 근무 내역 조회
	/*public Work selectmywk(int mNo);*/

	// 멤버정보
	public Member selectmember(int mNo);

	// 신청리스트 내역 불러오기
	public ArrayList<Work> selectList(int mNo, PageInfo pi);

	// 페이징 처리를 위해 게시글 게수 조회
	public int selectListCount(int mNo);

	// 클릭한 글 번호 셀렉하기
	public Work selectWork(int work_no);

	public int insertea(Electronic_Approval ea);

	public int insertApprover(Approval appro);

	// 근무신청 글 수정하기
	public int updateWork(Work wk);

	// 근무신청 삭제하기
	public int deleteWork(int work_no);


	




}
