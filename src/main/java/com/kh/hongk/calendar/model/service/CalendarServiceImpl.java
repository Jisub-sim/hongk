package com.kh.hongk.calendar.model.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hongk.calendar.model.dao.CalendarDao;
import com.kh.hongk.calendar.model.vo.Calendar1;
import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.vo.Pmember;
import com.kh.hongk.project.model.vo.Project;

@Service("cService")
public class CalendarServiceImpl implements CalendarService{
	@Autowired
	private CalendarDao cDao;

	@Override
	public ArrayList<Calendar1> selectCalendarList(Calendar1 c) {
		return cDao.selectCalendarList(c);
	}
	
	@Override
	public ArrayList<Calendar1> selectOnedayList(Calendar1 c) {
		return cDao.selectOnedayList(c);
	}
	
	@Override
	public ArrayList<Calendar1> selectInsertCheck(Calendar1 c) {
		return cDao.selectInsertCheck(c);
	}

	@Override
	public int insertCalendar(Calendar1 c) {
		return cDao.insertCalendar(c);
	}

	@Override
	public ArrayList<Project> selectProjectTitleList() {
		return cDao.selectProjectTitleList();
	}
	
	@Override
	public Calendar1 selectOnedayUpView(int cId) {
		return cDao.selectOnedayUpView(cId);
	}

	@Override
	public int updateCalendar(int cId) {
		return cDao.updateCalendar(cId);
	}

	@Override
	public int delectCalendar(int cId) {
		return cDao.delectCalendar(cId);
	}

	@Override
	public ArrayList<Member> selectCalDMemberList(String deptCode) {
		return cDao.selectCalDMemberList(deptCode);
	}
	
	@Override
	public ArrayList<String> selectDeptTitle(String deptCode) {
		return cDao.selectDeptTitle(deptCode);
	}

	@Override
	public Pmember selectCalPid(int mNo) {
		return cDao.selectCalPid(mNo);
	}

	@Override
	public ArrayList<Member> selectCalTMemberList(int pId) {
		return cDao.selectCalTMemberList(pId);
	}

	@Override
	public ArrayList<String> selectTeamTitle(int pId) {
		return cDao.selectTeamTitle(pId);
	}

	

	


}
