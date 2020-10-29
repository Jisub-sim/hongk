package com.kh.hongk.project.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.exception.ProjectException;
import com.kh.hongk.project.model.service.ProjectService;
import com.kh.hongk.project.model.vo.Project;
import com.kh.hongk.project.model.vo.Pteam;

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
	public ModelAndView projectDetail(int pId, ModelAndView mv) {
		// pId에 맞는 Project 정보 가져오기
		Project project = pService.projectDetail(pId);

		// pId에 맞는 pTeam 정보 가져오기
		ArrayList<Pteam> ptlist = pService.selectTeamlist(pId);
		// System.out.println("project : " + project);
		// System.out.println("pTeamList : " + ptlist);

		if (project != null) {
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
		
		mv.addObject("pId",pId);
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
		if(m != null) {
			mv.addObject("m",m);
			mv.addObject("pId", pId);
			mv.setViewName("project/team/teamAdd");
		}
		return mv;
	}
	@RequestMapping("teaminsert.do")
	public String teamInsert(Pteam pt,
			@RequestParam(name="memberList", required=false) String memberList,HttpServletRequest request) {
		List<String> TmList = Arrays.asList(memberList.split(","));
		List<Integer> mList = new ArrayList<Integer>();
		for(String s : TmList) {
			mList.add(Integer.valueOf(s));
		}

		pt.setTmList(TmList);
		System.out.println(pt);
		int result = pService.insertPteam(pt);// team 생성
		int update = 0;
		if(result>0) {
			update = pService.updatePMember(pt);
		}
		if(update>0) {
			return "redirect:teamcare.do?pId="+pt.getpId();
		}else {
			throw new ProjectException("xx");
		}
		
	}

	@RequestMapping("taskadd.do")
	public String taskAdd() {
		return "project/task/taskAdd";
	}

	@RequestMapping("taskclick.do")

	public String taskClick() {
		return "project/task/taskClick";
	}

	@RequestMapping("askadd.do")
	public String askAdd() {
		return "project/ask/askAdd";
	}

	@RequestMapping("progress.do")
	public String progressUpdate() {
		return "project/popup/progressUpdate";
	}

	@RequestMapping("proUpdateFrom.do")
	public ModelAndView projectUpdateForm(int pId,ModelAndView mv) {
		// 프로젝트 MEMBER 조직도 가져오기
		System.out.println(pId);
		ArrayList<Member> m = pService.selectMember();
		System.out.println("update Member " + m);
		ArrayList<Member> pm = pService.selectProjectMember(pId);
		Project project = pService.projectDetail(pId);
		System.out.println("update Project " + project);
		System.out.println("update ProjectMember " + pm);

			
		
		
		if(m != null && project != null) {
			mv.addObject("pm",pm);
			mv.addObject("m",m);
			mv.addObject("pId", pId);
			mv.addObject("p",project);
			mv.setViewName("project/projectUpdate");
		}
		return mv;
	}
	
	@RequestMapping("proUpdate.do")
	public String proUpdate(Project p,
			@RequestParam(name="memberList", required=false) String memberList,HttpServletRequest request) {
		List<String> mlist = Arrays.asList(memberList.split(","));
		System.out.println(mlist);
		List<Integer> mList = new ArrayList<Integer>();
		for(String s : mlist) {
			mList.add(Integer.valueOf(s));
		}

			
		p.setmList(mList);
		System.out.println(p.getmList());
		int result = pService.insertPMember(p);
		
		if(result >0) {
			return "redirect:project.do?pId="+p.getpId();
					
		}else {
			throw new ProjectException("xx");
		}
		

	}
}
