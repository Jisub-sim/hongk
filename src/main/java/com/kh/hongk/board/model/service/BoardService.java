package com.kh.hongk.board.model.service;

import java.util.ArrayList;

import com.kh.hongk.approval.model.vo.PageInfo;
import com.kh.hongk.board.model.vo.Board;
import com.kh.hongk.board.model.vo.BoardReply;
import com.kh.hongk.board.model.vo.Search;


public interface BoardService {
	
		// 1. 게시글 갯수 구하는 메소드 -> 페이징 계산을 위해
		public int selectListCount();
		
		// 2. 게시글 조회(페이징 처리 된)
		public ArrayList<Board> selectList(PageInfo pi);
		
		public int insertBoard(Board b);

		public Board selectBoard(int bId, boolean flag);
		
		public int updateBoard(Board b);
		
		public int deleteBoard(int bId);

		// 8. 댓글 리스트 조회
		public ArrayList<BoardReply> selectReplyList(int bId);
		
		// 9. 댓글 등록 
		public int insertReply(BoardReply r);

		public ArrayList<Board> searchList(Search search);
}