package com.kh.hongk; 

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hongk.annual.model.vo.Annual;
import com.kh.hongk.approval.model.service.EAService;
import com.kh.hongk.approval.model.vo.Electronic_Approval;
import com.kh.hongk.calendar.model.service.CalendarService;
import com.kh.hongk.calendar.model.vo.Calendar1;
import com.kh.hongk.calendar.model.vo.DateData;
import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.service.ProjectService;
import com.kh.hongk.project.model.vo.Pmember;
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
	private CalendarService cService;
	
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model, HttpServletRequest request, ModelAndView mv, DateData dateData) {
		int mNo = ((Member) request.getSession().getAttribute("loginUser")).getmNo();
		System.out.println(mNo);
		
		ArrayList<Electronic_Approval> listWp = eaService.listWp(mNo);
		
		ArrayList<Project> list = pService.selectmyProjectMain(mNo);
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
		
		/* 캘린더 */
		String cname = ((Member) request.getSession().getAttribute("loginUser")).getmName();
		String deptCode = ((Member) request.getSession().getAttribute("loginUser")).getDeptCode();
		
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		//검색 날짜
		if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
		//검색 날짜 end

		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DateData(null, null, null, null);
			dateList.add(calendarData);
		}
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
			}else{
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
		}

		//달력 빈곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0){
			
			for (int i = 0; i < index; i++) {
				calendarData= new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		
		String yearchange = dateList.get(7).getYear().substring(2);
		int monchange = Integer.parseInt(dateList.get(7).getMonth()) + 1;
		String cDate = null;
		
		if(monchange < 10) {
			cDate = yearchange + "/" + "0" + monchange;
		} else {
			cDate = yearchange + "/" + monchange;
		}
		
		String jTitle = cService.selectCalJTitle(mNo);
		System.out.println("jTitle = " + jTitle);
		String dTitle = cService.selectCalDTitle(mNo);
		System.out.println("dTitle = " + dTitle);
		
		ArrayList<Member> dmList = cService.selectCalDMemberList(deptCode);
		
		System.out.println("mNo = " + mNo);
		Pmember p = cService.selectCalPid(mNo);
		
		System.out.println("p = " + p);
		
		int pId = p.getpId();
		
		ArrayList<Member> tmList = cService.selectCalTMemberList(pId);
		
		Calendar1 c = new Calendar1();
		c.setcDate(cDate);
		c.setmName(mNo);
		
		System.out.println("cDate = " + cDate);
		System.out.println("mNo = " + mNo);
		System.out.println("c 전 = " + c);
		
		ArrayList<Calendar1> calList = cService.selectCalendarList(c);
		
		ArrayList<Annual> aList = cService.selectCalAnnualList(mNo);
		
		System.out.println("aList = " + aList);
		
		System.out.println("dateList = " + dateList);
		System.out.println("today_info = " + today_info);
		System.out.println("mNo = " + mNo);
		System.out.println("calList = " + calList);
		System.out.println("tmList = " + tmList);
		System.out.println("dmList = " + dmList);
		
		//배열에 담음
		mv.addObject("dateList", dateList);		//날짜 데이터 배열
		mv.addObject("today_info", today_info);
		mv.addObject("dmList", dmList);
		mv.addObject("tmList", tmList);
		mv.addObject("calList", calList);
		mv.addObject("jTitle", jTitle);
		mv.addObject("dTitle", dTitle);
		mv.addObject("mNo", mNo);
		mv.addObject("cname", cname);
		mv.addObject("aList", aList);
		
		mv.setViewName("home");
		return mv;
	}
	
}
