package com.kh.hongk.project.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hongk.approval.model.vo.PageInfo;
import com.kh.hongk.member.model.vo.Files;
import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.vo.Pmember;
import com.kh.hongk.project.model.vo.Project;
import com.kh.hongk.project.model.vo.Pteam;
import com.kh.hongk.project.model.vo.Reply;
import com.kh.hongk.project.model.vo.Request;
import com.kh.hongk.project.model.vo.Task;
import com.kh.hongk.project.model.vo.TrReply;

@Repository("pDao")
public class ProjectDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectProjectMember(int pId) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectProjectMember",pId);
	}

	public ArrayList<Project> selectmyProject(int mNo) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectmyProject", mNo);
	}

	public Project projectDetail(int pId) {
		return sqlSession.selectOne("projectMapper.projectDetail",pId);
	}

	public ArrayList<Pteam> selectTeamList(int pId) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectTeamList",pId);
	}

	public ArrayList<Member> selectTmemberlist(int ptId) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectTmember",ptId);
	}

	public int insertPteam(Pteam pt) {
		return sqlSession.insert("projectMapper.insertPteam",pt);
	}

	public ArrayList<Member> selectMember() {
		return (ArrayList)sqlSession.selectList("projectMapper.selectMember");
	}

	public int insertPMember(Project p) {	
		return sqlSession.insert("projectMapper.insertPMember",p);
	}

	public int updatePMember(Pteam pt) {
		int count = 0;
		for(int i =0; i<pt.getTmList().size();i++) {
			int num = Integer.parseInt(pt.getTmList().get(i).toString());
			System.out.println(num);
			pt.settCount(num);
			System.out.println(pt);
			if(num == 0)
				count++;
			if(num  > 996) {
				if(num == 997)
					pt.setmList("D3");
				if(num == 998)
					pt.setmList("D2");
				if(num ==999)
					pt.setmList("D3");
				int result = sqlSession.update("projectMapper.updatePDMember",pt);
				if(result>0)
				count++;
			}
			if(num <996){
				int result = sqlSession.update("projectMapper.updatePMember",pt);
				if(result>0)
				count++;
			}
		}
		System.out.println(count);
		System.out.println(pt.getTmList().size());
		if(count == pt.getTmList().size())
			return 1;
		else
			return 0;
	}

	public Pteam selectPTeam(int ptId) {
		return sqlSession.selectOne("projectMapper.selectPTeam", ptId);
	}

	public int updateTeam(Pteam pt) {
		// 기존 인원들 제거 
		int ptId = pt.getPtId();
		int result1=0;
		int result=1;
		System.out.println(ptId);
		if(!pt.getPtStatus().equals("N")) {
		  result = sqlSession.update("projectMapper.deleteTMember",ptId);
		}
		// 새로운 인원 update
		if(result >0) {
			result1 = sqlSession.update("projectMapper.updateTMember",pt);
		}			
	
		return result1;
	}

	public int deletePMember(Project p) {
		return sqlSession.update("projectMapper.deletePMember",p);
	}

	public int deleteTeam(int ptId) {
		return sqlSession.update("projectMapper.deleteTeam",ptId);
	}

	public int updateProgress(Project p) {
		return sqlSession.update("projectMapper.updateProgress",p);
	}

	public Pmember selectMemberTeam(Pmember p) {
		return sqlSession.selectOne("projectMapper.selectMemberTeam", p);
	}

	public int insertTask(Task t) {
		return sqlSession.insert("projectMapper.insertTask",t);
	}

	public ArrayList<Task> selectTaskList(Pmember p) {
		ArrayList<Task> t = (ArrayList)sqlSession.selectList("projectMapper.selectTaskList",p);
		for(int i =0; i< t.size(); i++) {
			int m = t.get(i).getTwWriter();
			Member m2 = sqlSession.selectOne("projectMapper.selectWriter",m);
			t.get(i).setWriter(m2.getmName());
			
		}
		for(int i =0; i< t.size(); i++) {
			int m = t.get(i).getTwManager();
			if(m>0) {
			Member manager = sqlSession.selectOne("projectMapper.selectWriter",m);
			t.get(i).setManager(manager.getmName());
			}
		}

	 	return t;
	}

	public Task selectTaskList(int twId) {
		return sqlSession.selectOne("projectMapper.selectTask",twId);
	}

	public Member selectMemberOne(int m) {
		return sqlSession.selectOne("projectMapper.selectWriter",m);
	}

	public int updateManager(Task t) {
		return sqlSession.update("projectMapper.updateManager",t);
	}

	public int insertFile(Files f) {
		return sqlSession.insert("projectMapper.insertFile",f);
	}

	public ArrayList<Files> selectFileList(int twId,PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("projectMapper.selectFileList",twId,rowBounds);
	}

	public int fListCount(int twId) {
		return sqlSession.selectOne("projectMapper.fListCount", twId);
	}

	public int insertReply(Reply r) {
		return sqlSession.insert("projectMapper.insertReply",r);
	}

	public ArrayList<Reply> selectReplyList(int twId) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectReplyList",twId);
	}

	public int deleteReply(int wrId) {
		return sqlSession.update("projectMapper.deleteReply",wrId);
	}

	public ArrayList selectTaskCount(int pId) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectTaskCount",pId);
	}

	public ArrayList<Pteam> selectCompleteTask(int pId) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectCompleteTask",pId);
	}

	public int twStatusUpdate(int twId) {
		return sqlSession.update("projectMapper.twStatusUpdate",twId);
	}

	public ArrayList<Pteam> selectOtherTeam(Pmember pm) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectOtherTeam",pm);
	}

	public int insertRequest(Request rq) {
		return sqlSession.insert("projectMapper.insertRequest",rq);
	}

	public Pmember selectPtId(int mNo) {
		return sqlSession.selectOne("projectMapper.selectPtId",mNo);
	}

	public ArrayList<Request> selectRequestList(int ptId) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectRequestList",ptId);
	}

	public Request selectAsk(int trId) {
		return sqlSession.selectOne("projectMapper.selectAsk",trId);
	}

	public int updateRequestManager(Request rq) {
		return sqlSession.update("projectMapper.updateRequestManager",rq);
	}

	public int insertTrReply(TrReply reply) {
		return sqlSession.insert("projectMapper.insertTrReply",reply);
	}

	public 	ArrayList<TrReply> selectTrlist(int trId) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectTrlist",trId);
	}

	public int deleteRReply(int rrId) {
		return sqlSession.update("projectMapper.deleteRReply",rrId);
	}

	public int insertAFile(Files f) {
		return sqlSession.insert("projectMapper.insertAFile",f);
	}

	public Files selectAskFile(int trId) {
		return sqlSession.selectOne("projectMapper.selectAskFile",trId);
	}

	public ArrayList<Project> selectProjectMain(int mNo) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectProjectMain",mNo);
	}
	
	

}
