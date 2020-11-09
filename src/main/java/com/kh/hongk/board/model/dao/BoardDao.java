package com.kh.hongk.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hongk.approval.model.vo.PageInfo;
import com.kh.hongk.board.model.vo.Board;
import com.kh.hongk.board.model.vo.BoardReply;
import com.kh.hongk.board.model.vo.Search;


@Repository("bDao")
public class BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectListCount() {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}

	public ArrayList<Board> selectList(PageInfo pi) {
		// 1 - offset : 몇 개의 게시글을 건너 뛸 것인지
		// 2 - boardLimit : 몇 개의 게시글을 select 할 것인지
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		System.out.println("boarddao : " + pi);
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);
	}
	

	public int insertBoard(Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	public void addReadCount(int bId) {
		sqlSession.update("boardMapper.updateCount", bId);
		
	}

	public Board selectBoard(int bId) {
		return sqlSession.selectOne("boardMapper.selectOne", bId);
	}

	public int updateBoard(Board b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	}

	public int deleteBoard(int bId) {
		return sqlSession.update("boardMapper.deleteBoard", bId);
	}
	
	
	public ArrayList<BoardReply> selectReplyList(int bId){
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", bId);
	}
	
	public int insertReply(BoardReply r) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}

	public ArrayList<Board> searchList(Search search) {
		return (ArrayList)sqlSession.selectList("boardMapper.searchList", search);
	}
}
