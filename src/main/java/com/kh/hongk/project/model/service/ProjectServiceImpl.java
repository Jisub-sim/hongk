package com.kh.hongk.project.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.dao.ProjectDao;
import com.kh.hongk.project.model.vo.Pmember;
import com.kh.hongk.project.model.vo.Project;
import com.kh.hongk.project.model.vo.Pteam;
import com.kh.hongk.project.model.vo.Task;

@Service("bService")
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	private ProjectDao pDao;
	
	@Override
	public ArrayList<Member> selectProjectMember(int pId) {		
		return pDao.selectProjectMember(pId);
	}

	@Override
	public ArrayList<Project> selectmyProject(int mNo) {
		return pDao.selectmyProject(mNo);
	}

	@Override
	public Project projectDetail(int pId) {
		return pDao.projectDetail(pId);
	}

	@Override
	public ArrayList<Pteam> selectTeamlist(int pId) {
		return pDao.selectTeamList(pId);
	}

	@Override
	public ArrayList<Member> selectTmemberlist(int ptId) {
		return pDao.selectTmemberlist(ptId);
	}

	@Override
	public int insertPteam(Pteam pt) {
		return pDao.insertPteam(pt);
	}

	@Override
	public ArrayList<Member> selectMember() {
		return pDao.selectMember();
	}

	@Override
	public int insertPMember(Project p) {
		return pDao.insertPMember(p);
	}

	@Override
	public int updatePMember(Pteam pt) {
		return pDao.updatePMember(pt);
	}

	@Override
	public Pteam selectPTeam(int ptId) {
		return pDao.selectPTeam(ptId);
	}

	@Override
	public int teamUpdate(Pteam pt) {
		return pDao.updateTeam(pt);
	}

	@Override
	public int deletePMember(Project deleteP) {
		return pDao.deletePMember(deleteP);
	}

	@Override
	public int deleteTeam(int ptId) {
		return pDao.deleteTeam(ptId);
	}

	@Override
	public int updateProgress(Project p) {
		return pDao.updateProgress(p);
	}

	@Override
	public Pmember selectMemberTeam(Pmember p) {
		return pDao.selectMemberTeam(p);
	}

	@Override
	public int insertTask(Task t) {
		return pDao.insertTask(t);
	}

	@Override
	public ArrayList<Task> selectTaskList(Pmember p) {
		return pDao.selectTaskList(p);
	}

}
