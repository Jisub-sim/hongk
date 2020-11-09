package com.kh.hongk.chat.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hongk.board.model.dao.BoardDao;
import com.kh.hongk.board.model.vo.Search;
import com.kh.hongk.chat.model.dao.ChatDao;
import com.kh.hongk.chat.model.vo.Room;
import com.kh.hongk.member.model.vo.Member;


@Service("chService")
public class ChatServiceImpl implements ChatService {
	@Autowired
	private ChatDao chDao;

	@Override
	public int insertChat(Room r) {
		return chDao.insertChat(r);
	}

	@Override
	public ArrayList<Room> selectChatList(Room r) {
		return chDao.selectChatList(r);
	}

	
}
