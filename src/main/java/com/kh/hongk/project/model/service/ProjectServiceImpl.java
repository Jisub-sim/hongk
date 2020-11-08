package com.kh.hongk.project.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hongk.approval.model.vo.PageInfo;
import com.kh.hongk.member.model.vo.Files;
import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.dao.ProjectDao;
import com.kh.hongk.project.model.vo.Pmember;
import com.kh.hongk.project.model.vo.Project;
import com.kh.hongk.project.model.vo.Pteam;
import com.kh.hongk.project.model.vo.Reply;
import com.kh.hongk.project.model.vo.Request;
import com.kh.hongk.project.model.vo.Task;
import com.kh.hongk.project.model.vo.TrReply;

@Service("bService")
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	private ProjectDao pDao;
	
	@Override
	public ArrayList<Member> selectProjectMember(int pId) {		
		return pDao.selectProjectMember(pId);
	}

	@Override
	public ArrayList<Project> selectmyProject(int mNo) {
		return pDao.selectmyProject(mNo);
	}

	@Override
	public Project projectDetail(int pId) {
		return pDao.projectDetail(pId);
	}

	@Override
	public ArrayList<Pteam> selectTeamlist(int pId) {
		return pDao.selectTeamList(pId);
	}

	@Override
	public ArrayList<Member> selectTmemberlist(int ptId) {
		return pDao.selectTmemberlist(ptId);
	}

	@Override
	public int insertPteam(Pteam pt) {
		return pDao.insertPteam(pt);
	}

	@Override
	public ArrayList<Member> selectMember() {
		return pDao.selectMember();
	}

	@Override
	public int insertPMember(Project p) {
		return pDao.insertPMember(p);
	}

	@Override
	public int updatePMember(Pteam pt) {
		return pDao.updatePMember(pt);
	}

	@Override
	public Pteam selectPTeam(int ptId) {
		return pDao.selectPTeam(ptId);
	}

	@Override
	public int teamUpdate(Pteam pt) {
		return pDao.updateTeam(pt);
	}

	@Override
	public int deletePMember(Project deleteP) {
		return pDao.deletePMember(deleteP);
	}

	@Override
	public int deleteTeam(int ptId) {
		return pDao.deleteTeam(ptId);
	}

	@Override
	public int updateProgress(Project p) {
		return pDao.updateProgress(p);
	}

	@Override
	public Pmember selectMemberTeam(Pmember p) {
		return pDao.selectMemberTeam(p);
	}

	@Override
	public int insertTask(Task t) {
		return pDao.insertTask(t);
	}

	@Override
	public ArrayList<Task> selectTaskList(Pmember p) {
		return pDao.selectTaskList(p);
	}

	@Override
	public Task selectTask(int twId) {
		return pDao.selectTaskList(twId);
	}

	@Override
	public Member selectMemberOne(int twManager) {
		return pDao.selectMemberOne(twManager);
	}

	@Override
	public int updateManager(Task t) {
		return pDao.updateManager(t);
	}

	@Override
	public int insertFile(Files f) {
		return pDao.insertFile(f);
	}
	

	@Override
	public int fListCount(int twId) {
		return pDao.fListCount(twId);
	}

	@Override
	public ArrayList<Files> selectFileList(int twId, PageInfo pi) {
		return pDao.selectFileList(twId,pi);
	}

	@Override
	public int insertReply(Reply r) {
		return pDao.insertReply(r);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int twId) {
		return pDao.selectReplyList(twId);
	}

	@Override
	public int deleteReply(int wrId) {
		return pDao.deleteReply(wrId);
	}

	@Override
	public ArrayList selectTaskCount(int pId) {
		return pDao.selectTaskCount(pId);
	}

	@Override
	public ArrayList<Pteam> selectCompleteTask(int pId) {
		return pDao.selectCompleteTask(pId);
	}

	@Override
	public int twStatusUpdate(int twId) {
		return pDao.twStatusUpdate(twId);
	}

	@Override
	public ArrayList<Pteam> selectOtherTeam(Pmember pm) {
		return pDao.selectOtherTeam(pm);
	}

	@Override
	public int insertRequest(Request rq) {
		return pDao.insertRequest(rq);
	}
	
	@Override
	public ArrayList<Request> selectRequestList(int ptId) {
		return pDao.selectRequestList(ptId);
	}

	@Override
	public Request selectAsk(int trId) {
		return pDao.selectAsk(trId);
	}

	@Override
	public int updateRequestManager(Request rq) {
		return pDao.updateRequestManager(rq);
	}

	@Override
	public int insertTrReply(TrReply reply) {
		return pDao.insertTrReply(reply);
	}

	@Override
	public 	ArrayList<TrReply> selectTrlist(int trId) {
		return pDao.selectTrlist(trId);
	}

	@Override
	public int deleteRReply(int rrId) {
		return pDao.deleteRReply(rrId);
	}

	@Override
	public int insertAFile(Files f) {
		return pDao.insertAFile(f);
	}

	@Override
	public Files selectAskFile(int trId) {
		return pDao.selectAskFile(trId);
	}


}
