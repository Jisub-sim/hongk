package com.kh.hongk.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.hongk.approval.model.vo.PageInfo;
import com.kh.hongk.board.exception.BoardException;
import com.kh.hongk.board.model.service.BoardService;
import com.kh.hongk.board.model.vo.Board;
import com.kh.hongk.board.model.vo.Pagination;
import com.kh.hongk.board.model.vo.Photo;
import com.kh.hongk.board.model.vo.Replyboard;
import com.kh.hongk.board.model.vo.Search;
import com.kh.hongk.member.model.vo.Member;

@Controller
public class BoardController {
	@Autowired
	private BoardService bService;

	@RequestMapping("blist.do")

	public ModelAndView boardList(ModelAndView mv, int pageurlnum, HttpSession session,
			@RequestParam(value="page", required=false) Integer page
			) {
		// 커맨드 객체 사용 시 해당 파라미터가 존재하지 않을 경우 null 값을 반환함
		// 기본 자료형인 int는 null 값을 저장할 수 없어 오류 발생하므로 Integer로 정의함
		
		int pageurlnum1 = pageurlnum;
		if(pageurlnum1 != 0) {
			session.setAttribute("pageurlnum1", pageurlnum1);
		}
		

		// 1. 전체 게시글 수 리턴 받기
		int listCount = bService.selectListCount();

		// 현재 페이지 계산
		int currentPage = page != null ? page : 1;

		// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 10);

		// 2. 페이징 정보에 맞는 게시글 리스트 셀렉
		ArrayList<Board> list = bService.selectList(pi);

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("board/boardnoticeListview");
//			보드 인서트 
//			mv.setViewName("board/boardinsert");
		} else {
			throw new BoardException("게시글 목록 조회 실패!");

		}
		return mv;
	}

	@RequestMapping("binserView.do")
	public String boardInsertView() {
		return "board/boardinsert";
	}

	@RequestMapping("binsert.do")
	public String boardInsert(Board b, HttpServletRequest request) {


		int result = bService.insertBoard(b);

		if (result > 0) {
			return "redirect:blist.do";
		} else {
			throw new BoardException("게시글 등록에 실패하였습니다.");
		}
	}

	@RequestMapping("bdetail.do")
	public ModelAndView boardDetail(ModelAndView mv, int bId, @RequestParam("page") Integer page,
			HttpServletRequest request, HttpServletResponse response) {

		int currentPage = page != null ? page : 1;

		// 쿠키 값을 이용하여 게시글 읽음 여부 확인 => 조회수 증가 여부 표현
		boolean flag = false;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("bId" + bId)) {
					// 해당 게시글에 대한 쿠키 존재(이미 게시글을 읽었음)
					flag = true;
				}
			}
			if (!flag) { // 게시글을 처음 읽은 경우 쿠키 저장하기
				Cookie c = new Cookie("bId" + bId, String.valueOf(bId));
				c.setMaxAge(1 * 24 * 60 * 60); // 하루 동안 저장
				response.addCookie(c);
			}
		}

		Board board = bService.selectBoard(bId, flag);

		if (board != null) {
			mv.addObject("board", board).addObject("currentPage", currentPage).setViewName("board/boardDetailView");
		} else {
			throw new BoardException("게시글 상세조회에 실패하였습니다.");
		}

		return mv;
	}

	@RequestMapping("update.do")
	public ModelAndView boardUpdateView(ModelAndView mv, int bId, @RequestParam("page") Integer page) {
		Board board = bService.selectBoard(bId, true);
		
		

		mv.addObject("board", board)
		.addObject("currentPage", page)
		.setViewName("board/update");

		return mv;
	}
	
	@RequestMapping("bupdate.do")
	public ModelAndView boardUpdate(ModelAndView mv, Board b,
									HttpServletRequest request, 
									@RequestParam("page") Integer page) {
	
		
		int result = bService.updateBoard(b); 
		
		if(result > 0) {
			mv.addObject("page", page)
			   .setViewName("redirect:blist.do");
		}else {
			throw new BoardException("게시글 수정에 실패하였습니다.");
		}
		
		return mv;
		
	}
	
	@RequestMapping("bdelete.do")
	public String boardDelete(int bId, HttpServletRequest request) {
		Board b = bService.selectBoard(bId, false);
		
		
		int result = bService.deleteBoard(bId);
		
		if(result > 0) {
			return "redirect:blist.do";
		}else {
			throw new BoardException("게시물 삭제에 실패하였습니다");
		}
	}
	

	
	@RequestMapping("rList.do")
	@ResponseBody
	public String getReplyList(int bId) {
		ArrayList<Replyboard> rList = bService.selectReplyList(bId);
		// 2020-09-23
		Gson gson = new GsonBuilder().setDateFormat("yyyy.MM.dd HH:mm").create(); 
		// 시분초 표시하고 싶다면 java.util.Date 사용할 것
		return gson.toJson(rList);
	}
	
	
	@RequestMapping("addReplyboard.do")
	@ResponseBody
	public String addReply(Replyboard r, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String rWriter = loginUser.getmName();
		
		r.setrWriter(rWriter);
		
		int result = bService.insertReply(r);
		
		if(result > 0) {
			return "success";
		}else {
			throw new BoardException("댓글 등록 실패!!");
		}
	}
	
	@RequestMapping("nsearch.do")
	public String boardSearch(Search search, Model model) {
	
		
		ArrayList<Board> searchList = bService.searchList(search);
		
		model.addAttribute("list", searchList);
		model.addAttribute("search", search);
		
		return "board/boardnoticeListview";
	}
	
	//단일파일업로드
	@RequestMapping(value="/photoUpload.do")
	public String photoUpload(HttpServletRequest request, Photo vo){
	    String callback = vo.getCallback();
	    String callback_func = vo.getCallback_func();
	    String file_result = "";
	    try {
	        if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && !vo.getFiledata().getOriginalFilename().equals("")){
	            //파일이 존재하면
	            String original_name = vo.getFiledata().getOriginalFilename();
	            String ext = original_name.substring(original_name.lastIndexOf(".")+1);
	            //파일 기본경로
	            String defaultPath = request.getSession().getServletContext().getRealPath("/");
//	            String root = request.getSession().getServletContext().getRealPath("resources");
	            //파일 기본경로 _ 상세경로
	            String path = defaultPath + "resource" + File.separator + "photo_upload" + File.separator;             
	            File file = new File(path);
	            System.out.println("path:"+path);
	            //디렉토리 존재하지 않을경우 디렉토리 생성
	            if(!file.exists()) {
	                file.mkdirs();
	            }
	            //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
	            String realname = UUID.randomUUID().toString() + "." + ext;
	        ///////////////// 서버에 파일쓰기 /////////////////
	            vo.getFiledata().transferTo(new File(path+realname));
	            file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/resource/photo_upload/"+realname;
	        } else {
	            file_result += "&errstr=error";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "redirect:" + callback + "?callback_func="+callback_func+file_result;

	}
	//다중파일업로드
	@RequestMapping("multiplePhotoUpload.do")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
	    try {
	         //파일정보
	         String sFileInfo = "";
	         //파일명을 받는다 - 일반 원본파일명
	         String filename = request.getHeader("file-name");
	         //파일 확장자
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //확장자를소문자로 변경
	         filename_ext = filename_ext.toLowerCase();
	         //파일 기본경로
//	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         String root = request.getSession().getServletContext().getRealPath("resources");
	         System.out.println("asdasd22 : " + root);
	         //파일 기본경로 _ 상세경로
	         String filePath = root + File.separator + "photo_upload" + File.separator;
	         System.out.println("asd : " + filePath);
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;
	         ///////////////// 서버에 파일쓰기 /////////////////
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }
	         if(is != null) {
	            is.close();
	         }
	         os.flush();
	         os.close();
	         ///////////////// 서버에 파일쓰기 /////////////////
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";
	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	         sFileInfo += "&sFileName="+ filename;;
	         sFileInfo += "&sFileURL="+"/hongk/resources/photo_upload/"+realFileNm;
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

					
}



