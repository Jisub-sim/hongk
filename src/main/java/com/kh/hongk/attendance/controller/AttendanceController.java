package com.kh.hongk.attendance.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hongk.annual.model.vo.PageInfo;
import com.kh.hongk.annual.model.vo.Pagination;
import com.kh.hongk.attendance.exception.AttendanceException;
import com.kh.hongk.attendance.model.service.AttendanceService;
import com.kh.hongk.attendance.model.vo.Attendance;
import com.kh.hongk.attendance.model.vo.AttendanceCount;
import com.kh.hongk.attendance.model.vo.Search;
import com.kh.hongk.member.model.vo.Member;

@Controller
public class AttendanceController {
	@Autowired
	private AttendanceService attService;
	
	// 출근 기록
	@RequestMapping("attinsert.do")
	public String attendanceInsert(HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mNo = loginUser.getmNo();
		
		int result = 0;
		
		Date ot = null;
		Date nt = null;
		try {
			Date currentTime = new Date();
			SimpleDateFormat format = new SimpleDateFormat("HH:mm");
			SimpleDateFormat f = new SimpleDateFormat("HH:mm");
			ot = f.parse("09:00");
			System.out.println("초과시간 : " + ot );
			nt = f.parse(format.format(currentTime));
			System.out.println("현재시간 : " + nt );
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		Attendance att = attService.AttendancenceSelect(mNo);
		if(att != null) {
			result = 1;
		}else {
		// 지각이 아니라면
		if(ot.compareTo(nt) >= 0) {
			result = attService.Attendanceinsert(mNo);
		// 지각이라면
		} else if(ot.compareTo(nt) <= 0){
			result = attService.AttendanceOverinsert(mNo);
		}
	}
		if(result > 0) {
			System.out.println("출근하기 버튼 클릭 : " + result);
			
			/*return "redirect:home.do";*/
			return "redirect:attselect.do";
			
		} else {
			throw new AttendanceException("근태 등록에 실패하였습니다.");
		}
		
//		SimpleDateFormat format = new SimpleDateFormat("HH:mm");
//		Calendar time = Calendar.getInstance();
//		String format_time1 = format.format(time.getTime());
//		System.out.println("현재시간 : " + format_time1);
//		ot = format.parse("09:00");

	}
	
	// 출퇴근시간 조회
	@RequestMapping("attselect.do")
	public String attendanceSelect(ModelAndView mv,
										HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mNo = loginUser.getmNo();
		
		
		Attendance attendance = attService.AttendancenceSelect(mNo);
		System.out.println("출근시간 : " +  attendance);
		
		loginUser.setWork_on(attendance.getWork_on());
		
		
		/*mv.addObject("att", attendance)
		  .setViewName("home");*/
//		System.out.println("select : " );
		
		return "redirect:home.do";
	}
	
	
	@RequestMapping("attupdate.do")
	public String attendanceUpdate(ModelAndView mv, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mNo = loginUser.getmNo();
		
		int result = attService.AttendanceUpdate(mNo);
		
		
		if(result > 0) {
			System.out.println("퇴근하기 버튼: " + result);		
			Attendance attendance = attService.AttendancenceSelect(mNo);
			
			loginUser.setWork_off(attendance.getWork_off());
			
			return "redirect:attselect.do";
			
		} else {
			throw new AttendanceException("근태 등록에 실패하였습니다.");
		}
		
		
	}
	

	/*@RequestMapping("attendance.do")
	public String attendanceList() {
//		System.out.println("근태페이지 : ");
		return "attendance/AttendancePage";
		}*/
		
	
	
	@RequestMapping("attlist.do")
	public ModelAndView AttendanceList(ModelAndView mv,  HttpSession session, 
			@RequestParam(value="page", required=false) Integer page) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mNo = loginUser.getmNo();
		
		// 페이징 처리를 위해 개시글 개수 구해오기
		int allListCount = attService.selectallListCount(mNo);
		int currentPage = page != null ? page : 1;
		PageInfo pi = Pagination.getPageInfo(currentPage, allListCount , 10, 5);
		
		ArrayList<Attendance> list = attService.selectList(mNo, pi);
		// 지각개수 조회
		int overtimeCount = attService.selectListovertimeCount(mNo);
		
		// 정상근로 개수 조회
		int workCount = attService.selectListworkCount(mNo);
		// 지각 포함 전체 개수 조회
		int listCount = attService.selectListCount(mNo);
		
		// 미처리개수 조회
		int workoffCount = attService.selectworkoffCount(mNo);
		
		AttendanceCount ac = new AttendanceCount();
		ac.setListCount(listCount);
		ac.setOvertimeCount(overtimeCount);
		ac.setWorkCount(workCount);
		
		if(list != null) {
		mv.addObject("ac", ac );
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.addObject("wkoff", workoffCount);
		mv.setViewName("attendance/AttendancePage");
		System.out.println("지각 수 : " + overtimeCount);
		System.out.println("정상출근 수  : " + workCount);
		System.out.println("총 출근 수   : " + listCount);
		System.out.println("근태 리스트 : " + list);
		System.out.println("미처리 개수 : " + workoffCount);
		} else {
			throw new AttendanceException("근태 내역 조회에 실패하였습니다.");
		}
		
		return mv;
		
	}
		

		// 날짜,근무타입 검색기능
		@RequestMapping("wksearch.do")
		public String workSearch(Search search, Model model,HttpSession session,
				@RequestParam(value="page",required = false)Integer page 	
				//@DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate //
				){
			
			Member loginUser = (Member)session.getAttribute("loginUser");
			int mNo = loginUser.getmNo();
			
			search.setMno(mNo);
			
			System.out.println("검색어 : " + search);
			System.out.println("현재 페이지 : " + page);
			
			
			int searchCondition = (search.getSearchCondition());
			System.out.println("searchCondition : " + searchCondition);
			
			
			// 페이징
			int shListCount = attService.shListCount(mNo, search);
			System.out.println(shListCount);
			
			int currentPage = page != null ? page : 1;
			PageInfo pi = Pagination.getPageInfo(currentPage, shListCount , 10, 5);
			
			
			ArrayList<Attendance> searchList = attService.attSearch(pi, search);
			
			
			//search.setSearchCondition(searchCondition);
			System.out.println("검색한 결과 : " + searchList );
			
			model.addAttribute("list", searchList);
			model.addAttribute("pi",pi);
			model.addAttribute("search",search);
			
			return "attendance/AttendancePage";
			
			
			
			
		}
		
		
		
		
}	
		
		
		
		
		
		
		
		
		
		
		

		
		
		
