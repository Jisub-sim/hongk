package com.kh.hongk.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hongk.member.exception.MemberException;
import com.kh.hongk.member.model.service.MemberService;
import com.kh.hongk.member.model.vo.Member;

@SessionAttributes({"loginUser","msg"})
@Controller
public class MemberController {
	@Autowired
	private MemberService mService;
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 로그인 
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(Member m, Model model, HttpServletRequest request) {
		Member loginUser = mService.loginMember(m);
		ArrayList<Member> mList = mService.selectList();
		System.out.println(mList);
		
		if(loginUser != null) {
			logger.info(loginUser.getmId() + "로그인");
			model.addAttribute("loginUser", loginUser);
			request.getSession().setAttribute("mList", mList);
		}
		else{
			throw new MemberException("로그인에 실패하였습니다.");
		}
		
		return "redirect:home.do";
		
	}
	
	@RequestMapping(value="logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:index.jsp";
	}
	
	
	@RequestMapping("MemberList.do")
	public void getMemberList(HttpServletRequest request) {
				
		
		
		
//		if(mList != null && mList.isEmpty()) {
//			
//		}else {
//			throw new MemberException("앙 실패");
//		}
		
		
	}
	
}
