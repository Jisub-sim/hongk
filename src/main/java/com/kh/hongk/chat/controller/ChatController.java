package com.kh.hongk.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.hongk.chat.exception.ChatException;
import com.kh.hongk.chat.model.service.ChatService;
import com.kh.hongk.chat.model.vo.Room;
import com.kh.hongk.member.model.service.MemberService;
import com.kh.hongk.member.model.vo.Member;

@Controller
public class ChatController {
	@Autowired
	private ChatService chService;
	

	
	@RequestMapping("addChat.do")
	@ResponseBody
	public String addChat(Room r, String mId, String chatContent,
			HttpServletRequest request,HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String fromId = loginUser.getmId();


		r.setFromId(fromId);
		r.setToId(mId);
		r.setChatContent(chatContent);
		System.out.println("asd" +r);
		
		
		
		System.out.println("addchatcontroller : " + r.getFromId());
		System.out.println("addchatcontroller : " + r.getToId());
		int result = chService.insertChat(r);
		if(result > 0) {
			return "success";
		}else {
			throw new ChatException("채팅보내기 실패!");
		}
	}
	
	@RequestMapping("chList.do")
	@ResponseBody
	public String getChatList(String mId, Room r, HttpSession session) {

		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String fromId = loginUser.getmId();


		r.setFromId(fromId);
		r.setToId(mId);
		
		
		ArrayList<Room> rList = chService.selectChatList(r);
		System.out.println("r : " + rList);
		Gson gson = new GsonBuilder().setDateFormat("aa HH:mm").create();
		return gson.toJson(rList);
	}
	
	
//	@RequestMapping(value="/chatting.do")
//	public ModelAndView chat(ModelAndView mv, String userName, 
//			HttpServletRequest request, HttpSession session) throws Exception{
//		
//		// request.setCharacterEncoding("UTF-8"); --> filter 설정
//		
//		// 세션에 사용할 대화명을 저장
////		session.setAttribute("userName", userName);
//		Member loginUser = (Member)session.getAttribute("loginUser");
//		System.out.println("controller : " + session.getAttribute("loginUser"));
//		
//		// 클라이언트 구분을 위한 ip 확인
//		String host = request.getRemoteAddr();
//		System.out.println("host 주소 :" + host);
//		mv.addObject("host",host);
//		
//		// 출력할 뷰 선택
//		mv.setViewName("chat/chattingView");
//		
//		return mv;			
//	}
	
	
	
//	@RequestMapping(value="/chatting.do", method = RequestMethod.GET)
//	public ModelAndView chat(ModelAndView mv) {
//		mv.setViewName("chat/chattingView");
//		
//		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		System.out.println("user name : " + user.getUsername());
//		
//		System.out.println("nomarl chat page");
//		
//		mv.addObject("userid", user.getUsername());
//		
//		return mv;
//	}
}
