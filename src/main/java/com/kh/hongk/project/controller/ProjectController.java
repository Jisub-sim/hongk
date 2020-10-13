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
import com.kh.hongk.project.model.service.ProjectService;
import com.kh.hongk.project.model.vo.Project;

@Controller
public class ProjectController {
	@Autowired
	private ProjectService pService;
	
	private Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@RequestMapping("myProject.do")
	public ModelAndView myProject(ModelAndView mv, HttpServletRequest request ) {
		// 내가 관련된 프로젝트 가져오기 
		int mNo =((Member)request.getSession().getAttribute("loginUser")).getmNo();
		System.out.println("프로젝트 mNo : " + mNo);
		ArrayList<Project> list = pService.selectmyProject(mNo);
		System.out.println("list : " + list);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("project/myProject");
		}
		return mv;
	}
	
	@RequestMapping("project.do")
	public String projectList() {
		return "project/projectPage";
	}
	
	@RequestMapping("teamcare.do")
	public String teamCare() {
		return "project/team/teamCare";
	}
	@RequestMapping("teamadd.do")
	public String teamAdd() {
		//조직도 가져오기
		ArrayList<Member> m = pService.selectMemberList();
		
		return "project/team/teamAdd";
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
