package com.kh.hongk.attendance.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hongk.attendance.model.vo.Attendance;

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
	public ArrayList<Attendance> selectList(int mNo) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectList", mNo);
	}

	
	

	
	
}
