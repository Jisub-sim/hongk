package com.kh.hongk.project.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.dao.ProjectDao;
import com.kh.hongk.project.model.vo.Project;
import com.kh.hongk.project.model.vo.Pteam;

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

}
