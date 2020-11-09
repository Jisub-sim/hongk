package com.kh.hongk.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hongk.approval.model.vo.PageInfo;
import com.kh.hongk.board.model.dao.BoardDao;
import com.kh.hongk.board.model.vo.Board;
import com.kh.hongk.board.model.vo.BoardReply;
import com.kh.hongk.board.model.vo.Search;

@Service("bService")
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
		if(!flag) {
			bDao.addReadCount(bId);
		}
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
	public ArrayList<BoardReply> selectReplyList(int bId) {
		return bDao.selectReplyList(bId);
	}

	@Override
	public int insertReply(BoardReply r) {
		return bDao.insertReply(r);
	}

	@Override
	public ArrayList<Board> searchList(Search search) {
		return bDao.searchList(search);
	}

	}
	



