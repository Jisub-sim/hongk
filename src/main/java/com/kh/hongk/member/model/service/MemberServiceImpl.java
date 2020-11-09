package com.kh.hongk.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.hongk.approval.model.vo.Electronic_Approval;
import com.kh.hongk.member.model.dao.MemberDao;
import com.kh.hongk.member.model.vo.Files;
import com.kh.hongk.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	@Override
	public Member loginMember(Member m) {
		System.out.println("ID : " + m.getmId());
		System.out.println("PWD : " + m.getmPwd());
		Member loginUser = mDao.selectMember(m);
		System.out.println("ID : " + loginUser.getmId());
		System.out.println("PWD : " + loginUser.getmPwd());
		if(loginUser != null && /*!bcryptPasswordEncoder.matches(m.getmPwd(), loginUser.getmPwd())&&*/
			 !m.getmPwd().equals(loginUser.getmPwd())) {
			loginUser = null;
		}
		return loginUser;
	}
	// 직급 및 부서 조회
	@Override
	public ArrayList<Member> jobList() {
		return mDao.jobList();
	}
	@Override
	public ArrayList<Member> deptList() {
		return mDao.deptList();
	}
	//아이디 중복 체크를 위한 메소드
	@Override
	public int checkIdDup(String id) {
		return mDao.checkIdDup(id);
	}
	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(m);
	}
	// 회원 수정
	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(m);
	}

	
	@Override
	public Member selectattmember(Member m) {
		return mDao.selectattmember(m);
	}
	// 프로필 등록
	@Override
	public int Fileinsert(Files f) {
		return mDao.Fileinsert(f);
	}
	// 등록된 프로필이 있는가
	@Override
	public Files selectProFiles(int mno) {
		return mDao.selectProFiles(mno);
	}
	// 기존 프로피 파일 삭제
	@Override
	public int FileDelete(int file_no) {
		return mDao.FileDelete(file_no);
	}
	
	public ArrayList<Electronic_Approval> listWp(int mno) {
		return mDao.listWp(mno);

	}
	@Override
	public ArrayList<Member> selectList() {
		return mDao.selectList();
	}
}
