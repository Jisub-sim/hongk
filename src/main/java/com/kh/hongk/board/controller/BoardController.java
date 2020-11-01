package com.kh.hongk.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.hongk.approval.model.vo.PageInfo;
import com.kh.hongk.board.model.exception.BoardException;
import com.kh.hongk.board.model.service.BoardService;
import com.kh.hongk.board.model.vo.Board;
import com.kh.hongk.board.model.vo.Pagination;
import com.kh.hongk.board.model.vo.Reply;
import com.kh.hongk.member.model.vo.Member;


@Controller
public class BoardController {
	@Autowired
	private BoardService boService;
	
	// 로깅 수업 시 작성
	// BoardController 용 logger 선언
	private Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping("blist.do")
	public ModelAndView boardList(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page
			) {
		// 커맨드 객체 사용 시 해당 파라미터가 존재하지 않을 경우 null 값을 반환함
		// 기본 자료형인 int는 null 값을 저장할 수 없어 오류 발생하므로 Integer로 정의함
		
		// 1. 전체 게시글 수 리턴 받기
		int listCount = boService.selectListCount();
		
		// 현재 페이지 계산
		int currentPage = page != null ? page : 1;
		
		// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10 , 5);
		
		// 2. 페이징 정보에 맞는 게시글 리스트 셀렉
		ArrayList<Board> list = boService.selectList(pi);
		
		//System.out.println("list : " + list);
		//System.out.println("pi : " + pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("board/boardListView");
		} else {
			throw new BoardException("게시글 목록 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("binsertView.do")
	public String boardInsertView() {
		return "board/boardInsertForm";
	}
	
	
	
	@RequestMapping("bdetail.do")
	public ModelAndView boardDetail(ModelAndView mv, 
								int bId, @RequestParam("page") Integer page,
								HttpServletRequest request,
								HttpServletResponse response) {
		
		int currentPage = page != null ? page : 1;
		
		
		// 쿠키 값을 이용하여 게시글 읽음 여부 확인 => 조회수 증가 여부 표현
		boolean flag = false;
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("bId"+bId)) {
					// 해당 게시글에 대한 쿠키 존재(이미 게시글을 읽었음)
					flag = true;
				}
			}
			if(!flag) {	// 게시글을 처음 읽은 경우 쿠키 저장하기
				Cookie c = new Cookie("bId"+bId, String.valueOf(bId));
				c.setMaxAge(1 * 24 * 60 * 60); // 하루 동안 저장
				response.addCookie(c);
			}
		}
		
		Board board = boService.selectBoard(bId, flag);
		
		if(board != null) {
			mv.addObject("board", board)
			  .addObject("currentPage", currentPage)
			  .setViewName("board/boardDetailView");
		} else {
			throw new BoardException("게시글 상세조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	
	// 1. 수정하기 버튼을 눌렀을 때 "bupView.do"
	// -> boardUpdateForm으로 페이지 이동
	// 조회수 증가 없이 board 1개 select해서 담아서 이동 + 현재페이지 값
	@RequestMapping("bupView.do")
	public ModelAndView boardUpdateView(ModelAndView mv, int bId,
										@RequestParam("page") Integer page) {
		Board board = boService.selectBoard(bId, true);
		
		mv.addObject("board", board)
		  .addObject("currentPage", page)
		  .setViewName("board/boardUpdateForm"); 
		
		return mv;
	}
	
	
	
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles"; 
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) 
			f.delete();
	}
	
	
	// ----- ajax 이후 추가 ------
	// 1. stream 이용해서 json array 보내기
	/*@RequestMapping("topList.do")
	public void boardTopList(HttpServletResponse response) throws IOException {
		ArrayList<Board> list = bService.selectTopList();
		System.out.println(list);
		
		// 조회수 top 리스트를 조회해 온 list를 JSONArray로 변경
		JSONArray jArr = new JSONArray();
		
		// 다만 createDate와 같은 Date 형식은 SimpleDateFormat을 이용해서 변경해서 넘기기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		for(Board b : list) {
			// 1개의 Board의 데이터를 JSONObject에 담는다
			JSONObject jObj = new JSONObject();
			jObj.put("bId", b.getbId());
			jObj.put("bTitle", b.getbTitle());
			jObj.put("bWriter", b.getbWriter());
			jObj.put("originalFileName", b.getOriginalFileName());
			jObj.put("bCount", b.getbCount());
			jObj.put("bCreateDate", sdf.format(b.getbCreateDate()));
			
			jArr.add(jObj);
		}
		
		// 응답 형식 작성
		response.setContentType("application/json; charset=utf-8");
		
		response.getWriter().print(jArr);
	}*/
	// 2. Gson 이용하는 방법
	// Gson 객체가 가진 toJson 메소드를 통해 컬렉션을 아주 쉽게 json 객체로 전송할 수 있음
	// 어떠한 세팅(날짜 포맷팅)이 필요한 경우 Gson이 아닌 GsonBuilder 객체를 통해 Gson을 생성함
	@RequestMapping("topList.do")
	@ResponseBody
	public String boardTopList() {
		ArrayList<Board> list = boService.selectTopList();
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return gson.toJson(list);
	}
	
	@RequestMapping("rList.do")
	@ResponseBody
	public String getReplyList(int bId) {
		ArrayList<Reply> rList = boService.selectReplyList(bId);
		// 2020-09-23
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		// 시분초 표시하고 싶다면 java.util.Date 사용할 것
		return gson.toJson(rList);
	}
	
	
	
}







