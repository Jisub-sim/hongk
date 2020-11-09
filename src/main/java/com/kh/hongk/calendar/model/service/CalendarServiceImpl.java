package com.kh.hongk.calendar.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hongk.annual.model.vo.Annual;
import com.kh.hongk.calendar.model.dao.CalendarDao;
import com.kh.hongk.calendar.model.vo.Calendar1;
import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.vo.Pmember;
import com.kh.hongk.project.model.vo.Project;
import com.kh.hongk.project.model.vo.Pteam;

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
	public ArrayList<Annual> selectCalAnnualCheck(String cDate) {
		return cDao.selectCalAnnualCheck(cDate);
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
	public int updateCalendar(Calendar1 c) {
		return cDao.updateCalendar(c);
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
	public Pmember selectCalPid(int mNo) {
		return cDao.selectCalPid(mNo);
	}

	@Override
	public ArrayList<Member> selectCalTMemberList(int pId) {
		return cDao.selectCalTMemberList(pId);
	}

	@Override
	public ArrayList<Annual> selectCalAnnualList(int mNo) {
		return cDao.selectCalAnnualList(mNo);
	}

	@Override
	public String selectCalJTitle(int mNo) {
		return cDao.selectCalJTitle(mNo);
	}

	@Override
	public String selectCalDTitle(int mNo) {
		return cDao.selectCalDTitle(mNo);
	}
	
	@Override
	public int selectCalPtid(int mNo) {
		return cDao.selectCalPtid(mNo);
	}

	@Override
	public String selectCaltTitle(int ptid) {
		return cDao.selectCaltTitle(ptid);
	}

	
	


	

	


}
