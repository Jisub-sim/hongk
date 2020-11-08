package com.kh.hongk.work.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hongk.annual.model.vo.PageInfo;
import com.kh.hongk.approval.model.vo.Approval;
import com.kh.hongk.approval.model.vo.Electronic_Approval;
import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.work.model.dao.WorkDao;
import com.kh.hongk.work.model.vo.Work;

@Service("wkService")
public class WorkServiceImpl implements WorkService{
	@Autowired
	private WorkDao wkDao;

	// 근무신청하기
	@Override
	public int workinsert(Work wk) {
		return wkDao.insertWork(wk);
	}

	/*@Override
	public Work selectmywk(int mNo) {
		return wkDao.selectmywk(mNo);
	}*/

	@Override
	public Member selectmember(int mNo) {
		 return wkDao.selectmember(mNo);
	}


	@Override
	public ArrayList<Work> selectList(int mNo, PageInfo pi) {
		return wkDao.selectList(mNo, pi);
	}

	@Override
	public int selectListCount(int mNo) {
		return wkDao.selectListCount(mNo);
	}

	@Override
	public Work selectWork(int work_no) {
		return wkDao.selectWork(work_no);
	}

	@Override
	public int insertea(Electronic_Approval ea) {
		return wkDao.insertea(ea);
	}

	@Override
	public int insertApprover(Approval appro) {
		return wkDao.insertApprover(appro);
	}

	@Override
	public int updateWork(Work wk) {
		return wkDao.updateWork(wk);
	}

	@Override
	public int deleteWork(int work_no) {
		return wkDao.deleteWork(work_no);
	}
}
