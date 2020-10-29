package com.kh.hongk.project.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.vo.Project;
import com.kh.hongk.project.model.vo.Pteam;

@Repository("pDao")
public class ProjectDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectProjectMember(int pId) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectProjectMember",pId);
	}

	public ArrayList<Project> selectmyProject(int mNo) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectmyProject", mNo);
	}

	public Project projectDetail(int pId) {
		return sqlSession.selectOne("projectMapper.projectDetail",pId);
	}

	public ArrayList<Pteam> selectTeamList(int pId) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectTeamList",pId);
	}

	public ArrayList<Member> selectTmemberlist(int ptId) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectTmember",ptId);
	}

	public int insertPteam(Pteam pt) {
		return sqlSession.insert("projectMapper.insertPteam",pt);
	}

	public ArrayList<Member> selectMember() {
		return (ArrayList)sqlSession.selectList("projectMapper.selectMember");
	}

	public int insertPMember(Project p) {	
		return sqlSession.insert("projectMapper.insertPMember",p);
	}

	public int updatePMember(Pteam pt) {
		List list = pt.getTmList();
		int count = 0;
		for(Object obj : list) {
			sqlSession.update("projectMapper.updatePMember",obj);
			count++;
		}
		if(count == list.size())
			return 1;
		else
			return 0;
	}
	
	

}
