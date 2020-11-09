package com.kh.hongk.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.hongk.board.model.vo.Board;
import com.kh.hongk.board.model.vo.Search;
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
		Gson gson = new GsonBuilder().setDateFormat("aa HH:mm").create();
		return gson.toJson(rList);
	}
	
	

}
