package com.kh.hongk.approval.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hongk.approval.model.vo.Electronic_Approval;
import com.kh.hongk.approval.model.vo.Form;

@Repository("eaDao") //DB와 접근하는 클래스에 부여하는 어노테이션
public class EADao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 양식 추가
	public int formInsert(Form f) {
		return sqlSession.insert("eaMapper.formInsert",f);
	}

	// 양식 리스트 (기안문 작성)
	public ArrayList<Form> selectFormList() {
		return (ArrayList)sqlSession.selectList("eaMapper.selectFormList");
	}

	// 양식 선택
	public Form selectForm(int fid) {
		return sqlSession.selectOne("eaMapper.selectForm",fid);
	}

	// 임시 저장
	public int temeaform(Electronic_Approval ea) {
		return sqlSession.insert("eaMapper.temeaform",ea);
	}
	
	//전자결재 등록
	public int insertea(Electronic_Approval ea) {
		return sqlSession.insert("eaMapper.insertea",ea);
	}
	// 임시 저장함 리스트
	public ArrayList<Electronic_Approval> selectListTem() {
		return (ArrayList)sqlSession.selectList("eaMapper.selectListTem");
	}

}
