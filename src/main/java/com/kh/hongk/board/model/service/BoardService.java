package com.kh.hongk.board.model.service;

import java.util.ArrayList;

import com.kh.hongk.approval.model.vo.PageInfo;
import com.kh.hongk.board.model.vo.Board;
import com.kh.hongk.board.model.vo.Reply;



public interface BoardService {
	// 1. 게시글 갯수 구하는 메소드 -> 페이징 계산을 위해
	public int selectListCount();
	
	// 2. 게시글 조회(페이징 처리 된)
	public ArrayList<Board> selectList(PageInfo pi);
	
	// 3. 게시글 작성
	public int insertBoard(Board b);
	
	// 4. 게시글 상세보기(flag -> 조회수 증가 실행 여부)
	public Board selectBoard(int bId, boolean flag);
	
	// 5. 게시글 수정
	public int updateBoard(Board b);
	
	// 6. 게시글 삭제
	public int deleteBoard(int bId);

	// 7. 조회수 top 5 게시글 조회
	public ArrayList<Board> selectTopList();
	
	// 8. 댓글 리스트 조회
	public ArrayList<Reply> selectReplyList(int bId);
	
	// 9. 댓글 등록 
	public int insertReply(Reply r);
	
}
