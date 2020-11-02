package com.kh.hongk.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String memberLogin(Member m, Model model) {
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null) {
			logger.info(loginUser.getmId() + "로그인");
			model.addAttribute("loginUser", loginUser);
		}else {
			throw new MemberException("로그인에 실패하였습니다.");
		}
		return "redirect:home.do";
		
	}
	
	@RequestMapping(value="logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:home.do";
	}
	
	// 회원 가입 페이지 이동
	@RequestMapping(value="MemberJoin.do")
	public ModelAndView MemberJoin(ModelAndView mv) {
		
		ArrayList<Member> job = mService.jobList();
		ArrayList<Member> dept = mService.deptList();
		
		
		mv.addObject("job",job)
		.addObject("dept",dept)
		.setViewName("member/memberJoin");
		
		return mv;
	}
	
	@RequestMapping("dupid.do")
	@ResponseBody
	public String idDuplicateCheck(String id) {
		boolean isUsable = mService.checkIdDup(id) == 0 ? true : false;
		return isUsable + "";
	}
	
	// 회원 가입 
	@RequestMapping("minsert.do")
	public String memberInsert(Member m, RedirectAttributes rd,
						@RequestParam("post") String post,
						@RequestParam("address1") String address1,
						@RequestParam("address2") String address2) {
		m.setAddress(post + "," + address1 + "," + address2);
		System.out.println("회원가입 Controller m : " + m);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			
			rd.addFlashAttribute("msg", "회원가입이 완료 되었습니다. 로그인 해주세요.");
			return "redirect:home.do";
		} else {
			throw new MemberException("회원 가입에 실패하였습니다.");
		}
	}
	//  정보 수정  페이지로 이동
	@RequestMapping("myinfo.do")
	public String myInfoView() {
		return "member/memberUpdatePage";
	}
		
	// 회원 정보 수정 메소드
	@RequestMapping("mupdate.do")
	public String memberUpdate(Member m,
					   String post, String address1, String address2,
					 Model model, RedirectAttributes rd, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");	
		String mpwd = loginUser.getmPwd();
		
		m.setAddress(post + "," + address1 + "," + address2);
		
		if(m.getmPwd().equals("") ) {
			m.setmPwd(mpwd);
		}
			
		int result = mService.updateMember(m);
			
		if(result > 0) {
			// mypage.jsp에서 넘어온 수정정보인 Member m을 세션에 저장 된 loginUser 객체로 바꿈
			model.addAttribute("loginUser", m);
			rd.addFlashAttribute("msg", "회원정보가 수정 되었습니다.");
		}else {
			throw new MemberException("회원 정보 수정에 실패하였습니다.");
		}
			
		return "redirect:home.do";
	}
}
