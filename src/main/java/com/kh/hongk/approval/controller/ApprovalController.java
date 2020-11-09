package com.kh.hongk.approval.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.hongk.annual.model.vo.Annual;
import com.kh.hongk.approval.model.exception.EAException;
import com.kh.hongk.approval.model.service.EAService;
import com.kh.hongk.approval.model.vo.Approval;
import com.kh.hongk.approval.model.vo.EACount;
import com.kh.hongk.approval.model.vo.Electronic_Approval;
import com.kh.hongk.approval.model.vo.Form;
import com.kh.hongk.approval.model.vo.PageInfo;
import com.kh.hongk.approval.model.vo.Pagination;
import com.kh.hongk.approval.model.vo.Referrer;
import com.kh.hongk.approval.model.vo.Search;
import com.kh.hongk.approval.model.vo.Sig_File;
import com.kh.hongk.member.model.vo.Files;
import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.vo.Project;
import com.kh.hongk.work.model.vo.Work;

@Controller
public class ApprovalController {
	java.util.Date d = new java.util.Date();
	
@Autowired
private EAService eaService;
	
	
/////// ea 메인 페이지
	@RequestMapping("app.do")
	public ModelAndView approvalpage(HttpSession session, ModelAndView mv, int pageurlnum) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mno = loginUser.getmNo();
		
		int pageurlnum1 = pageurlnum;
		if(pageurlnum1 != 0) {
			session.setAttribute("pageurlnum1", pageurlnum1);
		}
		
		int Wp= eaService.countWp(mno);
		int Cp=eaService.countCp(mno);
		int Bp=eaService.countBp(mno);
		int R=eaService.countR(mno);
		int T=eaService.countT(mno);
		int C=eaService.countC(mno);
		int B=eaService.countB(mno);
		EACount eaC = new EACount(Wp, Cp, Bp, R, T, C, B);
		System.out.println("eaC : " + eaC);
		
		ArrayList<Electronic_Approval> listWp = eaService.listWp(mno);
		ArrayList<Electronic_Approval> listref = eaService.listref(mno);
		
		System.out.println(listref);
			
		mv.addObject("eaC", eaC)
		.addObject("listWp", listWp)
		.addObject("listref", listref)
		.setViewName("approval/mainPageEA");
		return mv;
		
	}
	
/////// 가언문 작성 ( 양식 리스트 )
	@RequestMapping("formList.do")
	public ModelAndView formListPage(ModelAndView mv, 
			@RequestParam(value="page", required=false) Integer page) {
		// [페이징] 
		int listCount = eaService.countformList(); //양식 전체 글 수
				
		int currentPage = page != null ? page : 1; // 현재 페이지 계산
				
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 15); // 페이지 정보
		
		
		ArrayList<Form> list = eaService.selectFormList(pi);
		
		if(list != null) {
			mv.addObject("list",list)
			.addObject("pi",pi)
			.setViewName("approval/FormListPage");
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
	public ModelAndView insertEaPage(ModelAndView mv, int fid, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mno = loginUser.getmNo();
		
		Member member = eaService.selectdrafter(mno);
		
		
		Form form = eaService.selectForm(fid);

		if(form != null) {
			if(form.getForm_name().contains("프로젝트")) {
			mv.addObject("form",form)
			.addObject("member", member)
			.setViewName("approval/insertEAProjectPage");
			}else if(form.getForm_name().contains("휴가")) {
				mv.addObject("form",form)
				.addObject("member", member)
				.setViewName("annual/annualInsertForm");
			}else if(form.getForm_name().contains("외근")) {
				mv.addObject("form",form)
				.addObject("member", member)
				.setViewName("work/workInsertForm");
			}else {
				mv.addObject("form",form)
				.addObject("member", member)
				.setViewName("approval/InsertEAPage");
			}
		}else {
			throw new EAException("양식을 불러오는데 실패 하였습니다.");
		}
		
		return mv;
	}
	
	// 임시 저장 
	@RequestMapping("temeaform.do")
	public String temeaform(Electronic_Approval ea, 
				HttpServletRequest request, String app, String ref,
				@RequestParam(value="uploadFile", required=false) MultipartFile file) {
		
		System.out.println("넘어온 ref : " + ref);
		System.out.println("넘어온 app : " + app);
		
		String [] approvers = app.split(","); // 받아온 결재자 정보 배열로 분리
		
		
		for(int i = 0; i < approvers.length; i++) {
			System.out.println("가져온 결재자 정보 : " + approvers[i]);
		}
		System.out.println(ea);
		
		int result1 = eaService.temeaform(ea);
		
		// 결재자 등록
				for(int i = 0 ; i < approvers.length;  ) {
					
						Approval appro = new Approval(i+1,Integer.parseInt(approvers[i]));
						appro.setEa_no(ea.getEa_no());
						System.out.println(appro); 
						
						int resulta = eaService.insertApprover(appro);
						
						if(result1 > 0 ) {
							i++;
						}
				}
				// 참조자 등록
					if(!ref.isEmpty()) {
					String [] referrers = ref.split(","); // 받아온 참조자 정보 배열로 분리
						System.out.println("참조자 있네요.");
						System.out.println("referrers 길이 : " +referrers.length );
					for(int i = 0 ; i < referrers.length;  ) {
						int eano = ea.getEa_no();
						Referrer refer = new Referrer(Integer.parseInt(referrers[i]),eano  );
						refer.setEa_no(ea.getEa_no());
						System.out.println(refer); 
								
						int result2 = eaService.insertRefer(refer);
								
						if(result1 > 0 ) {
							i++;
							}
						}
					}
				// 파일이 업로드 되었다면 (업로드 된 파일명이 ""가 아니라면)	
				if(!file.getOriginalFilename().equals("")) {	
					String OriginalFilename = file.getOriginalFilename();
					System.out.println("넘어온 uploadFile : " + OriginalFilename);
					String renameFileName = saveEAFile(file, request);
					System.out.println("renameFileName : " + renameFileName);
					
					Files f = new Files();
					if(renameFileName != null) {
						f.setOriginal_FileName(OriginalFilename);
						f.setReName_FileName(renameFileName);
						
						System.out.println("f : " + f);
					}
					
					int result4 = eaService.Fileinsert(f);
				}	
		
		if(result1>0) {
			System.out.println("임시저장 성공");
			return "redirect:temporEAList.do";
		}else {
			throw new EAException("임시 저장에 실패하였습니다.");
		}
	}
	
	// 전자결재 등록 + 결재자도 등록 + 참조자도 등록
	@RequestMapping("insertea.do")
	public String insertea(Electronic_Approval ea,HttpServletRequest request
						,int drafter, String app, String ref,
						@RequestParam(value="uploadFile", required=false) MultipartFile file) {
		
		System.out.println("넘어온 ref : " + ref);
		System.out.println("넘어온 app : " + app);
		
		String [] approvers = app.split(","); // 받아온 결재자 정보 배열로 분리
		
		
		for(int i = 0; i < approvers.length; i++) {
			System.out.println("가져온 결재자 정보 : " + approvers[i]);
		}
		// 기안 내용 
		int result = eaService.insertea(ea);
		
		// 결재자 등록
		for(int i = 0 ; i < approvers.length;  ) {
			
				Approval appro = new Approval(i+1,Integer.parseInt(approvers[i]));
				appro.setEa_no(ea.getEa_no());
				System.out.println(appro); 
				
				int result1 = eaService.insertApprover(appro);
				
				if(result > 0 ) {
					i++;
				}
		}
		
		// 참조자 등록
			if(!ref.isEmpty()) {
			String [] referrers = ref.split(","); // 받아온 참조자 정보 배열로 분리
				System.out.println("참조자 있네요.");
				System.out.println("referrers 길이 : " +referrers.length );
			for(int i = 0 ; i < referrers.length;  ) {
				int eano = ea.getEa_no();
				Referrer refer = new Referrer(Integer.parseInt(referrers[i]),eano  );
				refer.setEa_no(ea.getEa_no());
				System.out.println(refer); 
						
				int result2 = eaService.insertRefer(refer);
						
				if(result > 0 ) {
					i++;
					}
				}
			}
			
		// 파일이 업로드 되었다면 	
		if(!file.getOriginalFilename().equals("")) {	
			String OriginalFilename = file.getOriginalFilename();
			System.out.println("넘어온 uploadFile : " + OriginalFilename);
			String renameFileName = saveEAFile(file, request);
			System.out.println("renameFileName : " + renameFileName);
			
			Files f = new Files();
			if(renameFileName != null) {
				f.setOriginal_FileName(OriginalFilename);
				f.setReName_FileName(renameFileName);
				
				System.out.println("f : " + f);
			}
			
			int result4 = eaService.Fileinsert(f);
		}	
		
		if(result>0) {
			
			return "redirect:earequest.do";
		}else {
			throw new EAException("결재 등록에 실패하였습니다.");
		}
	}
	
	// 전자결재 프로젝트 등록
	@RequestMapping("inserteaP.do")
	public String inserteaP(Electronic_Approval ea, HttpSession session,
				 HttpServletRequest request,
				String mid, String app, String ref,
				@RequestParam("pDate") @DateTimeFormat(pattern="yyyy-MM-dd") Date pDate,
				@RequestParam("deadLine") @DateTimeFormat(pattern="yyyy-MM-dd") Date deadLine) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int drafter = loginUser.getmNo();
		ea.setDrafter(drafter);
		
		System.out.println("넘어온 ref : " + ref);
		System.out.println("넘어온 app : " + app);
		System.out.println("넘어온 mid(담당자) : " + mid);
		
		String [] approvers = app.split(","); // 받아온 결재자 정보 배열로 분리
		
		int manager = Integer.parseInt(mid); 
		Project p = new Project(ea.getEa_title(), ea.getEa_content(), pDate, deadLine, manager);
		int resultEA = eaService.insertea(ea);
		
		int resultP = eaService.inserteaP(p);
		System.out.println(" p : " + p);
		
		
		// 결재자 등록
		for(int i = 0 ; i < approvers.length;  ) {
			
				Approval appro = new Approval(i+1,Integer.parseInt(approvers[i]));
				appro.setEa_no(ea.getEa_no());
				System.out.println(appro); 
				
				int result1 = eaService.insertApprover(appro);
				
				if(resultEA > 0 ) {
					i++;
				}
		}
		// 참조자 등록
			if(!ref.isEmpty()) {
			String [] referrers = ref.split(","); // 받아온 참조자 정보 배열로 분리
				System.out.println("참조자 있네요.");
			for(int i = 0 ; i < referrers.length;  ) {
				int eano = ea.getEa_no();
				Referrer refer = new Referrer(Integer.parseInt(referrers[i]),eano  );
				refer.setEa_no(ea.getEa_no());
				System.out.println(refer); 
						
				int result2 = eaService.insertRefer(refer);
						
				if(resultEA > 0 ) {
					i++;
					}
				}
			}
		if(resultP>0 && resultEA>0) {
			return "redirect:earequest.do";
		}else {
			throw new EAException("결재 등록에 실패하였습니다.");
		}
	}
	
	// 결재 디테일 뷰
	@RequestMapping("eadetail.do")
	public ModelAndView eaDetailPage(ModelAndView mv,int ea_no, String CurPage) {
		
		Electronic_Approval ea = eaService.eadetail(ea_no);
		
		// 결재 기록
		ArrayList<Approval> ap = eaService.apList(ea_no);
		// 전자 서명
		ArrayList<Sig_File> sig = eaService.sigList(ea_no);
		// 참조자 리스트
		ArrayList<Referrer> ref = eaService.reList(ea_no);
		// 첨부파일
		Files f = eaService.selectFile(ea_no);
		
		if(ea != null) {
			System.out.println("CurPage : " + CurPage);
			System.out.println("결재기록 : " + ap);
			mv.addObject("ea",ea)
			.addObject("ap",ap)
			.addObject("ref",ref)
			.addObject("sig",sig)
			.addObject("f", f)
			.addObject("CurPage",CurPage)
			.setViewName("approval/detailEAPage");
		}else {
			throw new EAException("결재 상세페이지를 불러오는데 실패하였습니다.");
		}
		return mv;
	}
/////// 결재 요청함
	@RequestMapping("earequest.do")
	public ModelAndView earequestPage(ModelAndView mv,HttpSession session, String msg,
			@RequestParam(value="page", required=false) Integer page ) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int drafter = loginUser.getmNo();
		//[결재회수 msg]
		System.out.println("받은 msg : " + msg);
		
		// [페이징] 
		int listCount = eaService.selectRequestListCount(drafter); //요청함 전체 글 수
		
		int currentPage = page != null ? page : 1; // 현재 페이지 계산
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 15); // 페이지 정보
		
		ArrayList<Electronic_Approval> list = eaService.selectListreq(drafter, pi);
		
		if(list != null) {
			mv.addObject("list",list)
			.addObject("pi", pi)
			.addObject("msg",msg)
			.setViewName("approval/eaRequestPage"); 
		}else {
			throw new EAException("결재요청함을 불러오는데 실패하였습니다.");
		}
		return mv;
	}
	
/////// 임시 저장함
	@RequestMapping("temporEAList.do")
	public ModelAndView temporEAListPage(ModelAndView mv,HttpSession session,
			@RequestParam(value="page", required=false) Integer page) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int drafter = loginUser.getmNo();
		// [페이징] 
		int listCount = eaService.countT(drafter);; // 임시 저장함 전체 글 수
				
		int currentPage = page != null ? page : 1; // 현재 페이지 계산
				
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 15); // 페이지 정보
				
		
		ArrayList<Electronic_Approval> list = eaService.selectListTem(drafter, pi);
		
		if(list != null) {
			mv.addObject("list",list)
			.addObject("pi", pi)
			.setViewName("approval/temporEAListPage");
		}else {
			throw new EAException("임시 저장함 페이지를 불러오는데 실패하였습니다.");
		}
		return mv;
	}
	
	// 임시 저장 삭제
	@RequestMapping("teadelete.do")
	public String teadelete(int ea_no, HttpServletRequest request) {
		
		int result = eaService.taedelete(ea_no );
		
		if(result>0) {
			System.out.println("삭제 성공");
			return "redirect:temporEAList.do";
		}else {
			throw new EAException("삭제 실패하였습니다.");
		}
	}
	// 임시 저장 등록
	@RequestMapping("teaupdate.do")
	public String teaupdate(int ea_no , HttpServletRequest request) {
		
		int result = eaService.teaupdate(ea_no);
		
		if(result>0) {
			return "redirect:temporEAList.do";
		}else {
			throw new EAException("저장 실패하였습니다.");
		}
	}
/////// 결재 대기함  ++ approval의 결재 상태가 W인 경우만 뽑기 추가
	@RequestMapping("wEAList.do")
	public ModelAndView waitingEAListPage(ModelAndView mv,HttpSession session, String msg,
			@RequestParam(value="page", required=false) Integer page) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mno = loginUser.getmNo();
		// [페이징] 
		int listCount = eaService.countWp(mno); //요청함 전체 글 수
				
		int currentPage = page != null ? page : 1; // 현재 페이지 계산
				
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 15); // 페이지 정보
		
		ArrayList<Electronic_Approval> list = eaService.selectListW(mno,pi);
		System.out.println("mno : " + mno);
		if(list != null) {
			mv.addObject("list",list)
			.addObject("pi", pi)
			.addObject("msg", msg)
			.setViewName("approval/waitingEAListPage");
		}else {
			throw new EAException("결재 대기함 페이지를 불러오는데 실패하였습니다.");
		}
		return mv;
	}
	
	// 결재하기(update)
	@RequestMapping("apInsert.do")
	public ModelAndView appinsert(Approval ap , HttpSession session, ModelAndView mv,
			HttpServletRequest request, @RequestParam(value="uploadFile", required=false) MultipartFile file) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int approver_no = loginUser.getmNo();
		ap.setApprover_no(approver_no);	
		System.out.println("Ap : " +ap);
		
		// 1. 해당 결자재 레벨 가져오기
		Approval curap = eaService.selectCurapprover(ap);
		System.out.println("해당 결자 레벨 : " + curap.getApproval_lelvel());
		// 마지막 결재자 였는가
		Approval nextap = eaService.selectNextapprover(curap);
		
		// 내 앞순서 결재자가 결재를 하였는가.
		if(curap.getApproval_lelvel() != 1) {
		Approval prevAp = eaService.selectPrevapprover(curap);
			// 앞 순서 결재 전
			if(prevAp.getApproval_status().equals("W")){
				System.out.println("앞 순서 결재자가 결재 전 입니다.");
				mv.addObject("msg", "선결재자가 결재 전입니다.")
				.setViewName("redirect:wEAList.do");
				return mv;
				
			}else {
				System.out.println("앞 순서 결재자가 결재하였습니다. 결재 진행해 주세요");
			}	
		 }	
			int result = eaService.apInsert(ap);
			if(result>0) {
					// 2.반려 처리 하였는가
					int ea_no = ap.getEa_no();
						if(ap.getApproval_status().equals("N")) {
							// 해당 결재 반려로 상태 변경
							int result1 = eaService.eaupdateN(ea_no);
							
							if(result1 > 0) {
								System.out.println("결재 반려처리 완료");
							}else {
								throw new EAException("반려에 실패하였습니다.");
							}
						}
						System.out.println("다음 결재 여부 : " + nextap);
					
						// 다음 결재자 없다면(마지막 결재라면). 방금 결재가 마지막 결재이며 결재 승인인 경우 해당 결재도 Y
						if(nextap == null) {
								if(ap.getApproval_status().equals("Y")) {
									int result3 =  eaService.EAupdateY(ea_no);
									
									int resultP =  eaService.PEAupdateY(ea_no);
									
									int resultann = eaService.annupdateY(ea_no);
									Annual ann = eaService.selectAnn(ea_no);
									int resultam = eaService.amupdateY(ann);
									
									int resultwk = eaService.wkupdateY(ea_no);
			                        Work wk = eaService.selectwk(ea_no);
			                        
			                        int resultend = eaService.updatewkend(wk);
									
									if(result3 > 0) {
										System.out.println("결재 완료. 결재 완료함에서 확인 가능");
									}else {
										throw new EAException("최종결재에 실패하였습니다.");
									}
								}
						}else {
							System.out.println("다음 결재자 존재");
						}
						
				}else {
					throw new EAException("결재에 실패하였습니다.");
			}
		mv.setViewName("redirect:wEAList.do");
		return mv;
	}
	
		
/////// 결재 진행함  + 내가 결재한 -> approval 의 결재 상태 Y인 경우 출력
	@RequestMapping("progressEAList.do")
	public ModelAndView progressEAListPage(ModelAndView mv , HttpSession session,
			@RequestParam(value="page", required=false) Integer page) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int approver_no  = loginUser.getmNo();
		
		// [페이징] 
		int listCount = eaService.countProg(approver_no); //요청함 전체 글 수
						
		int currentPage = page != null ? page : 1; // 현재 페이지 계산
						
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 15); // 페이지 정보
		
		
		ArrayList<Electronic_Approval> list = eaService.selecListPEA(approver_no, pi);
		
		if( list != null) {
			mv.addObject("list",list)
			.addObject("pi", pi)
			.setViewName("approval/progressEAListPage");
			
			return mv;
		}else {
			throw new EAException("결재 진행함을 불러오는데 실패하였습니다.");
		}
		
	}
	
///////완료 문서함
	@RequestMapping("completeEAList.do")
	public ModelAndView completeEAListPage(ModelAndView mv, HttpSession session,
			@RequestParam(value="page", required=false) Integer page) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int drafter = loginUser.getmNo();
		
		// [페이징] 
		int listCount = eaService.countCp(drafter); //요청함 전체 글 수
				
		int currentPage = page != null ? page : 1; // 현재 페이지 계산
				
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 15); // 페이지 정보
				
		
		ArrayList<Electronic_Approval> list = eaService.selectListComEA(drafter, pi);
		
		if(list != null) {
			mv.addObject("list",list)
			.addObject("pi", pi)
			.setViewName("approval/completeEAListPage");
			
			return mv;
			
		}else {
			throw new EAException("완료 저장함 불러오기 실패");
		}
	}	
/////// 반려 저장함
	@RequestMapping("TBackEAList.do")
	public ModelAndView TBackEAListPage(ModelAndView mv, HttpSession session,
			@RequestParam(value="page", required=false) Integer page) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int drafter = loginUser.getmNo();
		
		// [페이징] 
		int listCount = eaService.countBp(drafter); //요청함 전체 글 수
				
		int currentPage = page != null ? page : 1; // 현재 페이지 계산
				
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 15); // 페이지 정보
				
		
		ArrayList<Electronic_Approval> list = eaService.selectREAList(drafter, pi);
		
		if(list != null) {
			mv.addObject("list",list)
			.addObject("pi", pi)
			.setViewName("approval/TBackEAListPage");
			
			return mv;
		}else {
			throw new EAException("반려 저장함 불러오기 실패");
		}
	}	
/////// 참조 문서함
	@RequestMapping("referEAList.do")
	public ModelAndView referEAListPage(ModelAndView mv, HttpSession session,
			@RequestParam(value="page", required=false) Integer page) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int re_no = loginUser.getmNo();
		
		// [페이징] 
		int listCount = eaService.countRef(re_no); //요청함 전체 글 수
				
		int currentPage = page != null ? page : 1; // 현재 페이지 계산
				
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 15); // 페이지 정보
				
		
		ArrayList<Electronic_Approval> list = eaService.selectListrefea(re_no,pi);
		
		if(list != null) {
			mv.addObject("list",list)
			.addObject("pi", pi)
			.setViewName("approval/referEAListPage");
			
			return mv;
		}else {
			throw new EAException("참조 문서함을 불러오는데 실패하였습니다.");
		}
		
	}
/////// 서명 관리함
	@RequestMapping("sigList.do")
	public ModelAndView sigListPage(HttpSession session, ModelAndView mv) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mno = loginUser.getmNo();
		
		ArrayList<Sig_File> list = eaService.selectSigList(mno);
		System.out.println("서명 list : " + list);
		
		mv.addObject("list",list)
		.setViewName("approval/sigListPage");
		
		return mv;
	}
	// 서명 추가
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
	public String formInsert(Form f, HttpServletRequest request, int mno) {
		System.out.println("f : " + f);
		int result = eaService.formInsert(f);
		
		if(result > 0) {
			System.out.println("양식 등록 성공");
			
			return "redirect:formList.do";
		}else {
			 throw new EAException("양식 등록에 실패하였습니다.");
		}
	}
	
	// 양식 검색
	@RequestMapping("formsearch.do")
	public String formsearch(Search search, Model model) {
	
		ArrayList<Electronic_Approval> searchList = eaService.searchList(search);
		
		model.addAttribute("list", searchList);
		model.addAttribute("search", search);
		
		return "approval/FormListPage";
	}
	
	// 임시저장함 검색
	@RequestMapping("TeaSearch.do")
	public String TeaSearch(Search search, Model model, HttpSession session
			,@RequestParam(value="page", required=false) Integer page 	) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int drafter = loginUser.getmNo();
		
		search.setMno(drafter);
		
		System.out.println("검색어 : " + search);
		System.out.println("현재 페이지 : " + page);
		
		// [페이징] 
		int listCount = eaService.TEAsearchCount(search,drafter);; // 임시 저장함 전체 글 수
						
		int currentPage = page != null ? page : 1; // 현재 페이지 계산
						
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 15); // 페이지 정보
				
		
		ArrayList<Electronic_Approval> searchList = eaService.TEAsearch(search, pi);
		
		model.addAttribute("list", searchList);
		model.addAttribute("pi", pi);
		model.addAttribute("search", search);
		
		return "approval/temporEAListPage";
	}
	
	// 요청함 결재 검색
	@RequestMapping("EAsearch.do")
	public String EAsearch(Search search, Model model,  HttpSession session
			,@RequestParam(value="page", required=false) Integer page ) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int drafter = loginUser.getmNo();
		
		search.setMno(drafter);
		
		System.out.println("검색어 : " + search);
		System.out.println("현재 페이지 : " + page);
	
		// [페이징] 
		int listCount = eaService.EAsearchCount(search,drafter); //요청함 전체 글 수
				
		int currentPage = page != null ? page : 1; // 현재 페이지 계산
				
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 15); // 페이지 
		search.setMno(drafter);
		
		
		ArrayList<Electronic_Approval> searchList = eaService.EAsearch(search,pi);
		System.out.println("검색한 결과 : " + searchList);
		
		
		model.addAttribute("list", searchList);
		model.addAttribute("pi", pi);
		model.addAttribute("search", search);
		
		return "approval/eaRequestPage";
	}
	
	// 결재대기  검색
		@RequestMapping("WEAsearch.do")
		public String WEAsearch(Search search, Model model,  HttpSession session
				,@RequestParam(value="page", required=false) Integer page ) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			int drafter = loginUser.getmNo();
			
			search.setMno(drafter);
			
			System.out.println("검색어 : " + search);
			System.out.println("현재 페이지 : " + page);
		
			// [페이징] 
			int listCount = eaService.WEAsearchCount(search,drafter); //요청함 전체 글 수
					
			int currentPage = page != null ? page : 1; // 현재 페이지 계산
					
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 15); // 페이지 
			
			ArrayList<Electronic_Approval> searchList = eaService.WEAsearch(search,pi);
			System.out.println("검색한 결과 : " + searchList);
			
			
			model.addAttribute("list", searchList);
			model.addAttribute("pi", pi);
			model.addAttribute("search", search);
			
			return "approval/waitingEAListPage";
		}
		
		// 결재진행 검색
		@RequestMapping("PEAsearch.do")
		public String PEAsearch(Search search, Model model,  HttpSession session
				,@RequestParam(value="page", required=false) Integer page ) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			int drafter = loginUser.getmNo();
			
			search.setMno(drafter);
			
			System.out.println("검색어 : " + search);
			System.out.println("현재 페이지 : " + page);
		
			// [페이징] 
			int listCount = eaService.PEAsearchCount(search,drafter); //요청함 전체 글 수
					
			int currentPage = page != null ? page : 1; // 현재 페이지 계산
					
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 15); // 페이지 
			
			ArrayList<Electronic_Approval> searchList = eaService.PEAsearch(search,pi);
			System.out.println("검색한 결과 : " + searchList);
			
			
			model.addAttribute("list", searchList);
			model.addAttribute("pi", pi);
			model.addAttribute("search", search);
			
			return "approval/progressEAListPage";
		}
		// 결재완료 검색
		@RequestMapping("CEAsearch.do")
		public String CEAsearch(Search search, Model model,  HttpSession session
				,@RequestParam(value="page", required=false) Integer page ) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			int drafter = loginUser.getmNo();
			
			search.setMno(drafter);
			
			System.out.println("검색어 : " + search);
			System.out.println("현재 페이지 : " + page);
		
			// [페이징] 
			int listCount = eaService.CEAsearchCount(search,drafter); //요청함 전체 글 수
					
			int currentPage = page != null ? page : 1; // 현재 페이지 계산
					
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 15); // 페이지 
			
			ArrayList<Electronic_Approval> searchList = eaService.CEAsearch(search,pi);
			System.out.println("검색한 결과 : " + searchList);
			
			
			model.addAttribute("list", searchList);
			model.addAttribute("pi", pi);
			model.addAttribute("search", search);
			
			return "approval/completeEAListPage";
		}
		// 반려함 검색
		@RequestMapping("BEAsearch.do")
		public String BEAsearch(Search search, Model model,  HttpSession session
				,@RequestParam(value="page", required=false) Integer page ) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			int drafter = loginUser.getmNo();
			
			search.setMno(drafter);
			
			System.out.println("검색어 : " + search);
			System.out.println("현재 페이지 : " + page);
		
			// [페이징] 
			int listCount = eaService.BEAsearchCount(search,drafter); //요청함 전체 글 수
					
			int currentPage = page != null ? page : 1; // 현재 페이지 계산
					
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 15); // 페이지 
			
			ArrayList<Electronic_Approval> searchList = eaService.BEAsearch(search,pi);
			System.out.println("검색한 결과 : " + searchList);
			
			
			model.addAttribute("list", searchList);
			model.addAttribute("pi", pi);
			model.addAttribute("search", search);
			
			return "approval/TBackEAListPage";
		}
		// 참조함검색
		@RequestMapping("RFEAsearch.do")
		public String RFEAsearch(Search search, Model model,  HttpSession session
				,@RequestParam(value="page", required=false) Integer page ) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			int drafter = loginUser.getmNo();
			
			search.setMno(drafter);
			
			System.out.println("검색어 : " + search);
			System.out.println("현재 페이지 : " + page);
		
			// [페이징] 
			int listCount = eaService.RFEAsearchCount(search,drafter); //요청함 전체 글 수
					
			int currentPage = page != null ? page : 1; // 현재 페이지 계산
					
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 15); // 페이지 
			
			ArrayList<Electronic_Approval> searchList = eaService.RFEAsearch(search,pi);
			System.out.println("검색한 결과 : " + searchList);
			
			
			model.addAttribute("list", searchList);
			model.addAttribute("pi", pi);
			model.addAttribute("search", search);
			
			return "approval/referEAListPage";
		}
		
	// 조직도 조회 ( 결재자 )
	@RequestMapping("approverList.do")
	public ModelAndView approverList(ModelAndView mv) {
		ArrayList<Member> list = eaService.approverList();
		ArrayList<Member> dept = eaService.deptList();
		
		if(list != null) {
			mv.addObject("list",list)
			.addObject("dept",dept)
			.setViewName("approval/selectapproverPage");
		}else {
			throw new EAException("조회 실패");
		}
		return mv;
	}
	// 조직도 조회 ( 참조자 )
		@RequestMapping("referrerList.do")
		public ModelAndView referrerList(ModelAndView mv) {
			ArrayList<Member> list = eaService.approverList();
			ArrayList<Member> dept = eaService.deptList();
			
			if(list != null) {
				mv.addObject("list",list)
				.addObject("dept",dept)
				.setViewName("approval/selectreferrerPage");
			}else {
				throw new EAException("조회 실패");
			}
			return mv;
		}
		// 조직도 조회 ( 참조자 )
		@RequestMapping("managerList.do")
		public ModelAndView managerList(ModelAndView mv) {
			ArrayList<Member> list = eaService.approverList();
			ArrayList<Member> dept = eaService.deptList();
			
			if(list != null) {
				mv.addObject("list",list)
				.addObject("dept",dept)
				.setViewName("approval/selectmanagerPage");
			}else {
				throw new EAException("조회 실패");
			}
			return mv;
		}
		
	// 결재가 선택 (1명 선택)
	@RequestMapping("addapprover.do")
	@ResponseBody
	public String addapprover(int ap_no) {
		Member m = eaService.addapprover(ap_no);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 

		return gson.toJson(m);
	}
	
	// 회수하기
	@RequestMapping("takeBack.do")
	public ModelAndView takeBack(int ea_no, ModelAndView mv, HttpServletRequest request) {
		
		Approval ap = eaService.selectFirstApproval(ea_no);
		System.out.println("현재 결재의 결재자 상황 : " + ap);
		if(ap != null) {
			int result = eaService.takeBack(ea_no);
			
			if(result > 0) {
				mv.addObject("msg", "회수 되었습니다")
				.setViewName("redirect:earequest.do");
				return mv;
			}else {
				throw new EAException("회수에 실패하였습니다.");
			}
		}else {
			mv.addObject("msg", "이미 결재가 진행 되었습니다. 회수가 불가능 합니다")
			.setViewName("redirect:earequest.do");
			return mv;
		}
	}
	// 결재 수정 페이지 이동
	@RequestMapping("updateEAPage.do")
	public ModelAndView updateEaPage(ModelAndView mv, int ea_no) {
		Electronic_Approval list = eaService.updateEaPage(ea_no);
		
		ArrayList<Approval> ap = eaService.apList(ea_no);
		ArrayList<Referrer> ref = eaService.reList(ea_no);
		
		if( list != null ) {
			mv.addObject("list", list)
			.addObject("ap",ap)
			.addObject("ref",ref)
			.setViewName("approval/updateEAPage");
			return mv;
		}else {
			throw new EAException("결재 수정 페이지를 불러오는데 실패하였습니다");
		}
	}
	
	// 결재 내용 수정하기
	@RequestMapping("updateEA.do")
	public String updateEa(int ea_no, Electronic_Approval ea) {
		ea.setDrafter(ea_no);
		int result = eaService.updateEa(ea);
		
		if(result > 0 ) {
			
			return "redirect:earequest.do";
		}else {
			throw new EAException("결재 수정에 실패하였습니다");
		}
	}
	
/////// 결재 로그
	@RequestMapping("approvalLog.do")
	public ModelAndView approvalLog(int ea_no, ModelAndView mv) {
		ArrayList<Approval> list = eaService.approvalLog(ea_no);
		
		if(list != null) {
			System.out.println("결재 현황 : " + list);
			mv.addObject("list", list)
			.setViewName("approval/approvalLog");
			
			return mv;
		}else {
			throw new EAException("결재 로그를 불러오는데 실패하였습니다.");
		}
	}
	
	// 재기안
	@RequestMapping("retryEA.do")
	public String retryEA(int ea_no, HttpServletRequest request) {
		
		int result = eaService.retryEA(ea_no);
		int result2 = eaService.initialAPP(ea_no);
		
		if(result > 0 && result2 > 0) {
			
			return "redirect:earequest.do";
		}else {
			throw new EAException("재기안에 실패하였습니다.");
		}
	}
	
	// 전자결결재 삭제
	@RequestMapping("deleteEA.do")
	public String deleteEA(int ea_no, HttpServletRequest request) {
		
		int result = eaService.deleteEA(ea_no);
		
		if(result > 0) {
			
			return "redirect:earequest.do";
		}else {
			throw new EAException("삭제에 실패하였습니다.");
		}
	}
	
	// 전자 서명 등록
	@RequestMapping("siginsert.do")
	public String siginsert( HttpServletRequest request, HttpSession session,  
			@RequestParam("uploadFile") MultipartFile file) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mno = loginUser.getmNo(); 
		
		String OriginalFilename = file.getOriginalFilename();
		System.out.println("넘어온 uploadFile : " + OriginalFilename);
		String renameFileName = saveFile(file, request);
		System.out.println("renameFileName : " + renameFileName);
		
		Files f = new Files();
		if(renameFileName != null) {
			f.setOriginal_FileName(OriginalFilename);
			f.setReName_FileName(renameFileName);
			
			System.out.println("f : " + f);
		}
		
		// Files 에 등록
		int result = eaService.sigFileinsert(f);
		// sig_File 등록 전 , 이 전에 등록한 파일들 status = N 
		int result2 = eaService.sigN(mno);
		// Sig_File에 등록
		int result3 = eaService.siginsert(mno);
		
		return "redirect:sigList.do";
	}
	
	// [SIG] 서명파일 저장을 위한 별도의 메소드
		public String saveFile(MultipartFile file, HttpServletRequest request) {
			// 파일이 저장 될 경로 설정
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			String savePath = root + "\\SigFileUpload";
			
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
		// [EA] 결재 저장을 위한 별도의 메소드
		public String saveEAFile(MultipartFile file, HttpServletRequest request) {
			// 파일이 저장 될 경로 설정
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			String savePath = root + "\\EAFileUpload";
			
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
	
		// 서명 변경
		@RequestMapping("useSig.do")
		public String useSig(int sig_no, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mno = loginUser.getmNo();
			
		System.out.println("sig_no");
		// sig_File 등록 전 , 이 전에 등록한 파일들 status = N 
		int resultD = eaService.sigN(mno);
		
		int resultU = eaService.sigUpdate(sig_no);
		
		return "redirect:sigList.do";
		
		}
		// 전자 서명 삭제
		@RequestMapping("delSig.do")
		public String delSig(int sig_no, HttpSession session) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			int mno = loginUser.getmNo();
				
			System.out.println("sig_no");
			// files 삭제
			int resultF = eaService.delfiles(sig_no);
			
			// sig_File 삭제
			int resultS = eaService.delSig(sig_no);
			
			return "redirect:sigList.do";
			
			}
		
		
		// 사원명 조회
		@RequestMapping("searchMname.do")
		@ResponseBody
		public String searchMname(String searchName) {
			System.out.println("searchName : " + searchName);
			
			ArrayList<Member> list = eaService.searchMname(searchName);
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
			System.out.println("검색한 사원 리스트 : " + list);
			return gson.toJson(list);
		}
}
