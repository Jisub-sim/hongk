package com.kh.hongk.annual.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hongk.annual.model.exception.AnnualException;
import com.kh.hongk.annual.model.service.AnnualService;
import com.kh.hongk.annual.model.vo.Annual;
import com.kh.hongk.annual.model.vo.PageInfo;
import com.kh.hongk.annual.model.vo.Pagination;
import com.kh.hongk.approval.model.vo.Approval;
import com.kh.hongk.approval.model.vo.Electronic_Approval;
import com.kh.hongk.approval.model.vo.Form;
import com.kh.hongk.member.model.vo.Member;

@Controller
public class AnnualController {
	@Autowired
	private AnnualService annService;

	// 휴가신청페이지 이동
	@RequestMapping("anninsert.do")
	public ModelAndView annualInsertPage(ModelAndView mv, HttpSession session, Form form) {

		Member loginUser = (Member)session.getAttribute("loginUser");
		int mNo = loginUser.getmNo();

		Annual ann = annService.selectmyann(mNo);
		Member member = annService.selectmember(mNo);
		 

		mv.addObject("ann", ann)
		  .addObject("member", member)
		  .addObject("form",form)
		  .setViewName("annual/annualInsertForm");


		return mv;
	}
	
	

	// 휴가신청 클릭 시 
	@RequestMapping("annTypeSelect.do")
	public String AnnualTypeSelect(Annual ann, String a_type,String mid, Electronic_Approval ea, HttpSession session, int form_no) {
		int atype=Integer.parseInt(a_type);
		ann.setAnnual_type(atype);
		System.out.println("annual :" + ann );
		System.out.println("멤버 아이디 : "+mid);

		Member loginUser = (Member)session.getAttribute("loginUser");
		int mNo = loginUser.getmNo();
		ann.setMno(mNo);
		
		
		// 전자결재
		ea.setDrafter(mNo);
		ea.setForm_no(form_no);
		ea.setEa_title(ann.getAnnual_title());
		ea.setEa_content(ann.getAnnual_content());

		int resultEA = annService.insertea(ea);
		int appromn= Integer.parseInt(mid);
		Approval appro = new Approval(1,appromn);
		appro.setEa_no(ea.getEa_no());
		int result1 = annService.insertApprover(appro);
		
		int result = 0;
		// 휴가타입 반차4일때
		if(atype == 4) {
			result = annService.halfTimeinsert(ann);
		}else {
			result = annService.Annualinsert(ann);
		}
		if(result > 0) {
			return "redirect:annList.do";
		} else {
			throw new AnnualException("휴가신청에 실패하였습니다.");
		}

	}

	// 휴가신청 내역 리스트보기
	@RequestMapping("annList.do")
	public ModelAndView AnnualList(ModelAndView mv, HttpSession session,
			@RequestParam(value="page", required=false) Integer page) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mNo = loginUser.getmNo();

		int listCount = annService.selectListCount(mNo);
		Annual ann = annService.selectmyann(mNo);

		int currentPage = page != null ? page : 1;
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount , 10, 5);

		ArrayList<Annual> list = annService.selectList(mNo, pi);

		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("ann", ann);
			mv.setViewName("annual/annualList");
			System.out.println("list : " + list);
		} else {
			throw new AnnualException("휴가 내역 조회에 실패하였습니다.");
		}
			return mv;
		}


	// 휴가사용 내역 조회하기
	@RequestMapping("annUseList.do")
	public ModelAndView AnnualUseList(ModelAndView mv, HttpSession session,
			@RequestParam(value="page", required=false) Integer page) {

	Member loginUser = (Member)session.getAttribute("loginUser");
	int mNo = loginUser.getmNo();

	int listCount = annService.selectListendCount(mNo);
	Annual ann = annService.selectmyann(mNo);

	int currentPage = page != null ? page : 1;
	PageInfo pi = Pagination.getPageInfo(currentPage, listCount , 10, 5);

	ArrayList<Annual> list = annService.selectendList(mNo, pi);


	if(list != null) {
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.addObject("ann", ann);
		mv.setViewName("annual/annualUseListView");
		System.out.println("list : " + list);
	} else {
		throw new AnnualException("휴가 내역 조회에 실패하였습니다.");
	}
		return mv;
	}


	// 휴가신청 내역 자세히 보기 페이지 이동
	/*@RequestMapping("annListDatail.do")
	public String AnnualListDatail() {
		return "annual/annualListDatail";
	}*/

	// 휴가신청 완료

	// 디테일 페이지에서 수정가능하도록 처리
	@RequestMapping("annupView.do")
	public ModelAndView annualUpdateView(ModelAndView mv, HttpSession session, int annual_no) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mNo = loginUser.getmNo();

		Annual ann = annService.selectAnnual(annual_no);
		mv.addObject("ann", ann)
		.setViewName("annual/annualListDatail");

		return mv;
	}

	// 휴가신청서 수정하기
	@RequestMapping("annupdate.do")
	public ModelAndView annualUpdate(ModelAndView mv, Annual ann, HttpSession session,
			HttpServletRequest request) {

		Member loginUser = (Member)session.getAttribute("loginUser");
		int mNo = loginUser.getmNo();
		System.out.println("수정한 값 : " + ann );
		int result = annService.updateAnnual(ann);

		if(result > 0) {
			mv.setViewName("redirect:annList.do");
		}else {
			throw new AnnualException("휴가신청 수정에 실패하였습니다.");
		}
		return mv;
	}


	// 휴가신청삭제하기
	@RequestMapping("anndelete.do")
	public String AnnualDelete(HttpSession session, int annual_no) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mNo = loginUser.getmNo();
		System.out.println("휴가번호 : " + annual_no);


		int result = annService.deleteAnnual(annual_no);

		if(result > 0) {
			return "redirect:annList.do";
		}else {
			throw new AnnualException("휴가신청 삭제에 실패하였습니다.");
		}

	}


}