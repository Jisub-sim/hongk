package com.kh.hongk.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hongk.approval.model.vo.PageInfo;
import com.kh.hongk.board.model.dao.BoardDao;
import com.kh.hongk.board.model.vo.Board;
import com.kh.hongk.board.model.vo.Reply;


@Service("boService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao bDao;
	
	@Override
	public int selectListCount() {
		return bDao.selectListCount();
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return bDao.selectList(pi);
	}

	@Override
	public int insertBoard(Board b) {
		return bDao.insertBoard(b);
	}

	@Override
	public Board selectBoard(int bId, boolean flag) {
		// 1. 조회수 증가 처리
		if(!flag) {
			bDao.addReadCount(bId);
		}
		
		// insert 에러 발생 유도 -> 값이 비어있는 Board 객체를 insert 하면 SQLException이 발생할 예정
		// 별도의 트랙잭션 처리가 없어 중간에 에러가 발생하더라도 조회수 증가는 이루어짐
		// bDao.insertBoard(new Board());
		
		// 2. 게시글 조회
		return bDao.selectBoard(bId);
	}

	@Override
	public int updateBoard(Board b) {
		return bDao.updateBoard(b);
	}

	@Override
	public int deleteBoard(int bId) {
		return bDao.deleteBoard(bId);
	}

	@Override
	public ArrayList<Board> selectTopList() {
		return bDao.selectTopList();
	}

	@Override
	public ArrayList<Reply> selectReplyList(int bId) {
		return bDao.selectReplyList(bId);
	}

	@Override
	public int insertReply(Reply r) {
		return bDao.insertReply(r);
	}
	

}
