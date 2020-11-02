package com.kh.hongk.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository("eaDao") //DB와 접근하는 클래스에 부여하는 어노테이션
public class EADao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 양식 추가
	public int formInsert(Form f) {
		return sqlSession.insert("eaMapper.formInsert",f);
	}
	// 양식 리스트 (기안문 작성)
	public ArrayList<Form> selectFormList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("eaMapper.selectFormList",null,rowBounds);
	}
	// 양식 선택
	public Form selectForm(int fid) {
		return sqlSession.selectOne("eaMapper.selectForm",fid);
	}
	// 임시 저장
	public int temeaform(Electronic_Approval ea) {
		return sqlSession.insert("eaMapper.temeaform",ea);
	}
	//전자결재 등록
	public int insertea(Electronic_Approval ea) {
		return sqlSession.insert("eaMapper.insertea",ea);
	}
	public int inserteaP(Project p) {
		return sqlSession.insert("projectMapper.inserteaP",p);
	}
	// 임시 저장함 리스트
	public ArrayList<Electronic_Approval> selectListTem(int drafter, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("eaMapper.selectListTem",drafter ,rowBounds);
	}
	// 결재 요청함
	public ArrayList<Electronic_Approval> selectListreq(int drafter ,PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("eaMapper.selectListreq",drafter,rowBounds);
	}
	// 결재 디테일 뷰
	public Electronic_Approval eadetail(int ea_no) {
		return sqlSession.selectOne("eaMapper.selectEAdetail",ea_no);
	}
	// 검색
	public ArrayList<Electronic_Approval> searchList(Search search) {
		return (ArrayList)sqlSession.selectList("eaMapper.searchList",search);
	}
	public ArrayList<Electronic_Approval> EAsearch(Search search ,PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("eaMapper.EAsearch",search,rowBounds);
	}
	// 조직도 조회
	public ArrayList<Member> approverList() {
		return (ArrayList)sqlSession.selectList("eaMapper.approverList");
	}

	public ArrayList<Member> deptList() {
		return (ArrayList)sqlSession.selectList("eaMapper.deptList");
	}
	// 결재자 선택
	public Member addapprover(int ap_no) {
		return sqlSession.selectOne("eaMapper.addapprover",ap_no);
	}
	// 결재 대기함 리스트
	public ArrayList<Electronic_Approval> selectListW(int mno, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return  (ArrayList)sqlSession.selectList("eaMapper.selectListW",mno ,rowBounds);
	}
	// 임시 저장 삭제
	public int teadelete(int ea_no) {
		return sqlSession.delete("eaMapper.teadelete",ea_no);
	}
	// 임시 저장 등록
	public int teaupdate(int ea_no) {
		return sqlSession.update("eaMapper.teaupdate",ea_no);
	}
	// 결재
	public int apInsert(Approval ap) {
		return  sqlSession.update("eaMapper.appro",ap);
	}
	// 결재 반려 처리 (ea_status = 'N')
	public int eaupdateN(int ea_no) {
		return sqlSession.update("eaMapper.eaupdateN",ea_no);
	}
	// 반려함
	public ArrayList<Electronic_Approval> selectREAList(int drafter, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("eaMapper.selectREAList",drafter ,rowBounds);
	}
	// 참조자 리스트
	public ArrayList<Referrer> reList(int ea_no) {
		return (ArrayList)sqlSession.selectList("eaMapper.reList",ea_no);
	}
	// 결재 기록
	public ArrayList<Approval> apList(int ea_no) {
		return (ArrayList)sqlSession.selectList("eaMapper.apList",ea_no);
	}
	public ArrayList<Sig_File> sigList(int ea_no) {
		return (ArrayList)sqlSession.selectList("eaMapper.sigList",ea_no);
	}
	
	// 다음 결재자가 존재하는가
	public Approval selectNextapprover(Approval ap) {
		return sqlSession.selectOne("eaMapper.selectNextapprover", ap);
	}
	// 이전 결재자가 결재 하였는가
	public Approval selectPrevapprover(Approval curap) {
		return sqlSession.selectOne("eaMapper.selectPrevapprover", curap);
	}
	// 결재 최종 완료
	public int EAupdateY(int ea_no) {
		return sqlSession.update("eaMapper.EAupdateY", ea_no);
	}
	public int PEAupdateY(int ea_no) {
		return sqlSession.update("projectMapper.PEAupdateY", ea_no);
	}
	// 현재 결자재 레벨 찾기
	public Approval selectCurapprover(Approval ap) {
		return sqlSession.selectOne("eaMapper.selectCurapprover", ap);
	}
	// 결재 완료 리스트
	public ArrayList<Electronic_Approval> selectListComEA(int drafter, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("eaMapper.selectListComEA",drafter ,rowBounds);
	}
	// 결재 진행함 리스트
	public ArrayList<Electronic_Approval> selecListPEA(int approver_no, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("eaMapper.selecListPEA",approver_no ,rowBounds);
	}
	// 참조 리스트
	public ArrayList<Electronic_Approval> selectListrefea(int re_no, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("eaMapper.selectListrefea",re_no ,rowBounds);
	}
	// 첫번째 결재자 결재 하였는가 
	public Approval selectFirstApproval(int ea_no) {
		return sqlSession.selectOne("eaMapper.selectFirstApproval", ea_no);
	}
	// 회수하기
	public int takeBack(int ea_no) {
		return sqlSession.update("eaMapper.takeBack", ea_no);
	}
	// 결재 수정하기
	public int updateEa(Electronic_Approval ea) {
		return sqlSession.update("eaMapper.updateEa",ea);
	}
	// 결재 수정 페이지 이동
	public Electronic_Approval updateEaPage(int ea_no) {
		return sqlSession.selectOne("eaMapper.updateEaPage", ea_no);
	}

	// 문서함 갯수 (COUNT)
	public int countWp(int mno) {
		return sqlSession.selectOne("eaMapper.countWp", mno);
	}
	public int countCp(int mno) {
		return sqlSession.selectOne("eaMapper.countCp", mno);
	}
	public int countBp(int mno) {
		return sqlSession.selectOne("eaMapper.countBp", mno);
	}
	public int countR(int mno) {
		return sqlSession.selectOne("eaMapper.countR", mno);
	}
	public int countT(int mno) {
		return sqlSession.selectOne("eaMapper.countT", mno);
	}
	public int countC(int mno) {
		return sqlSession.selectOne("eaMapper.countC", mno);
	}
	public int countB(int mno) {
		return sqlSession.selectOne("eaMapper.countB", mno);
	}
	public int countProg(int approver_no) {
		return sqlSession.selectOne("eaMapper.countProg", approver_no);
	}
	public int countRef(int re_no) {
		return sqlSession.selectOne("eaMapper.countRef", re_no);
	}
	public int countformList() {
		return sqlSession.selectOne("eaMapper.countformList");
	}
	// 결재 요청함 전체 글 수
	public int selectRequestListCount(int drafter) {
		return sqlSession.selectOne("eaMapper.selectRequestListCount", drafter);
	}
	// 전자결재 메인 리스트(5개씩만 출력)
	public ArrayList<Electronic_Approval> listWp(int mno) {
		return (ArrayList)sqlSession.selectList("eaMapper.listWp", mno);
	}
	public ArrayList<Electronic_Approval> listref(int mno) {
		return (ArrayList)sqlSession.selectList("eaMapper.listref", mno);
	}
	// 결재 로그
	public ArrayList<Approval> approvalLog(int ea_no) {
		return (ArrayList)sqlSession.selectList("eaMapper.approvalLog",ea_no);
	}
	// 재기안
	public int retryEA(int ea_no) {
		return sqlSession.update("eaMapper.retryEA",ea_no);
	}
	// 결재 삭제
	public int deleteEA(int ea_no) {
		return sqlSession.update("eaMapper.deleteEA",ea_no);
	}
	// 결재 기록 초기화
	public int initialAPP(int ea_no) {
		return sqlSession.update("eaMapper.initialAPP",ea_no);
	}
	// 결재자 최종 등록
	public int insertApprover(Approval appro) {
		return sqlSession.insert("eaMapper.insertApprover", appro);
	}
	// 참조자 등록
	public int insertRefer(Referrer refer) {
		return sqlSession.insert("eaMapper.insertRefer",refer);
	}
	// 현재 로그인한 사용자 정보 ( 기안자 )
	public Member selectdrafter(int mno) {
		return sqlSession.selectOne("eaMapper.selectdrafter",mno);
	}
	
	
	// 검색 용 COUNT
	public int EAsearchCount(Search search, int drafter) {
		search.setMno(drafter);
		 return sqlSession.selectOne("eaMapper.EAsearchCount",search);
	}
	public int TEAsearchCount(Search search, int drafter) {
		return sqlSession.selectOne("eaMapper.TEAsearchCount",search);
	}
	public int WEAsearchCount(Search search, int drafter) {
		return sqlSession.selectOne("eaMapper.WEAsearchCount",search);
	}
	public int PEAsearchCount(Search search, int drafter) {
		return sqlSession.selectOne("eaMapper.PEAsearchCount",search);
	}
	public int CEAsearchCount(Search search, int drafter) {
		return sqlSession.selectOne("eaMapper.CEAsearchCount",search);
	}
	public int BEAsearchCount(Search search, int drafter) {
		return sqlSession.selectOne("eaMapper.BEAsearchCount",search);
	}
	public int RFEAsearchCount(Search search, int drafter) {
		return sqlSession.selectOne("eaMapper.RFEAsearchCount",search);
	}
	// 검색 후 셀렉트
	public ArrayList<Electronic_Approval> TEAsearch(Search search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("eaMapper.TEAsearch",search,rowBounds);
	}
	public ArrayList<Electronic_Approval> WEAsearch(Search search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("eaMapper.WEAsearch",search,rowBounds);
	}
	public ArrayList<Electronic_Approval> PEAsearch(Search search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("eaMapper.PEAsearch",search,rowBounds);
	}
	public ArrayList<Electronic_Approval> CEAsearch(Search search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("eaMapper.CEAsearch",search,rowBounds);
	}
	public ArrayList<Electronic_Approval> BEAsearch(Search search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("eaMapper.BEAsearch",search,rowBounds);
	}
	public ArrayList<Electronic_Approval> RFEAsearch(Search search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("eaMapper.RFEAsearch",search,rowBounds);
	}
	// 서명 파일 등록
	public int sigFileinsert(Files f) {
		return sqlSession.insert("eaMapper.sigFileinsert",f);
	}
	public int siginsert(int mno) {
		return sqlSession.insert("eaMapper.siginsert",mno);
	}
	// 등록한 서명 파일 리스트
	public ArrayList<Sig_File> selectSigList(int mno) {
		return (ArrayList)sqlSession.selectList("eaMapper.selectSigList",mno);
	}
	// sig파일 status N
	public int sigN(int mno) {
		return sqlSession.update("eaMapper.sigN", mno);
	}
	// 결재 파일 등록
	public int Fileinsert(Files f) {
		return sqlSession.insert("eaMapper.Fileinsert", f);
	}
	// 결재시 파일 등록
	public int apFileinsert(Files f) {
		return sqlSession.insert("eaMapper.apFileinsert", f);
	}
	// 첨부 파일 불러오기
	public Files selectFile(int ea_no) {
		return sqlSession.selectOne("eaMapper.selectFile", ea_no);
	}
	// 서명 변경
	public int sigUpdate(int sig_no) {
		return sqlSession.update("eaMapper.sigUpdate", sig_no);
	}
	// 서명 삭제
	public int delfiles(int sig_no) {
		return sqlSession.delete("eaMapper.delfiles", sig_no);
	}
	public int delSig(int sig_no) {
		return sqlSession.delete("eaMapper.delSig", sig_no);
	}
	// 사원명 조회
		public ArrayList<Member> searchMname(String searchName) {
		return  (ArrayList)sqlSession.selectList("eaMapper.searchMname", searchName);
		}
	// 휴가 승인 완료
	public int annupdateY(int ea_no) {
		return sqlSession.update("eaMapper.annupdateY", ea_no);
	}
	// 휴가 정보 가져오기
	public Annual selectAnn(int ea_no) {
		return sqlSession.selectOne("annualMapper.selectAnn", ea_no);
	}
	// 휴가 잔여 변경
	public int amupdateY(Annual ann) {
		return sqlSession.update("annualMapper.amupdateY", ann);
	}
	
	
	


}
