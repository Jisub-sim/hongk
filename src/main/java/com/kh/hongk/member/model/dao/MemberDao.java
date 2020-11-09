package com.kh.hongk.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hongk.approval.model.vo.Electronic_Approval;
import com.kh.hongk.member.model.vo.Files;
import com.kh.hongk.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Member selectMember(Member m) {
		return sqlSession.selectOne("memberMapper.selectOne", m);
	}
	// 직급 및 직책 조회
	public ArrayList<Member> jobList() {
		return  (ArrayList)sqlSession.selectList("memberMapper.jobList");
	}
	public ArrayList<Member> deptList() {
		return  (ArrayList)sqlSession.selectList("memberMapper.deptList");
	}
	public int checkIdDup(String id) {
		return sqlSession.selectOne("memberMapper.idCheck", id);
	}
	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	// 회원 수정
	public int updateMember(Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}
	
	public Member selectattmember(Member m) {
		return sqlSession.selectOne("memberMapper.selectattmember", m);
	}
	// 프로필 사진 등록
	public int Fileinsert(Files f) {
		return sqlSession.insert("memberMapper.Fileinsert", f);
	}
	// 등록된 프로필이 있는가
	public Files selectProFiles(int mno) {
		return sqlSession.selectOne("memberMapper.selectProFiles", mno);
	}
	// 기존 프로필 파일 삭제
	public int FileDelete(int file_no) {
		return  sqlSession.delete("memberMapper.FileDelete", file_no);
	}

	public ArrayList<Member> selectList() {
		return (ArrayList)sqlSession.selectList("memberMapper.selectList");
	}
	
	public ArrayList<Electronic_Approval> listWp(int mno) {
		return (ArrayList)sqlSession.selectList("eaMapper.listWp", mno);

	}

}
