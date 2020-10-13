package com.kh.hongk.approval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hongk.approval.model.exception.EAException;
import com.kh.hongk.approval.model.service.EAService;
import com.kh.hongk.approval.model.vo.Electronic_Approval;
import com.kh.hongk.approval.model.vo.Form;

@Controller
public class ApprovalController {
	
@Autowired
private EAService eaService;
	
	
/////// ea 메인 페이지
	@RequestMapping("app.do")
	public String approvalpage() {
		return "approval/mainPageEA";
	}
	
/////// 가언문 작성 ( 양식 리스트 )
	@RequestMapping("formList.do")
	public ModelAndView formListPage(ModelAndView mv) {
		ArrayList<Form> list = eaService.selectFormList();
		
		if(list != null) {
			mv.addObject("list",list);
			mv.setViewName("approval/FormListPage");
		}else {
			throw new EAException("양식 조회에 실패하였습니다");
		}
		return mv;
	}
	
	// 양식 디테일
	@RequestMapping("formdetail.do")
	public ModelAndView formDetailPage(ModelAndView mv,
				int fid) {
		Form form = eaService.selectForm(fid);
		
		if(form != null) {
			mv.addObject("form", form)
			.setViewName("approval/FormDetailPage");
		}else {
			throw new EAException("양식 조회에 실패하였습니다");
		}
		return mv;
	}
	
	// 기안문 작성 페이지
	@RequestMapping("insertEAPage.do")
	public ModelAndView insertEaPage(ModelAndView mv,int fid) {
		
		Form form = eaService.selectForm(fid);
		
		if(form != null) {
			mv.addObject("form",form)
			.setViewName("approval/InsertEAPage");
		}else {
			throw new EAException("양식을 불러오는데 실패 하였습니다.");
		}
		
		return mv;
	}
	
	// 임시 저장 
	@RequestMapping("temeaform.do")
	public String temeaform(Electronic_Approval ea, 
				HttpServletRequest request) {
		System.out.println("서블릿 까지 오나요");
		System.out.println(ea);
		int result1 = eaService.temeaform(ea);
		int result2 = 1; //eaService.addFile();
		
		if(result1>0 && result2>0) {
			System.out.println("임시저장 성공");
			return "redirect:temporEAList.do";
		}else {
			throw new EAException("임시 저장에 실패하였습니다.");
		}
	}
	
	// 전자결재 등록
	@RequestMapping("insertea.do")
	public String insertea(Electronic_Approval ea, 
				HttpServletRequest request) {
		
		int result = eaService.insertea(ea);
		
		if(result>0) {
			
			return "redirect:earequest.do";
		}else {
			throw new EAException("결재 등록에 실패하였습니다.");
		}
		
		
	}
	
/////// 결재 요청함
	@RequestMapping("earequest.do")
	public String earequestPage() {
		return "approval/eaRequestPage";
	}
	
/////// 임시 저장함
	@RequestMapping("temporEAList.do")
	public ModelAndView temporEAListPage(ModelAndView mv) {
		
		ArrayList<Electronic_Approval> list = eaService.selectListTem();
		
		if(list != null) {
			mv.addObject("list",list)
			.setViewName("approval/temporEAListPage");
		}else {
			throw new EAException("임시 저장함 페이지를 불러오는데 실패하였습니다.");
		}
		return mv;
	}
	
/////// 결재 대기함
	@RequestMapping("waitingEAList.do")
	public String waitingEAListPage() {
		return "approval/waitingEAListPage";
	}
		
/////// 결재 진행함
	@RequestMapping("progressEAList.do")
	public String progressEAListPage() {
		return "approval/progressEAListPage";
	}
///////완료 문서함
	@RequestMapping("completeEAList.do")
	public String completeEAListPage() {
		return "approval/completeEAListPage";
	}	
/////// 반려 저장함
	@RequestMapping("TBackEAList.do")
	public String TBackEAListPage() {
		return "approval/TBackEAListPage";
	}	
/////// 참조 문서함
	@RequestMapping("referEAList.do")
	public String referEAListPage() {
		return "approval/referEAListPage";
	}
/////// 서명 관리함
	@RequestMapping("sigList.do")
	public String sigListPage() {
		return "approval/sigListPage";
	}
	
	@RequestMapping("siginsertPage.do")
	public String siginsertPage() {
		return "approval/sigFilUploadPage";
	}
/////// 양식 추가 페이지
	@RequestMapping("FormInsertPage.do")
	public String FormInsertPage() {
		return "approval/FormInsertPage";
	}	
	
	// 양식 추가 
	@RequestMapping("forminsert.do")
	public String formInsert(Form f, HttpServletRequest request) {
		System.out.println("f : " + f);
		int result = eaService.formInsert(f);
		
		if(result > 0) {
			System.out.println("양식 등록 성공");
			
			return "redirect:formList.do";
		}else {
			 throw new EAException("양식 등록에 실패하였습니다.");
		}
		
	}
}
