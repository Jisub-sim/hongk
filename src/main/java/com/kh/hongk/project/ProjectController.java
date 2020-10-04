package com.kh.hongk.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectController {
	
	@RequestMapping("project.do")
	public String projectList() {
		return "project/projectPage";
	}

}
