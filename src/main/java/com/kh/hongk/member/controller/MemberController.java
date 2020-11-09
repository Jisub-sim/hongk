package com.kh.hongk.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hongk.approval.model.vo.Electronic_Approval;
import com.kh.hongk.member.exception.MemberException;
import com.kh.hongk.member.model.service.MemberService;
import com.kh.hongk.member.model.vo.Files;
import com.kh.hongk.member.model.vo.Member;

@SessionAttributes({"loginUser","msg","file"})
@Controller
public class MemberController {
	@Autowired
	private MemberService mService;
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 로그인 
		@RequestMapping(value="login.do", method=RequestMethod.POST)
		public String memberLogin(Member m, Model model) {
			
			Member loginUser = null;
			
			Member attmember = mService.selectattmember(m);
			
			if(attmember != null) {
				
				loginUser=attmember;
				
				System.out.println("로그인유저 : " + loginUser);
				model.addAttribute("loginUser", loginUser);
				
			}else {
				 loginUser = mService.loginMember(m);
				 
				 if(loginUser != null) {
						logger.info(loginUser.getmId() + "로그인");
						
					/*	int mNo = loginUser.getmNo()*/;
						
						/*Attendance att = mService.AttendancenceSelect(mNo);
						System.out.println("출퇴근 기록 " + att);
						
//						if(att != null) {
							model.addAttribute("att", att);
//						}
 * 	
 */						
						System.out.println("로그인 유저 : " + loginUser);
						model.addAttribute("loginUser", loginUser);
					}else {
						throw new MemberException("로그인에 실패하였습니다.");
					}
				
			}
			
			int mno = loginUser.getmNo();
			
			ArrayList<Electronic_Approval> listWp = mService.listWp(mno);
			System.out.println("listWp : " + listWp);
			
			Files newProfile = mService.selectProFiles(mno);
			
			model.addAttribute("file", newProfile);
			model.addAttribute("listWp", listWp);
			
			System.out.println("로그인유저 : " + loginUser);
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
	public String memberUpdate(Member m,HttpServletRequest request,
					   String post, String address1, String address2,
					 Model model, RedirectAttributes rd, HttpSession session,
					 @RequestParam(value="uploadFile", required=false) MultipartFile file) {
		Member loginUser = (Member)session.getAttribute("loginUser");	
		String mpwd = loginUser.getmPwd();
		int mno = loginUser.getmNo();
		
		m.setAddress(post + "," + address1 + "," + address2);
		
		if(m.getmPwd().equals("") ) {
			m.setmPwd(mpwd);
		}
			
		// 프로필 사진 변경이 존재 한다면
		if(!file.getOriginalFilename().equals("")) {		
			String OriginalFilename = file.getOriginalFilename();
			System.out.println("넘어온 uploadFile : " + OriginalFilename);
			String renameFileName = saveFile(file, request);
			System.out.println("renameFileName : " + renameFileName);
					
			Files f = new Files();
			if(renameFileName != null) {
				f.setOriginal_FileName(OriginalFilename);
				f.setReName_FileName(renameFileName);
				f.setMno(mno);
						
				System.out.println("f : " + f);
			}
					
			// 등록된 프로필 파일이 있는가
			Files Profile = mService.selectProFiles(mno);
			System.out.println("등록된 프로필 파일이 있는가 : " + Profile);
			if(Profile != null ) {
				int file_no = Profile.getFile_no();
				// 있다면 기존 파일 삭제
				int resultDF = mService.FileDelete(file_no);
				if(resultDF > 0) {
					System.out.println("기존 프로필 파일 삭제 완료");
				}else {
					System.out.println("기존 프로필 파일 삭제 실패");
				}
			}
					
			// Files 에 등록
			int resultF = mService.Fileinsert(f);
			if(resultF>0 ) {
				Files newProfile = mService.selectProFiles(mno);
				model.addAttribute("file", newProfile);
			}
		}		
		
		int result = mService.updateMember(m);
		Member Nmember = mService.selectattmember(m);
			
		if(result > 0) {
			// mypage.jsp에서 넘어온 수정정보인 Member m을 세션에 저장 된 loginUser 객체로 바꿈
			model.addAttribute("loginUser", Nmember);
			rd.addFlashAttribute("msg", "회원정보가 수정 되었습니다.");
		}else {
			throw new MemberException("회원 정보 수정에 실패하였습니다.");
		}
			
		return "redirect:home.do";
	}
	
	// [SIG] 서명파일 저장을 위한 별도의 메소드
			public String saveFile(MultipartFile file, HttpServletRequest request) {
				// 파일이 저장 될 경로 설정
				String root = request.getSession().getServletContext().getRealPath("resources");
				
				String savePath = root + "\\ProfileFileUpload";
				
				File folder = new File(savePath);
				
				if(!folder.exists())	// 사진을 저장하고자 하는 경로가 존재하지 않는다면
					folder.mkdirs();	// 포함 된 경로를 모두 생성함
				
				// 파일 Rename -> 현재 시간 년월일시분초.확장자
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String originFileName = file.getOriginalFilename(); // -> 원래 이름으로부터 확장자 추출
				String renameFileName = sdf.format(new Date()) 
						+ originFileName.substring(originFileName.lastIndexOf("."));
				String renamePath = folder + "\\" + renameFileName;
				
				
				try {
					file.transferTo(new File(renamePath));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				return renameFileName;
			}
}
