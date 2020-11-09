package com.kh.hongk.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hongk.calendar.model.vo.Calendar1;
import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.vo.Pmember;
import com.kh.hongk.project.model.vo.Project;

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

	public int insertCalendar(Calendar1 c) {
		return sqlSession.insert("calendarMapper.insertCalendar", c);		
	}

	public ArrayList<Project> selectProjectTitleList() {
		return (ArrayList)sqlSession.selectList("calendarMapper.selectProjectTitleList");
	}
	
	public Calendar1 selectOnedayUpView(int cId) {
		return sqlSession.selectOne("calendarMapper.selectOnedayUpView", cId);
	}

	public int updateCalendar(int cId) {
		return sqlSession.update("calendarMapper.updateCalendar", cId);
	}

	public int delectCalendar(int cId) {
		return sqlSession.delete("calendarMapper.delectCalendar", cId);
	}

	public ArrayList<Member> selectCalDMemberList(String deptCode) {
		return (ArrayList)sqlSession.selectList("calendarMapper.selectCalDMemberList", deptCode);
	}

	/*public ArrayList<String> selectDeptTitle(String deptCode) {
		return sqlSession.selectOne("calendarMapper.selectDeptTitle", deptCode);
	}*/
	
	public Pmember selectCalPid(int mNo) {
		return sqlSession.selectOne("calendarMapper.selectCalPid", mNo);
	}

	public ArrayList<Member> selectCalTMemberList(int pId) {
		return (ArrayList)sqlSession.selectList("calendarMapper.selectCalTMemberList", pId);
	}

	/*public ArrayList<String> selectTeamTitle(int pId) {
		return sqlSession.selectOne("calendarMapper.selectTeamTitle", pId);
	}*/

	

	

}
