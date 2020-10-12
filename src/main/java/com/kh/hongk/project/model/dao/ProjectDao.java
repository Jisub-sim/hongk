package com.kh.hongk.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hongk.project.model.vo.Member;

@Repository("pDao")
public class ProjectDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectMemberList() {
		return (ArrayList)sqlSession.selectList("projectMapper.selectMemberList",null,null);
	}
	
	

}
