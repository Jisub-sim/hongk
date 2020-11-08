package com.kh.hongk.attendance.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hongk.annual.model.vo.PageInfo;
import com.kh.hongk.attendance.model.vo.Attendance;
import com.kh.hongk.attendance.model.vo.Search;

@Repository("attDao")
public class AttendanceDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int checkAttendance(int mno) {
		return sqlSession.selectOne("attendanceMapper.selectcheckattendance", mno);
	}
	public int insertAttendance(int mno) {
		return sqlSession.insert("attendanceMapper.insertattendance", mno);
	}

	public Attendance selectAttendance(int mNo) {
		return sqlSession.selectOne("attendanceMapper.selectattendance", mNo);
	}

	public int updateAttendance(int mNo) {
		return sqlSession.update("attendanceMapper.updateattendance", mNo);
	}

	public int insertAttendanceOver(int mNo) {
		return sqlSession.insert("attendanceMapper.insertattendanceover", mNo);
	}
	public int insertAttendanceList(Attendance att) {
		return sqlSession.insert("attendanceMapper.insertattendanceList", att);
	}
	
	public int selectListovertimeCount(int mNo) {
		return sqlSession.selectOne("attendanceMapper.selectOvertimeCount", mNo);
	}
	public int selectListworkCount(int mNo) {
		return sqlSession.selectOne("attendanceMapper.selectworkCount",mNo);
		
	}
	public int selectListCount(int mNo) {
		return sqlSession.selectOne("attendanceMapper.selectListCount",mNo);
	}
	public ArrayList<Attendance> selectList(int mNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectList", mNo, rowBounds);
	}
	public int selectallListCount(int mNo) {
		return sqlSession.selectOne("attendanceMapper.selectallListCount", mNo);
	}
	
	// 검색용 count
	public int shListCount(Search search, int mNo) {
		search.setMno(mNo);
		return sqlSession.selectOne("attendanceMapper.shListCount", search);
	}
	
	// 검색 후 셀렉
	public ArrayList<Attendance> attSearch(Search search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.attSearch", search, rowBounds);
	}
	
	// 미처리개수
	public int selectworkoffCount(int mNo) {
		return sqlSession.selectOne("attendanceMapper.selectworkoffCount", mNo);
	}

	
	

	
	
}
