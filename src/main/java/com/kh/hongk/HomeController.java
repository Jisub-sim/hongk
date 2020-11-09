package com.kh.hongk;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hongk.approval.model.service.EAService;
import com.kh.hongk.approval.model.vo.Electronic_Approval;
import com.kh.hongk.approval.model.vo.PageInfo;
import com.kh.hongk.board.model.service.BoardService;
import com.kh.hongk.board.model.vo.Board;
import com.kh.hongk.board.model.vo.Pagination;
import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.service.ProjectService;
import com.kh.hongk.project.model.vo.Project;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	private ProjectService pService;
	@Autowired
	private EAService eaService;
	@Autowired
	private BoardService bService;
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model, HttpServletRequest request,ModelAndView mv,Integer page) {
		int mNo = ((Member) request.getSession().getAttribute("loginUser")).getmNo();
		
		//System.out.println(mNo);
		
		int listCount = bService.selectListCount();

		int currentPage = page != null ? page : 1;
		
		PageInfo pi =  Pagination.getPageInfo(currentPage, listCount, 10, 10);
		
		ArrayList<Electronic_Approval> listWp = eaService.listWp(mNo);
		
		ArrayList<Project> list = pService.selectmyProjectMain(mNo);
		
		ArrayList<Board> boardlist = bService.selectList(pi);
		System.out.println("boardlist : "  + boardlist);		
		SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd");
		int manager = 0;
		String mName = "";
		for(int i = 0; i<list.size();i++) {
			list.get(i).setDateString(format.format(list.get(i).getDeadLine())); 
			manager = list.get(i).getManager();
			Member m = pService.selectMemberOne(mNo);
			list.get(i).setmName(m.getmName());
		}
		System.out.println("list : " + list);
		
		if (list != null) {
			mv.addObject("plist", list);
		}
		if(listWp!= null) {
			mv.addObject("listWp", listWp);
		}
		
		if (boardlist != null) {
			mv.addObject("boardlist", boardlist);
		}
		mv.setViewName("home");
		return mv;
	}
	
}
