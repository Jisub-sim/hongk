package com.kh.hongk.work.controller;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hongk.annual.model.vo.PageInfo;
import com.kh.hongk.annual.model.vo.Pagination;
import com.kh.hongk.approval.model.vo.Approval;
import com.kh.hongk.approval.model.vo.Electronic_Approval;
import com.kh.hongk.approval.model.vo.Form;
import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.work.model.exception.WorkException;
import com.kh.hongk.work.model.service.WorkService;
import com.kh.hongk.work.model.vo.Work;

import sun.util.calendar.LocalGregorianCalendar.Date;



@Controller
public class WorkController {
	@Autowired
	private WorkService wkService;
	
	// 근무 신청 페이지 이동
	@RequestMapping("wkinsertview.do")
	public ModelAndView workInsertPage(ModelAndView mv,HttpSession session, Form form) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mNo = loginUser.getmNo();
		
		Member member = wkService.selectmember(mNo);
		
		mv.addObject("member", member)
		  .addObject("form",form)
		  .setViewName("work/workInsertForm");
		
		return mv;
	}
	
	// 근무신청 클릭 시
	 @RequestMapping("workinsert.do")
	 public String WorkSelect(Work wk, Date start_time, Date end_time,
			 String wk_type,String mid, HttpSession session, Electronic_Approval ea, int form_no,
			 @DateTimeFormat(pattern="HH:mm") Date fromDate) {
		 int wktype= Integer.parseInt(wk_type);
		 Member loginUser = (Member)session.getAttribute("loginUser");
			int mNo = loginUser.getmNo();
			
			System.out.println("변경 전 wk : " + wk);
			
			GregorianCalendar workDate = new GregorianCalendar(); 
			workDate.setGregorianChange(wk.getWork_date());
			GregorianCalendar startTime = new GregorianCalendar(); 
			startTime.setGregorianChange(wk.getStart_time());
			GregorianCalendar endTime = new GregorianCalendar(); 
			endTime.setGregorianChange(wk.getEnd_time());
			
			startTime.set(workDate.get(Calendar.YEAR), workDate.get(Calendar.MONTH), workDate.get(Calendar.DATE));
			endTime.set(workDate.get(Calendar.YEAR), workDate.get(Calendar.MONTH), workDate.get(Calendar.DATE));
			
			wk.setStart_time(startTime.getTime());
			wk.setEnd_time(endTime.getTime());
			
			wk.setMno(mNo);
			wk.setWork_type(wktype);
			System.out.println("work : " + wk );
			System.out.println("멤버 아이디 : " + mid);
			
			// 전자결재
			ea.setDrafter(mNo);
			ea.setForm_no(form_no);
			ea.setEa_title(wk.getWork_title());
			ea.setEa_content(wk.getWork_content());
			
			int resultEA = wkService.insertea(ea);
			int appromn = Integer.parseInt(mid);
			Approval appro = new Approval(1,appromn);
			appro.setEa_no(ea.getEa_no());
			
			int result1 = wkService.insertApprover(appro);
			
		 int result = wkService.workinsert(wk);
		 //System.out.println("근무신청하기 : " + result);
		 
		 if(result > 0) {
			 return "redirect:wkList.do";
		 } else {
			 throw new WorkException("근무신청에 실패하였습니다.");
		 }
		 
	 }
	
	 
	 // 근무신청 리스트 내역보기
	 @RequestMapping("wkList.do")
	 public ModelAndView WorkList(ModelAndView mv,HttpSession session,  
		 @RequestParam(value="page", required=false) Integer page) {
	
	 	Member loginUser = (Member)session.getAttribute("loginUser");
		int mNo = loginUser.getmNo();
		
		int listCount = wkService.selectListCount(mNo);
		
		int currentPage = page != null ? page : 1;
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount , 10, 5);
		
		ArrayList<Work> list = wkService.selectList(mNo, pi);
		
		
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("work/workListView");
			System.out.println("list" + list);
		} else {
			throw new WorkException("근무신청 내역 조회에 실패하였습니다.");
		}
		return mv;
	 }
	 
	 // 승인완료 페이지 보여지기
	 @RequestMapping("wkdatail.do")
	 public ModelAndView workDatail(ModelAndView mv, HttpSession session, int work_no) {
		 Member loginUser = (Member)session.getAttribute("loginUser");
			int mNo = loginUser.getmNo();
			
			Work work = wkService.selectWork(work_no);
			mv.addObject("work", work )
			  .setViewName("work/workListDatail");
		 
			return mv;
	 }
	 
/*	 @RequestMapping("wkdatail.do")
	 public String AnnualListDatail(HttpSession session,  int work_no) {
		 Member loginUser = (Member)session.getAttribute("loginUser");
			int mNo = loginUser.getmNo();
			
			Work work = wkService.selectWork(work_no);
			
		 return "work/workListDatail";
		 
	 }*/
	 
	 
	 // 디테일 페이지에서 수정처리
	 @RequestMapping("wkupView.do")
	 public ModelAndView workUpdateView(ModelAndView mv, HttpSession session, int work_no,HttpServletRequest request) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mNo = loginUser.getmNo();
		
		
		Work work = wkService.selectWork(work_no);
		System.out.println("work가져오는가 : " + work);
		mv.addObject("work", work)
		  .setViewName("work/workUpdatePage");

		return mv;
		
	 }
	 
	 
	 // 근무신청서 수정하기
	 @RequestMapping("wkupdate.do")
	 public ModelAndView workUpdate(ModelAndView mv, Work wk, HttpSession session, 
			 HttpServletRequest request) {
	 
	 	Member loginUser = (Member)session.getAttribute("loginUser");
		int mNo = loginUser.getmNo();
		System.out.println("수정한 값 : " + wk);
		int result = wkService.updateWork(wk);
		
		if(result > 0) {
			mv.setViewName("redirect:wkList.do");
		}else {
			throw new WorkException("근무신청 수정에 실패하였습니다.");
		}
		
		return mv;
	 }
	 
	 
	 // 근무신청 삭제하기
	 @RequestMapping("wkdelete.do")
	 public String WorkDelete(HttpSession session, int work_no) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			int mNo = loginUser.getmNo();
			
			
			int result = wkService.deleteWork(work_no);
			System.out.println("근무번호 : " + work_no);
			
			if(result > 0) {
				return "redirect:wkList.do";
			}else {
				throw new WorkException("근무신청 삭제에 실패하였습니다.");
			}
	 }		
	 
}
