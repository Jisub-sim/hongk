package com.kh.hongk.approval.model.service;

import java.util.ArrayList;

import com.kh.hongk.approval.model.vo.Electronic_Approval;
import com.kh.hongk.approval.model.vo.Form;

public interface EAService {
	
	// 양식 추가
	int formInsert(Form f);
	
	// 양식 리스트 (기안 작성)
	ArrayList<Form> selectFormList();

	// 양식 조회(디테일)
	Form selectForm(int fid);
	
	// 임시 저장 
	int temeaform(Electronic_Approval ea);

	// 결재 등록
	int insertea(Electronic_Approval ea);

	// 임시 저장함 리스트
	ArrayList<Electronic_Approval> selectListTem();
	
	

	
	
}
