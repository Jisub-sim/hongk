package com.kh.hongk.attendance.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hongk.annual.model.vo.PageInfo;
import com.kh.hongk.attendance.model.dao.AttendanceDao;
import com.kh.hongk.attendance.model.vo.Attendance;
import com.kh.hongk.attendance.model.vo.Search;

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
	public ArrayList<Attendance> selectList(int mNo, PageInfo pi) {
		return attDao.selectList(mNo, pi);
	}


	@Override
	public int selectallListCount(int mNo) {
		return attDao.selectallListCount(mNo);
	}

	// 검색 Count
	@Override
	public int shListCount(int mNo, Search search) {
		return attDao.shListCount(search, mNo);
	}
	
	// 검색 후 셀렉트
	@Override
	public ArrayList<Attendance> attSearch(PageInfo pi, Search search) {
		return attDao.attSearch(search, pi);
	}

	@Override
	public int selectworkoffCount(int mNo) {
		return attDao.selectworkoffCount(mNo);
	}



	
	

	


}
