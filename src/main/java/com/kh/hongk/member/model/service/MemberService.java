package com.kh.hongk.member.model.service;

import java.util.ArrayList;

import com.kh.hongk.member.model.vo.Files;
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
	// 프로필 등록
	public int Fileinsert(Files f);
	// 등록된 프로필이 있는가
	public Files selectProFiles(int mno);
	// 기존 프로필 파일 삭제
	public int FileDelete(int file_no);

	public ArrayList<Member> selectList();



}
