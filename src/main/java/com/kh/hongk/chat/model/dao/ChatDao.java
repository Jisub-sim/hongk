package com.kh.hongk.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hongk.chat.model.vo.Room;



@Repository("chDao")
public class ChatDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertChat(Room r) {
		System.out.println("chDao : " + r);
		return sqlSession.insert("chatMapper.insertChat", r);
	}

	public ArrayList<Room> selectChatList(Room r) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatList", r);
	}

}
