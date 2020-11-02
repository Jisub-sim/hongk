package com.kh.hongk.annual.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hongk.annual.model.dao.AnnualDao;
import com.kh.hongk.annual.model.vo.Annual;
import com.kh.hongk.annual.model.vo.PageInfo;
import com.kh.hongk.approval.model.vo.Approval;
import com.kh.hongk.approval.model.vo.Electronic_Approval;
import com.kh.hongk.member.model.vo.Member;

@Service("annService")
public class  AnnualServiceImpl implements AnnualService {
	@Autowired
	private AnnualDao annDao;

	// 휴가신청하기
	@Override
	public int Annualinsert(Annual ann) {
		return annDao.insertAnnual(ann);
	}

	// 휴가리스트 조회
	@Override
	public ArrayList<Annual> selectList(int mNo,  PageInfo pi) {
		return annDao.selectList(mNo, pi);
	}

	@Override
	public Annual selectmyann(int mNo) {
		return annDao.selectmyann(mNo);
	}

	@Override
	public Member selectmember(int mNo) {
		return annDao.selectmember(mNo);
	}

	@Override
	public int selectListCount(int mNo) {
		return annDao.selectListCount(mNo);
	}

	@Override
	public Annual selectAnnual(int annual_no) {
		return annDao.selectAnnual(annual_no);
	}

	@Override
	public int updateAnnual(Annual ann) {
		return annDao.updateAnnual(ann);
	}

	@Override
	public int deleteAnnual(int annual_no) {
		return annDao.deleteAnnual(annual_no);
	}

	@Override
	public int selectListendCount(int mNo) {
		return annDao.selectListendCount(mNo);
	}

	@Override
	public ArrayList<Annual> selectendList(int mNo, PageInfo pi) {
		return annDao.selectendList(mNo);
	}

	@Override
	public int insertea(Electronic_Approval ea) {
		return annDao.insertea(ea);
	}

	@Override
	public int insertApprover(Approval appro) {
		return annDao.insertApprover(appro);
	}




}
