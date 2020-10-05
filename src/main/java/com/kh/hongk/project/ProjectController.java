package com.kh.hongk.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectController {
	
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
		return"project/popup/progressUpdate";
	}

}
