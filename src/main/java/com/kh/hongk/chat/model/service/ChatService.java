package com.kh.hongk.chat.model.service;

import java.util.ArrayList;

import com.kh.hongk.board.model.vo.Board;
import com.kh.hongk.board.model.vo.Search;
import com.kh.hongk.chat.model.vo.Room;
import com.kh.hongk.member.model.vo.Member;



public interface ChatService {

	int insertChat(Room r);

	ArrayList<Room> selectChatList(Room r);

	
	

	

	

	

}
