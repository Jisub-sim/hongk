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

	public ArrayList<Member> selectList() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("memberMapper.selectList");
	}

}
