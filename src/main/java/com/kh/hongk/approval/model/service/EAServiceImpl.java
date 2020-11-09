package com.kh.hongk.approval.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hongk.annual.model.vo.Annual;
import com.kh.hongk.approval.model.dao.EADao;
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
import com.kh.hongk.work.model.vo.Work;

@Service("EAService")
public class EAServiceImpl implements EAService {
	@Autowired
	private EADao eaDao;
	
	// 양식 추가
	@Override
	public int formInsert(Form f) {
		return eaDao.formInsert(f);
	}
//////// 양식 리스트 (기안문 작성)
	@Override
	public ArrayList<Form> selectFormList(PageInfo pi) {
		return eaDao.selectFormList(pi);
	}
//////// 양식 선택(디테일)
	@Override
	public Form selectForm(int fid) {
		return eaDao.selectForm(fid);
	}
	// 임시저장
	@Override
	public int temeaform(Electronic_Approval ea) {
		return eaDao.temeaform(ea);
	}
	// 전자결재 등록
	@Override
	public int insertea(Electronic_Approval ea) {
		return eaDao.insertea(ea);
	}
	@Override
	public int inserteaP(Project p) {
		return eaDao.inserteaP(p);
	}
//////// 임시 저장함 리스트
	@Override
	public ArrayList<Electronic_Approval> selectListTem(int drafter ,PageInfo pi) {
		return eaDao.selectListTem(drafter, pi);
	}
//////// 결재 요청함
	@Override
	public ArrayList<Electronic_Approval> selectListreq(int drafter ,PageInfo pi) {
		return eaDao.selectListreq(drafter, pi);
	}
//////// 결재 디테일 뷰
	@Override
	public Electronic_Approval eadetail(int ea_no) {
		return eaDao.eadetail(ea_no);
	}
	// 검색
	@Override
	public ArrayList<Electronic_Approval> searchList(Search search) {
		return eaDao.searchList(search);
	}
	@Override
	public ArrayList<Electronic_Approval> EAsearch(Search search ,PageInfo pi) {
		return eaDao.EAsearch(search, pi);
	}
	// 조직도 조회
	@Override
	public ArrayList<Member> approverList() {
		return eaDao.approverList();
	}
	@Override
	public ArrayList<Member> deptList() {
		return eaDao.deptList();
	}
	// 결재자 선택
	@Override
	public Member addapprover(int ap_no) {
		return eaDao.addapprover(ap_no);
	}
//////// 결재 대기함 리스트
	@Override
	public ArrayList<Electronic_Approval> selectListW(int mno,PageInfo pi) {
		return eaDao.selectListW(mno, pi);
	}
	// 임시 저장 삭제
	@Override
	public int taedelete(int ea_no) {
		return eaDao.teadelete(ea_no);
	}
	// 임시 저장 등록
	@Override
	public int teaupdate(int ea_no) {
		return eaDao.teaupdate(ea_no);
	}
	// 결재
	@Override
	public int apInsert(Approval ap) {
		return eaDao.apInsert(ap);
	}
	// 결재 반려 처리 (ea_status = 'N')
	@Override
	public int eaupdateN(int ea_no) {
		return eaDao.eaupdateN(ea_no);
	}
//////// 반려 함
	@Override
	public ArrayList<Electronic_Approval> selectREAList(int drafter,PageInfo pi) {
		return eaDao.selectREAList(drafter, pi );
	}
	// 참조자 리스트
	@Override
	public ArrayList<Referrer> reList(int ea_no) {
		return eaDao.reList(ea_no);
	}
	// 결재기록
	@Override
	public ArrayList<Approval> apList(int ea_no) {
		return eaDao.apList(ea_no);
	}
	@Override
	public ArrayList<Sig_File> sigList(int ea_no) {
		return eaDao.sigList(ea_no);
	}
	// 다음 결재자가 존재하는가
	@Override
	public Approval selectNextapprover(Approval ap) {
		return eaDao.selectNextapprover(ap);
	}
	// 이전 결재자가 결재 하였는가
	@Override
	public Approval selectPrevapprover(Approval curap) {
		return eaDao.selectPrevapprover(curap);
	}
	// 결재 최종 완료
	@Override
	public int EAupdateY(int ea_no) {
		return eaDao.EAupdateY(ea_no);
	}
	@Override
	public int PEAupdateY(int ea_no) {
		return eaDao.PEAupdateY(ea_no);
	}
	// 현재 결자재 레벨 찾기
	@Override
	public Approval selectCurapprover(Approval ap) {
		return eaDao.selectCurapprover(ap);
	}
//////// 결재 완료 리스트
	@Override
	public ArrayList<Electronic_Approval> selectListComEA(int drafter ,PageInfo pi) {
		return eaDao.selectListComEA(drafter,pi);
	}
//////// 결재 진행함 리스트
	@Override
	public ArrayList<Electronic_Approval> selecListPEA(int approver_no ,PageInfo pi) {
		return eaDao.selecListPEA(approver_no, pi);
	}
//////// 참조 리스트
	@Override
	public ArrayList<Electronic_Approval> selectListrefea(int re_no ,PageInfo pi) {
		return eaDao.selectListrefea(re_no, pi);
	}
	// 첫번째 결재자 결재 하였는가 
	@Override
	public Approval selectFirstApproval(int ea_no) {
		return eaDao.selectFirstApproval(ea_no);
	}
	// 회수하기
	@Override
	public int takeBack(int ea_no) {
		return eaDao.takeBack(ea_no);
	}
	// 결재 수정하기
	@Override
	public int updateEa(Electronic_Approval ea) {
		return eaDao.updateEa(ea);
	}
	// 결재 수정 페이지 이동
	@Override
	public Electronic_Approval updateEaPage(int ea_no) {
		return eaDao.updateEaPage(ea_no);
	}
	
	// 문서함 갯수 COUNT
	@Override
	public int countWp(int mno) {
		return eaDao.countWp(mno);
	}
	@Override
	public int countCp(int mno) {
		return eaDao.countCp(mno);
	}
	@Override
	public int countBp(int mno) {
		return eaDao.countBp(mno);
	}
	@Override
	public int countR(int mno) {
		return eaDao.countR(mno);
	}
	@Override
	public int countT(int mno) {
		return eaDao.countT(mno);
	}
	@Override
	public int countC(int mno) {
		return eaDao.countC(mno);
	}
	@Override
	public int countB(int mno) {
		return eaDao.countB(mno);
	}
	@Override
	public int countProg(int approver_no) {
		return eaDao.countProg(approver_no);
	}
	@Override
	public int countRef(int re_no) {
		return eaDao.countRef(re_no);
	}
	@Override
	public int countformList() {
		return eaDao.countformList();
	}
	// 요청함 전체 글 수
	@Override
	public int selectRequestListCount(int drafter) {
		return eaDao.selectRequestListCount(drafter);
	}
	// 전자결재 메인 리스트(5개씩만 출력)
	@Override
	public ArrayList<Electronic_Approval> listWp(int mno) {
		return  eaDao.listWp(mno);
	}
	@Override
	public ArrayList<Electronic_Approval> listref(int mno) {
		return  eaDao.listref(mno);
	}
	// 결재 로그
	@Override
	public ArrayList<Approval> approvalLog(int ea_no) {
		return eaDao.approvalLog(ea_no);
	}
	// 재기안
	@Override
	public int retryEA(int ea_no) {
		return eaDao.retryEA(ea_no);
	}
	// 결재 삭제
	@Override
	public int deleteEA(int ea_no) {
		return eaDao.deleteEA(ea_no);
	}
	// 결재 기록 초기화
	@Override
	public int initialAPP(int ea_no) {
		return eaDao.initialAPP(ea_no);
	}
	// 결재자 최종 등록
	@Override
	public int insertApprover(Approval appro) {
		return eaDao.insertApprover(appro);
	}
	@Override
	public int insertRefer(Referrer refer) {
		return eaDao.insertRefer(refer);
	}
	// 현재 로그인한 사용자 정보 ( 기안자 )
	@Override
	public Member selectdrafter(int mno) {
		return eaDao.selectdrafter(mno);
	}
	
	
	// 검색 용 Count
	@Override
	public int EAsearchCount(Search search, int drafter) {
		 return eaDao.EAsearchCount(search,drafter );
	}
	@Override
	public int TEAsearchCount(Search search, int drafter) {
		return eaDao.TEAsearchCount(search,drafter );
	}
	@Override
	public int WEAsearchCount(Search search, int drafter) {
		return eaDao.WEAsearchCount(search,drafter );
	}
	@Override
	public int PEAsearchCount(Search search, int drafter) {
		return eaDao.PEAsearchCount(search,drafter );
	}
	@Override
	public int CEAsearchCount(Search search, int drafter) {
		return eaDao.CEAsearchCount(search,drafter );
	}
	@Override
	public int BEAsearchCount(Search search, int drafter) {
		return eaDao.BEAsearchCount(search,drafter );
	}
	@Override
	public int RFEAsearchCount(Search search, int drafter) {
		return eaDao.RFEAsearchCount(search,drafter );
	}
	// 검색 후 셀렉트
	@Override
	public ArrayList<Electronic_Approval> TEAsearch(Search search, PageInfo pi) {
		return eaDao.TEAsearch(search,pi);
	}
	@Override
	public ArrayList<Electronic_Approval> WEAsearch(Search search, PageInfo pi) {
		return eaDao.WEAsearch(search,pi);
	}
	@Override
	public ArrayList<Electronic_Approval> PEAsearch(Search search, PageInfo pi) {
		return eaDao.PEAsearch(search,pi);
	}
	@Override
	public ArrayList<Electronic_Approval> CEAsearch(Search search, PageInfo pi) {
		return eaDao.CEAsearch(search,pi);
	}
	@Override
	public ArrayList<Electronic_Approval> BEAsearch(Search search, PageInfo pi) {
		return eaDao.BEAsearch(search,pi);
	}
	@Override
	public ArrayList<Electronic_Approval> RFEAsearch(Search search, PageInfo pi) {
		return eaDao.RFEAsearch(search,pi);
	}
	// 서명 파일 등록
	@Override
	public int sigFileinsert(Files f) {
		return eaDao.sigFileinsert(f);
	}
	@Override
	public int siginsert(int mno) {
		return eaDao.siginsert(mno);
	}
	// 등록한 서명 파일 리스트
	@Override
	public ArrayList<Sig_File> selectSigList(int mno) {
		return eaDao.selectSigList(mno);
	}
	// sig파일 status N
	@Override
	public int sigN(int mno) {
		return eaDao.sigN(mno);
	}
	// 결재 파일 등록
	@Override
	public int Fileinsert(Files f) {
		return eaDao.Fileinsert(f);
	}
	// 결재시 파일 등록
	@Override
	public int apFileinsert(Files f) {
		return eaDao.apFileinsert(f);
	}
	// 첨부파일 불러오기
	@Override
	public Files selectFile(int ea_no) {
		return eaDao.selectFile(ea_no);
	}
	// 서명 변경
	@Override
	public int sigUpdate(int sig_no) {
		return eaDao.sigUpdate(sig_no);
	}
	// 서명삭제
	@Override
	public int delfiles(int sig_no) {
		return eaDao.delfiles(sig_no);
	}
	@Override
	public int delSig(int sig_no) {
		return eaDao.delSig(sig_no);
	}
	// 사원명 조회
	@Override
	public ArrayList<Member> searchMname(String searchName) {
		return eaDao.searchMname(searchName);
	}
	// 휴가 승인 완료
	@Override
	public int annupdateY(int ea_no) {
		return eaDao.annupdateY(ea_no);
	}
	// 휴가정보 가져오기
	@Override
	public Annual selectAnn(int ea_no) {
		return eaDao.selectAnn(ea_no);
	}
	@Override
	public int amupdateY(Annual ann) {
		return eaDao.amupdateY(ann);
	}
	@Override
	public int wkupdateY(int ea_no) {
	   return eaDao.wkupdateY(ea_no);
	 }
	@Override
	 public Work selectwk(int ea_no) {
	    return eaDao.selectwk(ea_no);
	}
	@Override
	public int updatewkend(Work wk) {
		return eaDao.updatewkend(wk);
	}
	
	


	
	
	


	
	
	
	

}
