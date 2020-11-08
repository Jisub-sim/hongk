package com.kh.hongk.chat.model.service;

import java.util.ArrayList;

import com.kh.hongk.chat.model.vo.Room;



public interface ChatService {

	int insertChat(Room r);

	ArrayList<Room> selectChatList(Room r);

	

	

	

}
