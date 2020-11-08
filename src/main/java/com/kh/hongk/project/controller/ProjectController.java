package com.kh.hongk.project.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.exception.ProjectException;
import com.kh.hongk.project.model.service.ProjectService;
import com.kh.hongk.project.model.vo.Pmember;
import com.kh.hongk.project.model.vo.Project;
import com.kh.hongk.project.model.vo.Pteam;
import com.kh.hongk.project.model.vo.Task;

@Controller
public class ProjectController {
	@Autowired
	private ProjectService pService;

	private Logger logger = LoggerFactory.getLogger(ProjectController.class);

	@RequestMapping("myProject.do")
	public ModelAndView myProject(ModelAndView mv, HttpServletRequest request) {
		// 내가 관련된 프로젝트 가져오기
		int mNo = ((Member) request.getSession().getAttribute("loginUser")).getmNo();
		// System.out.println("프로젝트 mNo : " + mNo);
		ArrayList<Project> list = pService.selectmyProject(mNo);
		System.out.println("list : " + list);

		if (list != null) {
			mv.addObject("list", list);
			mv.setViewName("project/myProject");
		}
		return mv;
	}

	@RequestMapping("project.do")
	public ModelAndView projectDetail(int pId, ModelAndView mv,HttpServletRequest request) {
		// pId에 맞는 Project 정보 가져오기
		Project project = pService.projectDetail(pId);

		// pId에 맞는 pTeam 정보 가져오기
		ArrayList<Pteam> ptlist = pService.selectTeamlist(pId);
		// System.out.println("project : " + project);
		// System.out.println("pTeamList : " + ptlist);
		int mNo = ((Member) request.getSession().getAttribute("loginUser")).getmNo();
		Pmember p = new Pmember();
		p.setmNo(mNo);
		p.setpId(pId);
		ArrayList<Task> tl = pService.selectTaskList(p);
		
		System.out.println(tl);

		if (project != null) {
			mv.addObject("tl",tl);
			mv.addObject("p", project);
			mv.addObject("pt", ptlist);
			mv.setViewName("project/projectPage");
		} else {
			throw new ProjectException("프로젝트 상세조회에 실패하였습니다");
		}

		return mv;
	}

	@RequestMapping("teamcare.do")
	public ModelAndView teamCare(ModelAndView mv, int pId) {
		// System.out.println(pId);
		ArrayList<Pteam> ptlist = pService.selectTeamlist(pId);
		// 사원 직급/사원 명 리스트 가져오기
		if (ptlist != null) {
			for (int i = 0; i < ptlist.size(); i++) {
				int ptId = ptlist.get(i).getPtId();
				ArrayList<Member> list = (ArrayList<Member>) pService.selectTmemberlist(ptId);
				// System.out.println(list);
				String mL = "";
				for (int j = 0; j < list.size(); j++) {
					mL += list.get(j).getJobCode() + " " + list.get(j).getmName() + "<br>";
				}
				ptlist.get(i).setmList(mL);
			}
		}

		System.out.println(ptlist);

		mv.addObject("pId", pId);
		if (ptlist != null) {
			mv.addObject("pt", ptlist);
			mv.setViewName("project/team/teamCare");
		}
		return mv;
	}

	@RequestMapping("teamadd.do")
	public ModelAndView teamAdd(int pId, ModelAndView mv) {
		// 프로젝트 MEMBER 조직도 가져오기
		System.out.println(pId);
		ArrayList<Member> m = pService.selectProjectMember(pId);
		System.out.println(m);
		if (m != null) {
			mv.addObject("m", m);
			mv.addObject("pId", pId);
			mv.setViewName("project/team/teamAdd");
		}
		return mv;
	}

	@RequestMapping("teaminsert.do")
	public String teamInsert(Pteam pt, @RequestParam(name = "memberList", required = false) String memberList,
			HttpServletRequest request) {
		List<String> TmList = Arrays.asList(memberList.split(","));
		List<Integer> mList = new ArrayList<Integer>();
		for (String s : TmList) {
			mList.add(Integer.valueOf(s));
		}

		pt.setTmList(TmList);
		System.out.println(pt);
		int result = pService.insertPteam(pt);// team 생성
		int update = 0;
		if (result > 0) {
			update = pService.updatePMember(pt);
		}
		if (update > 0) {
			return "redirect:teamcare.do?pId=" + pt.getpId();
		} else {
			throw new ProjectException("xx");
		}

	}


	@RequestMapping("askadd.do")
	public String askAdd() {
		return "project/ask/askAdd";
	}

	@RequestMapping("progress.do")
	public ModelAndView progressUpdate(int pId,ModelAndView mv) {
		if(pId >0) {
			
			mv.addObject("pId",pId);
			mv.setViewName("project/popup/progressUpdate");
		}
		
		return mv;
	}

	@RequestMapping("proUpdateFrom.do")
	public ModelAndView projectUpdateForm(int pId, ModelAndView mv) {
		// 프로젝트 MEMBER 조직도 가져오기
		System.out.println(pId);
		ArrayList<Member> m = pService.selectMember();
		System.out.println("update Member " + m);
		ArrayList<Member> pm = pService.selectProjectMember(pId);
		Project project = pService.projectDetail(pId);
		System.out.println("update Project " + project);
		System.out.println("update ProjectMember " + pm);

		if (m != null && project != null) {
			mv.addObject("pm", pm);
			mv.addObject("m", m);
			mv.addObject("pId", pId);
			mv.addObject("p", project);
			mv.setViewName("project/projectUpdate");
		}
		return mv;
	}

	@RequestMapping("proUpdate.do")
	public String proUpdate(Project p, @RequestParam(name = "memberList", required = false) String memberList,
			HttpServletRequest request) {
		List<String> mlist = new ArrayList<>(Arrays.asList(memberList.split(",")));
		System.out.println("new List : " + mlist);
		List<Integer> mList = new ArrayList<Integer>();
		int pId = p.getpId();
		// 기존 인원 가져오기
		ArrayList<Member> m = pService.selectProjectMember(pId);
		List<String> originList = new ArrayList<String>();
		for (Member m1 : m) {
			originList.add(Integer.toString(m1.getmNo()));
		}
		System.out.println("originMember : " + originList);
		List<String> deleteList = new ArrayList<String>();
		List<String> mmList = new ArrayList<String>();
		List<Integer> dList = new ArrayList<Integer>();
		// 기존 인원과 새로 들어온 인원 비교
		Iterator iter = originList.iterator();
		while (iter.hasNext()) {
			String index = (String) iter.next();

			if (mlist.contains(index) == false) {
				deleteList.add(index);
			}
		}

		Iterator iter2 = mlist.iterator();
		while (iter2.hasNext()) {
			String index = (String) iter2.next();

			if (originList.contains(index) == false) {
				mmList.add(index);
			}
		}

		for (String s : mmList) {
			mList.add(Integer.valueOf(s));
		}

		for (String s : deleteList) {
			dList.add(Integer.valueOf(s));
		}
		System.out.println(dList);
		System.out.println(mList);
		Project dP = new Project();
		if(!dList.isEmpty()) {
			dP.setmList(dList);
			dP.setpId(p.getpId());
		}
		if(!mList.isEmpty()) {
			p.setmList(mList);			
		}

		System.out.println("a newList : " + p);
		System.out.println("dList : " + dP);
		int result1 = 1;
		// 기존 인원 삭제
		if (!dList.isEmpty()) {
			result1 = pService.deletePMember(dP);
		}
		int result = 1;
		// 새로운 인원 추가
		if (!mList.isEmpty()) {
			result = pService.insertPMember(p);
		}
		if (result > 0 && result1 > 0) {
			return "redirect:project.do?pId=" + p.getpId();

		} else {
			throw new ProjectException("xx");
		}

	}

	@RequestMapping("teamUpdateForm.do")
	public ModelAndView teamUpdateForm(int ptId, ModelAndView mv) {
		System.out.println(ptId);
		Pteam pt = pService.selectPTeam(ptId);
		int pId = pt.getpId();
		System.out.println("updateform pt : " + pt);
		// project에 맞는 사원 list 가져오기
		ArrayList<Member> m = pService.selectProjectMember(pId);
		System.out.println(m);
		// ptId에 맞는 사원 list 가져오기
		ArrayList<Member> pm = (ArrayList<Member>) pService.selectTmemberlist(ptId);
		System.out.println("udf Member list : " + pm);

		if (m != null && m != null) {
			mv.addObject("pm", pm);
			mv.addObject("m", m);
			mv.addObject("pId", pId);
			mv.addObject("pt", pt);
			mv.setViewName("project/team/teamUpdate");
		}

		return mv;

	}

	@RequestMapping("teamUpdate.do")
	public String teamUpdate(Pteam pt,RedirectAttributes rd, @RequestParam(name = "memberList", required = false) String memberList,
			HttpServletRequest request) {
		List<String> TmList = Arrays.asList(memberList.split(","));
		List<Integer> mList = new ArrayList<Integer>();
		for (String s : TmList) {
			mList.add(Integer.valueOf(s));
		}
		pt.setTmList(TmList);
		System.out.println("update pt : " + pt);
		ArrayList<Pmember> pm =(ArrayList)pService.selectTmemberlist(pt.getPtId());
		if(pm.isEmpty()) {
			pt.setPtStatus("N");
		}
		int result = pService.teamUpdate(pt);
		if (result > 0) {
			rd.addFlashAttribute("msg","팀을 수정하였습니다.");

		} else {
			rd.addFlashAttribute("msg", "팀 수정 실패");
		}

		return "redirect:teamcare.do?pId=" + pt.getpId();
	}
	
	@RequestMapping("deleteTeam.do")
	public String deleteTeam(int ptId, int pId,RedirectAttributes rd) {
		int result = pService.deleteTeam(ptId);
		if(result>0) {
			rd.addFlashAttribute("msg", "삭제 되었습니다.");
			return "redirect:teamcare.do?pId=" +pId;
		}else {
			throw new ProjectException("팀 삭제에 실패하였습니다"); 
		}
	}
	@RequestMapping("progressUpdate.do")
	public String progressUpdate(String progress,int pId) {
		System.out.println(progress);
		System.out.println(pId);
		Project p = new Project();
		p.setProgress(progress);
		p.setpId(pId);
		int result = pService.updateProgress(p);
		if(result>0)
			return "redirect:project.do?pId="+pId;
		else 
			throw new ProjectException("진행상태 변경에 실패하였습니다.");
	}
	
	
	//----------------- task--------------------------
	

	@RequestMapping("taskaddForm.do")
	public ModelAndView taskAddFrom(ModelAndView mv,HttpServletRequest request,int pId) {
		// 내가 관련된 프로젝트 가져오기
		int mNo = ((Member) request.getSession().getAttribute("loginUser")).getmNo();
		System.out.println("taskAdd mNo : " + mNo);
		Pmember p = new Pmember();
		p.setmNo(mNo);
		p.setpId(pId);
		Pmember pm = pService.selectMemberTeam(p);
		int ptId = pm.getPtId();
		
		// ptId에 맞는 조직도 가져오기
		ArrayList<Member> pmList = pService.selectTmemberlist(ptId);  
		System.out.println(pmList);
		if(!pmList.isEmpty()) {
			mv.addObject("pmList", pmList);
			mv.addObject("pm",pm);
			mv.addObject("pId",pId);
			mv.addObject("ptId",ptId);
			mv.setViewName("project/task/taskAdd");			
		}else {
			throw new ProjectException("업무 등록창 조회에 실패하였습니다.");
		}
		return mv;
		
		
	}
	@RequestMapping("taskadd.do")
	public String taskAdd(Task t,HttpServletRequest request,int pId) {
		int mNo = ((Member) request.getSession().getAttribute("loginUser")).getmNo();
		t.setTwWriter(mNo);
		System.out.println(t);
		
		int result = pService.insertTask(t);
		
		if(result>0) {
			return "redirect:project.do?pId="+pId;
		}else {
			throw new ProjectException("업무 등록에 실패하였습니다");
		}
	}

	@RequestMapping("taskclick.do")

	public String taskClick() {
		return "project/task/taskClick";
	}
	
}
 