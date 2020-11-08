package com.kh.hongk.project.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.vo.Pmember;
import com.kh.hongk.project.model.vo.Project;
import com.kh.hongk.project.model.vo.Pteam;
import com.kh.hongk.project.model.vo.Task;

import sun.security.timestamp.TSRequest;

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
		/*List list = pt.getTmList();
		int count = 0;
		for(Object obj : list) {
			sqlSession.update("projectMapper.updatePMember",obj);
			count++;
		}
		if(count == list.size())
			return 1;
		else*/
			return sqlSession.update("projectMapper.updatePMember",pt);
	}

	public Pteam selectPTeam(int ptId) {
		return sqlSession.selectOne("projectMapper.selectPTeam", ptId);
	}

	public int updateTeam(Pteam pt) {
		// 기존 인원들 제거 
		int ptId = pt.getPtId();
		int result1=0;
		int result=1;
		System.out.println(ptId);
		if(!pt.getPtStatus().equals("N")) {
		  result = sqlSession.update("projectMapper.deleteTMember",ptId);
		}
		// 새로운 인원 update
		if(result >0) {
			result1 = sqlSession.update("projectMapper.updateTMember",pt);
		}			
	
		return result1;
	}

	public int deletePMember(Project p) {
		return sqlSession.update("projectMapper.deletePMember",p);
	}

	public int deleteTeam(int ptId) {
		return sqlSession.update("projectMapper.deleteTeam",ptId);
	}

	public int updateProgress(Project p) {
		return sqlSession.update("projectMapper.updateProgress",p);
	}

	public Pmember selectMemberTeam(Pmember p) {
		return sqlSession.selectOne("projectMapper.selectMemberTeam", p);
	}

	public int insertTask(Task t) {
		return sqlSession.insert("projectMapper.insertTask",t);
	}

	public ArrayList<Task> selectTaskList(Pmember p) {
		ArrayList<Task> t = (ArrayList)sqlSession.selectList("projectMapper.selectTaskList",p);
		for(int i =0; i< t.size(); i++) {
			int m = t.get(i).getTwWriter();
			Member m2 = sqlSession.selectOne("projectMapper.selectWriter",m);
			t.get(i).setWriter(m2.getmName());
			
		}
		for(int i =0; i< t.size(); i++) {
			int m = t.get(i).getTwManager();
			if(m>0) {
			Member manager = sqlSession.selectOne("projectMapper.selectWriter",m);
			t.get(i).setManager(manager.getmName());
			}
		}

	 	return t;
	}
	
	

}
