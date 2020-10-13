package com.kh.hongk.project.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.service.ProjectService;

@Controller
public class ProjectController {
	@Autowired
	private ProjectService pService;
	
	private Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@RequestMapping("myProject.do")
	public String myProject() {
		return "project/myProject";
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
