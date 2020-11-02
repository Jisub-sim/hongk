package com.kh.hongk.approval.model.service;

import java.util.ArrayList;

import com.kh.hongk.annual.model.vo.Annual;
import com.kh.hongk.approval.model.vo.Approval;
import com.kh.hongk.approval.model.vo.Electronic_Approval;
import com.kh.hongk.approval.model.vo.Form;
import com.kh.hongk.approval.model.vo.PageInfo;
import com.kh.hongk.approval.model.vo.Referrer;
import com.kh.hongk.approval.model.vo.Search;
import com.kh.hongk.approval.model.vo.Sig_File;
import com.kh.hongk.member.model.vo.Files;
import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.vo.Project;

public interface EAService {
	
	// 양식 추가
	int formInsert(Form f);
	// 양식 리스트 (기안 작성)
	ArrayList<Form> selectFormList(PageInfo pi);
	// 양식 조회(디테일)
	Form selectForm(int fid);
	// 임시 저장 
	int temeaform(Electronic_Approval ea);
	// 결재 등록
	int insertea(Electronic_Approval ea);
	int inserteaP(Project p);
	// 임시 저장함 리스트
	ArrayList<Electronic_Approval> selectListTem(int drafter ,PageInfo pi);
	// 결재 요청함
	ArrayList<Electronic_Approval> selectListreq(int drafter ,PageInfo pi);
	// 결재 디테일 뷰
	Electronic_Approval eadetail(int ea_no);

	// 검색
	ArrayList<Electronic_Approval> searchList(Search search);
	ArrayList<Electronic_Approval> EAsearch(Search search ,PageInfo pi);
	
	// 조직도 조회
	ArrayList<Member> approverList();
	// 부서 조회
	ArrayList<Member> deptList();
	// 결재자 선택
	Member addapprover(int ap_no);
	// 결재 대기함 리스트
	ArrayList<Electronic_Approval> selectListW(int mno ,PageInfo pi);
	// 임시 저장 삭제
	int taedelete(int ea_no);
	// 임시 저장 등록
	int teaupdate(int ea_no);
	// 결재
	int apInsert(Approval ap);
	// 결재 반려 처리 (ea_status = 'N')
	int eaupdateN(int ea_no);
	// 반려 함
	ArrayList<Electronic_Approval> selectREAList(int drafter ,PageInfo pi);
	// 참조자 리스트
	ArrayList<Referrer> reList(int ea_no);
	//결재기록
	ArrayList<Approval> apList(int ea_no);
	// 결재자의 서명파일 
	ArrayList<Sig_File> sigList(int ea_no);
	// 다음 결재자가 존재하는가
	Approval selectNextapprover(Approval ap);
	// 이전 결재자가 결재 했는가
	Approval selectPrevapprover(Approval curap);
	// 결재 최종 완료
	int EAupdateY(int ea_no);
	int PEAupdateY(int ea_no);
	// 현재 결자재 레벨 찾기
	Approval selectCurapprover(Approval ap);
	// 결재 완료 리스트
	ArrayList<Electronic_Approval> selectListComEA(int drafter ,PageInfo pi);
	// 결재 진행함 리스트
	ArrayList<Electronic_Approval> selecListPEA(int approver_no ,PageInfo pi);
	// 참조 리스트
	ArrayList<Electronic_Approval> selectListrefea(int re_no ,PageInfo pi);
	// 첫번째 결재자 결재 하였는가 
	Approval selectFirstApproval(int ea_no);
	// 회수하기
	int takeBack(int ea_no);
	// 결재 수정
	int updateEa(Electronic_Approval ea);
	// 결재 수정 페이지 이동
	Electronic_Approval updateEaPage(int ea_no);
	// 문서함 갯수 
	int countWp(int mno);
	int countCp(int mno);
	int countBp(int mno);
	int countR(int mno);
	int countT(int mno);
	int countC(int mno);
	int countB(int mno);
	int countProg(int approver_no);
	int countRef(int re_no);
	int selectRequestListCount(int drafter);
	int countformList();
	// 전자결재 메인 리스트(5개씩만 출력)
	ArrayList<Electronic_Approval> listWp(int mno);
	ArrayList<Electronic_Approval> listref(int mno);
	// 결재 로그
	ArrayList<Approval> approvalLog(int ea_no);
	// 재기안
	int retryEA(int ea_no);
	// 결재 기록 초기화
	int initialAPP(int ea_no);
	// 결재 삭제
	int deleteEA(int ea_no);
	// 결재자 최종 등록
	int insertApprover(Approval appro);
	// 참조자
	int insertRefer(Referrer refer);
	// 현재 로그인한 사용자 정보 ( 기안자 )
	Member selectdrafter(int mno);
	
	// 검색용 Count
	int EAsearchCount(Search search, int drafter);
	int TEAsearchCount(Search search, int drafter);
	int WEAsearchCount(Search search, int drafter);
	int PEAsearchCount(Search search, int drafter);
	int CEAsearchCount(Search search, int drafter);
	int BEAsearchCount(Search search, int drafter);
	int RFEAsearchCount(Search search, int drafter);
	// 검색용 리스트
	ArrayList<Electronic_Approval> TEAsearch(Search search, PageInfo pi);
	ArrayList<Electronic_Approval> WEAsearch(Search search, PageInfo pi);
	ArrayList<Electronic_Approval> PEAsearch(Search search, PageInfo pi);
	ArrayList<Electronic_Approval> CEAsearch(Search search, PageInfo pi);
	ArrayList<Electronic_Approval> BEAsearch(Search search, PageInfo pi);
	ArrayList<Electronic_Approval> RFEAsearch(Search search, PageInfo pi);
	// 서명 파일 등록
	int sigFileinsert(Files f);
	int siginsert(int mno);
	// 등록한 서명 파일 리스트 
	ArrayList<Sig_File> selectSigList(int mno);
	// sig파일 status N
	int sigN(int mno);
	// 결재 파일 등록
	int Fileinsert(Files f);
	// 결재시 파일 등록
	int apFileinsert(Files f);
	// 첨부파일 불러오기
	Files selectFile(int ea_no);
	// 서명 변경
	int sigUpdate(int sig_no);
	// 서명 삭제
	int delfiles(int sig_no);
	int delSig(int sig_no);
	// 사원명 조회
	ArrayList<Member> searchMname(String searchName);
	// 휴가 승인 완료
	int annupdateY(int ea_no);
	// 휴가 정보가져오기
	Annual selectAnn(int ea_no);
	//휴여 잔여 변여
	int amupdateY(Annual ann);
	
	
	
	
	






	

	
	
}
