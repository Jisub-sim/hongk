package com.kh.hongk.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hongk.attendance.model.vo.Attendance;
import com.kh.hongk.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Member selectMember(Member m) {
		return sqlSession.selectOne("memberMapper.selectOne", m);
	}

	public Attendance AttendancenceSelect(int mNo) {
		return sqlSession.selectOne("attendanceMapper.selectattendance",mNo);
	}

	public Member selectattmember(Member m) {
		return sqlSession.selectOne("memberMapper.selectattmember", m);
	}

}
