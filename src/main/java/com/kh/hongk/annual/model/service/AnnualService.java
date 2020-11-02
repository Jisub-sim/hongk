package com.kh.hongk.annual.model.service;

import java.util.ArrayList;

import com.kh.hongk.annual.model.vo.Annual;
import com.kh.hongk.annual.model.vo.PageInfo;
import com.kh.hongk.approval.model.vo.Approval;
import com.kh.hongk.approval.model.vo.Electronic_Approval;
import com.kh.hongk.member.model.vo.Member;

public interface AnnualService {

	// 휴가신청하기
	int Annualinsert(Annual ann);

	// 휴가목록 조회
	public ArrayList<Annual> selectList(int mNo, PageInfo pi);

	// 나의 연차내역 조회
	public Annual selectmyann(int mNo);

	// 멤버 정보 
	public Member selectmember(int mNo);

	// 게시글 갯수 구하기
	public int selectListCount(int mNo);

	// 상세보기
	public Annual selectAnnual(int annual_no);

	// 휴가신청 수정하기
	public int updateAnnual(Annual ann);

	public int deleteAnnual(int annual_no);

	// 휴가완료 내역 
	public int selectListendCount(int mNo);

	// 휴가완료 내역 
	public ArrayList<Annual> selectendList(int mNo, PageInfo pi);

	// 전자결재
	int insertea(Electronic_Approval ea);

	// 결재자 등록
	int insertApprover(Approval appro);







}