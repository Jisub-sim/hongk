package com.kh.hongk.approval.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hongk.approval.model.dao.EADao;
import com.kh.hongk.approval.model.vo.Electronic_Approval;
import com.kh.hongk.approval.model.vo.Form;

@Service("EAService")
public class EAServiceImpl implements EAService {
	@Autowired
	private EADao eaDao;
	
	// 양식 추가
	@Override
	public int formInsert(Form f) {
		return eaDao.formInsert(f);
	}
	// 양식 리스트 (기안문 작성)
	@Override
	public ArrayList<Form> selectFormList() {
		return eaDao.selectFormList();
	}
	// 양식 선택(디테일)
	@Override
	public Form selectForm(int fid) {
		return eaDao.selectForm(fid);
	}
	// 임시저장
	@Override
	public int temeaform(Electronic_Approval ea) {
		return eaDao.temeaform(ea);
	}
	// 전자결재 등록
	@Override
	public int insertea(Electronic_Approval ea) {
		return eaDao.insertea(ea);
	}
	// 임시 저장함 리스트
	@Override
	public ArrayList<Electronic_Approval> selectListTem() {
		return eaDao.selectListTem();
	}

}
