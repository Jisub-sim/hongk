package com.kh.hongk.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hongk.annual.model.vo.Annual;
import com.kh.hongk.calendar.model.vo.Calendar1;
import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.vo.Pmember;
import com.kh.hongk.project.model.vo.Project;
import com.kh.hongk.project.model.vo.Pteam;

@Repository("cDao")
public class CalendarDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Calendar1> selectCalendarList(Calendar1 c) {
		return (ArrayList)sqlSession.selectList("calendarMapper.selectCalendarList", c);
	}
	
	public ArrayList<Calendar1> selectOnedayList(Calendar1 c) {
		return (ArrayList)sqlSession.selectList("calendarMapper.selectOnedayList", c);
	}
	
	public ArrayList<Calendar1> selectInsertCheck(Calendar1 c) {
		return (ArrayList)sqlSession.selectList("calendarMapper.selectInsertCheck", c);
	}
	
	public ArrayList<Annual> selectCalAnnualCheck(String cDate) {
		return (ArrayList)sqlSession.selectList("calendarMapper.selectCalAnnualCheck", cDate);
	}

	public int insertCalendar(Calendar1 c) {
		return sqlSession.insert("calendarMapper.insertCalendar", c);		
	}

	public ArrayList<Project> selectProjectTitleList() {
		return (ArrayList)sqlSession.selectList("calendarMapper.selectProjectTitleList");
	}
	
	public Calendar1 selectOnedayUpView(int cId) {
		return sqlSession.selectOne("calendarMapper.selectOnedayUpView", cId);
	}

	public int updateCalendar(Calendar1 c) {
		return sqlSession.update("calendarMapper.updateCalendar", c);
	}

	public int delectCalendar(int cId) {
		return sqlSession.delete("calendarMapper.delectCalendar", cId);
	}

	public ArrayList<Member> selectCalDMemberList(String deptCode) {
		return (ArrayList)sqlSession.selectList("calendarMapper.selectCalDMemberList", deptCode);
	}

	public Pmember selectCalPid(int mNo) {
		return sqlSession.selectOne("calendarMapper.selectCalPid", mNo);
	}

	public ArrayList<Member> selectCalTMemberList(int pId) {
		return (ArrayList)sqlSession.selectList("calendarMapper.selectCalTMemberList", pId);
	}

	public ArrayList<Annual> selectCalAnnualList(int mNo) {
		return (ArrayList)sqlSession.selectList("calendarMapper.selectCalAnnualList", mNo);
	}

	


	

	

}
