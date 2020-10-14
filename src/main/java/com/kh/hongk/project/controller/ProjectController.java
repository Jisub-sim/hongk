package com.kh.hongk.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
			mv.setViewName("project/team/teamAdd");
		}
		return mv;
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

	@RequestMapping("proUpdate.do")
	public String projectUpdate() {
		return "project/projectUpdate";
	}
}
