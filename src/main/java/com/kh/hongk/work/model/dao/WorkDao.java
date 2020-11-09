package com.kh.hongk.work.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hongk.annual.model.vo.PageInfo;
import com.kh.hongk.approval.model.vo.Approval;
import com.kh.hongk.approval.model.vo.Electronic_Approval;
import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.work.model.vo.Work;

@Repository("wkDao")
public class WorkDao {
	@Autowired
	private SqlSessionTemplate sqlSession;


	public int insertWork(Work wk) {
		return sqlSession.insert("workMapper.insertwork", wk);
		
	}


	/*public Work selectmywk(int mNo) {
		return sqlSession.selectOne("workMapper.selectmywk", mNo);
	}*/


	public Member selectmember(int mNo) {
		return sqlSession.selectOne("workMapper.selectmember",mNo);
	}



	public ArrayList<Work> selectList(int mNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("workMapper.selectList", mNo, rowBounds);
	}


	public int selectListCount(int mNo) {
		return sqlSession.selectOne("workMapper.selectListCount", mNo);
	}


	public Work selectWork(int work_no) {
		return sqlSession.selectOne("workMapper.selectWork",work_no);
	}


	public int insertea(Electronic_Approval ea) {
		return sqlSession.insert("eaMapper.insertea", ea);
	}


	public int insertApprover(Approval appro) {
		return sqlSession.insert("eaMapper.insertApprover",appro );
	}


	public int updateWork(Work wk) {
		return sqlSession.update("workMapper.updateWork", wk);
	}


	public int deleteWork(int work_no) {
		System.out.println("workNO : " + work_no);
		return sqlSession.update("workMapper.deleteWork", work_no);
	}

}
