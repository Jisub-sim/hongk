package com.kh.hongk.attendance.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hongk.attendance.model.dao.AttendanceDao;
import com.kh.hongk.attendance.model.vo.Attendance;

@Service("attService")
public class AttendanceServiceImpl implements AttendanceService{
	@Autowired
	private AttendanceDao attDao;

	@Override
	public int Attendanceinsert(int mno) {
		int result = 0;
		// 1. 오늘 입력 된 출근 시간이 있는지 확인
		int cnt = attDao.checkAttendance(mno);
		result += cnt;
		// 2. 오늘 입력 된 출근 시간이 없다면 출근 행 insert
		if(cnt == 0) {
			result += attDao.insertAttendance(mno);
		}
		return result;
	}
	
	@Override
	public int AttendanceUpdate(int mNo) {
		int result = 1;
		// 1. 오늘 입력 된 출근 시간이 있는지 확인
		int cnt = attDao.checkAttendance(mNo);
		result += cnt;
		// 2. 오늘 입력 된 출근 시간이 있다면 퇴근 행 update
		if(cnt == 1) {
			result += attDao.updateAttendance(mNo);
		}
		return result;
		
		
	}

	@Override
	public Attendance AttendancenceSelect(int mNo) {
		return attDao.selectAttendance(mNo);
	}

	


	@Override
	public int AttendanceOverinsert(int mNo) {
		return attDao.insertAttendanceOver(mNo);
	}

	@Override
	public int AttendanceListinsert(Attendance att) {
		return attDao.insertAttendanceList(att);
	}

	@Override
	public int selectListovertimeCount(int mNo) {
		return attDao.selectListovertimeCount(mNo);
	}

	@Override
	public int selectListworkCount(int mNo) {
		return attDao.selectListworkCount(mNo);
	}

	@Override
	public int selectListCount(int mNo) {
		return attDao.selectListCount(mNo);
	}

	@Override
	public ArrayList<Attendance> selectList(int mNo) {
		return attDao.selectList(mNo);
	}


	


}
