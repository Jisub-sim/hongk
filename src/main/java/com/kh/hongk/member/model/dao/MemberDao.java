package com.kh.hongk.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
