package com.kh.hongk.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.hongk.member.model.dao.MemberDao;
import com.kh.hongk.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Override
	public Member loginMember(Member m) {
		System.out.println("ID : " + m.getmId());
		System.out.println("PWD : " + m.getmPwd());
		Member loginUser = mDao.selectMember(m);
		System.out.println("ID : " + loginUser.getmId());
		System.out.println("PWD : " + loginUser.getmPwd());
		if(loginUser != null && /*!bcryptPasswordEncoder.matches(m.getmPwd(), loginUser.getmPwd())&&*/
			 !m.getmPwd().equals(loginUser.getmPwd())) {
			loginUser = null;
		}
		return loginUser;
	}

	@Override
	public ArrayList<Member> selectList() {
		// TODO Auto-generated method stub
		return mDao.selectList();
	}

}
