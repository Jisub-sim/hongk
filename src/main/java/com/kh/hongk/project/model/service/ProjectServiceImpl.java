package com.kh.hongk.project.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.dao.ProjectDao;
import com.kh.hongk.project.model.vo.Project;

@Service("bService")
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	private ProjectDao pDao;
	
	@Override
	public ArrayList<Member> selectMemberList() {		
		return pDao.selectMemberList();
	}

	@Override
	public ArrayList<Project> selectmyProject(int mNo) {
		return pDao.selectmyProject(mNo);
	}

}
