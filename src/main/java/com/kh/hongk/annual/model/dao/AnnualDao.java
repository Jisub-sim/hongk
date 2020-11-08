package com.kh.hongk.annual.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hongk.annual.model.vo.Annual;
import com.kh.hongk.annual.model.vo.PageInfo;
import com.kh.hongk.approval.model.vo.Approval;
import com.kh.hongk.approval.model.vo.Electronic_Approval;
import com.kh.hongk.member.model.vo.Member;

@Repository("annDao")
public class AnnualDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertAnnual(Annual ann) {
		return sqlSession.insert("annualMapper.insertannual", ann);
	}
	
	public int halfTimeinsert(Annual ann) {
		return sqlSession.insert("annualMapper.halfTimeinsert", ann);
	}



	public ArrayList<Annual> selectList(int mNo,PageInfo pi ) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("annualMapper.selectList", mNo, rowBounds);
	}


	public Annual selectmyann(int mNo) {
		return sqlSession.selectOne("annualMapper.selectmyann", mNo);
	}


	public Member selectmember(int mNo) {
		return sqlSession.selectOne("annualMapper.selectmember",mNo);
	}


	public int selectListCount(int mNo) {
		return sqlSession.selectOne("annualMapper.selectListCount", mNo);
	}


	public Annual selectAnnual(int annual_no) {
		return sqlSession.selectOne("annualMapper.selectOne",annual_no);
	}


	public int updateAnnual(Annual ann) {
		return sqlSession.update("annualMapper.updateAnnual",ann);
	}


	public int deleteAnnual(int annual_no) {
		return sqlSession.update("annualMapper.deleteAnnual", annual_no);
	}


	public int selectListendCount(int mNo) {
		return sqlSession.selectOne("annualMapper.selectListendCount", mNo);
	}


	public ArrayList<Annual> selectendList(int mNo) {
		return (ArrayList)sqlSession.selectList("annualMapper.selectendList",mNo);
	}


	public int insertea(Electronic_Approval ea) {
		return sqlSession.insert("eaMapper.insertea", ea);
	}


	public int insertApprover(Approval appro) {
		return sqlSession.insert("eaMapper.insertApprover", appro);
	}


	





}
