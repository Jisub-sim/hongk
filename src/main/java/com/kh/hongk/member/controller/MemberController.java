package com.kh.hongk.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.hongk.attendance.model.service.AttendanceService;
import com.kh.hongk.attendance.model.vo.Attendance;
import com.kh.hongk.member.exception.MemberException;
import com.kh.hongk.member.model.service.MemberService;
import com.kh.hongk.member.model.vo.Member;

@SessionAttributes({"loginUser","msg"})
@Controller
public class MemberController {
	@Autowired
	private MemberService mService;
	private AttendanceService attService;
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 로그인 
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(Member m, Model model) {
		
		Member loginUser = null;
		
		Member attmember = mService.selectattmember(m);
		
		if(attmember != null) {
			
			loginUser=attmember;
			
			model.addAttribute("loginUser", loginUser);
			
		}else {
			 loginUser = mService.loginMember(m);
			 
			 if(loginUser != null) {
					logger.info(loginUser.getmId() + "로그인");
					
				/*	int mNo = loginUser.getmNo()*/;
					
					/*Attendance att = mService.AttendancenceSelect(mNo);
					System.out.println("출퇴근 기록 " + att);
					
//					if(att != null) {
						model.addAttribute("att", att);
//					}
		*/			model.addAttribute("loginUser", loginUser);
				}else {
					throw new MemberException("로그인에 실패하였습니다.");
				}
			
		}
		System.out.println("로그인유저 : " + loginUser);
		return "redirect:home.do";
		
	}
	
	@RequestMapping(value="logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:home.do";
	}
	
	/*// 출퇴근시간 세션에 넣기
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String loginAttendance(Member m, Model model, Attendance att) {
		
		Member loginUser = mService.loginMember(m);
		Member mNo = mService.attTime(loginUser.getmNo());
		Attendance attenacne = attService.selectAttendance(mNo, att);
		
		
		
		
	}*/
	
}
