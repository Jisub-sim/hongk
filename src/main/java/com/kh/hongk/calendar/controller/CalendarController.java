package com.kh.hongk.calendar.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hongk.annual.model.vo.Annual;
import com.kh.hongk.calendar.model.exception.CalendarException;
import com.kh.hongk.calendar.model.service.CalendarService;
import com.kh.hongk.calendar.model.vo.Calendar1;
import com.kh.hongk.calendar.model.vo.DateData;
import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.model.vo.Pmember;
import com.kh.hongk.project.model.vo.Project;

@Controller
public class CalendarController {
	@Autowired 
	private CalendarService cService;
	
	@RequestMapping(value = "calendar.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView calendar(ModelAndView mv, HttpServletRequest request, DateData dateData,
								 String deptCode, int mNo, int pageurlnum, HttpSession session){
		int pageurlnum1 = pageurlnum;
		if(pageurlnum1 != 0) {
			session.setAttribute("pageurlnum1", pageurlnum1);
		}
		
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
		
		ArrayList<Member> dmList = cService.selectCalDMemberList(deptCode);
		
		Pmember p = cService.selectCalPid(mNo);
		
		int pId = p.getpId();
		
		ArrayList<Member> tmList = cService.selectCalTMemberList(pId);
		
		Calendar1 c = new Calendar1();
		c.setcDate(cDate);
		c.setmName(mNo);
		
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
		mv.addObject("mNo", mNo);
		mv.addObject("aList", aList);
		mv.addObject("pageurlnum1", pageurlnum1);
		mv.setViewName("calendar/calendarTeam");
		
		return mv;
	}
	
	/*@RequestMapping("calendar.do")
	public String calendarView() {
		return "calendar/calendarView";
	}*/
	
	@RequestMapping("calOneday.do")
	public ModelAndView calOnedayView(ModelAndView mv, Calendar1 c,
								String cDate, int mNo, String deptCode) {
		c.setcDate(cDate);
		c.setmName(mNo);
		
		ArrayList<Calendar1> calList = cService.selectOnedayList(c);
		System.out.println("c = " + c);
		System.out.println("calList = " + calList);
		
		String calyear = cDate.substring(0, 4);
		String calmonth = cDate.substring(4, 6);
		String caldate = cDate.substring(6);
		
		Pmember p = cService.selectCalPid(mNo);
		
		int pId = p.getpId();
		
		ArrayList<Member> tmList = cService.selectCalTMemberList(pId);
		
		ArrayList<Member> dmList = cService.selectCalDMemberList(deptCode);
		
		System.out.println("1day tmList = " + tmList);
		System.out.println("1day dmList = " + dmList);
		
		ArrayList<Integer> test = new ArrayList<>();
		for(int i=0; i<16; i++) {
			test.add(i);
		}
		String check = "";
		
		if(calList != null) {
			for(int i = 0; i < calList.size(); i++) {
				check = calList.get(i).getcBeginTime();
				if(check.equals("9:00")) {
					test.remove((Integer)0);
				}else if(check.equals("9:30")) {
					test.remove((Integer)1);
				}else if(check.equals("10:00")) {
					test.remove((Integer)2);
				}else if(check.equals("10:30")) {
					test.remove((Integer)3);
				}else if(check.equals("11:00")) {
					test.remove((Integer)4);
				}else if(check.equals("11:30")) {
					test.remove((Integer)5);
				}else if(check.equals("13:00")) {
					test.remove((Integer)6);
				}else if(check.equals("13:30")) {
					test.remove((Integer)7);
				}else if(check.equals("14:00")) {
					test.remove((Integer)8);
				}else if(check.equals("14:30")) {
					test.remove((Integer)9);
				}else if(check.equals("15:00")) {
					test.remove((Integer)10);
				}else if(check.equals("15:30")) {
					test.remove((Integer)11);
				}else if(check.equals("16:00")) {
					test.remove((Integer)12);
				}else if(check.equals("16:30")) {
					test.remove((Integer)13);
				}else if(check.equals("17:00")) {
					test.remove((Integer)14);
				}else {
					test.remove((Integer)15);
				}
			}
		}
		
		System.out.println("test = " + test);
		
		if(calList != null) {
			mv.addObject("calyear", calyear);
			mv.addObject("calmonth", calmonth);
			mv.addObject("caldate", caldate);
			mv.addObject("calList", calList);
			mv.addObject("tmList", tmList);
			mv.addObject("dmList", dmList);
			mv.addObject("mNo", mNo);
			mv.addObject("cDate", cDate);
			mv.addObject("test", test);
			mv.setViewName("calendar/calendarOnedayView1");
		}
		return mv;
	}
	
	@RequestMapping("insertPopup.do")
	public ModelAndView insertPopup(ModelAndView mv, String cidate) {
		
		ArrayList<Project> list = cService.selectProjectTitleList();
		
		System.out.println("list = " + list);
		System.out.println("cidate = " + cidate);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("cidate", cidate);
			mv.setViewName("calendar/calendarInsertForm");
		}
		
		return mv;
	}
	
	@RequestMapping("calinsert.do")
	public ModelAndView calendarInsert(ModelAndView mv, Calendar1 c, int mName) {
		System.out.println("c1 = " + c);
		ArrayList<Calendar1> result = cService.selectInsertCheck(c);
		
		if(!result.isEmpty()) {
			throw new CalendarException("지정한 시간에 이미 일정이 존재합니다.");
		}
		
		String cDate = c.getcDate();
		
		ArrayList<Annual> result2 = cService.selectCalAnnualCheck(cDate);
		
		System.out.println("result2 = " + result2);
		
		int count = 0;
		if(!result2.isEmpty()) {
			if(result2.get(0).getAnnual_type() == 1) {
				System.out.println("휴가사용일");
				throw new CalendarException("휴가 사용일 입니다.");
			}else if(result2.get(0).getAnnual_type() == 4) {
				if(result2.get(0).getAnnual_halftime() == "am") {
					if(c.getcBeginTime() == "9:00" || c.getcBeginTime() == "9:30" || c.getcBeginTime() == "10:00" || c.getcBeginTime() == "10:30" || 
							c.getcBeginTime() == "11:00" || c.getcBeginTime() == "11:30") {
						System.out.println("오전반차 사용일");
						throw new CalendarException("오전반차 사용일 입니다.");
					}
					count = 1;
				}else if(result2.get(0).getAnnual_halftime() == "pm") {
					if(c.getcBeginTime() == "13:00" || c.getcBeginTime() == "13:30" || c.getcBeginTime() == "14:00" || c.getcBeginTime() == "14:30" ||
							c.getcBeginTime() == "15:00" || c.getcBeginTime() == "15:30" || c.getcBeginTime() == "16:00" || c.getcBeginTime() == "16:30" ||
							c.getcBeginTime() == "17:00" || c.getcBeginTime() == "17:00") {
						System.out.println("오후반차 사용일");
						throw new CalendarException("오후반차 사용일 입니다.");
					}
					count = 1;
				}
			}
		}
		int result3 = 0;
		if(result.isEmpty() && (result2.isEmpty() || count == 1)){
			result3 = cService.insertCalendar(c);
		}
		
		if(result3 > 0) {
			mv.addObject("mName", mName);
			mv.setViewName("calendar/calendarClose");
			return mv;
		} else {
			throw new CalendarException("일정 등록에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("calOnedayUpView.do")
	public ModelAndView calendarUpdateView(ModelAndView mv, int cId) {
		Calendar1 cal = cService.selectOnedayUpView(cId);
		ArrayList<Project> list = cService.selectProjectTitleList();
		
		mv.addObject("cal", cal).addObject("list", list).setViewName("calendar/calendarUpdateForm");
		
		System.out.println("cal = " + cal);
		return mv;
	}
	
	@RequestMapping("calOnedayUpdate.do")
	public ModelAndView calendarOnedayUpdate(ModelAndView mv, int cId, Calendar1 c) {
		ArrayList<Calendar1> result = cService.selectInsertCheck(c);
		
		if(!result.isEmpty()) {
			throw new CalendarException("지정한 시간에 이미 일정이 존재합니다.");
		}
		
		String cDate = c.getcDate();
		
		ArrayList<Annual> result2 = cService.selectCalAnnualCheck(cDate);
		
		System.out.println("result2 = " + result2);
		
		int count = 0;
		if(!result2.isEmpty()) {
			if(result2.get(0).getAnnual_type() == '1') {
				throw new CalendarException("휴가 사용일 입니다.");
			}else if(result2.get(0).getAnnual_type() == '4') {
				if(result2.get(0).getAnnual_halftime() == "am") {
					if(c.getcBeginTime() == "9:00" || c.getcBeginTime() == "9:30" || c.getcBeginTime() == "10:00" || c.getcBeginTime() == "10:30" || 
							c.getcBeginTime() == "11:00" || c.getcBeginTime() == "11:30") {
						throw new CalendarException("오전반차 사용일 입니다.");
					}
					count = 1;
				}else if(result2.get(0).getAnnual_halftime() == "pm") {
					if(c.getcBeginTime() == "13:00" || c.getcBeginTime() == "13:30" || c.getcBeginTime() == "14:00" || c.getcBeginTime() == "14:30" ||
							c.getcBeginTime() == "15:00" || c.getcBeginTime() == "15:30" || c.getcBeginTime() == "16:00" || c.getcBeginTime() == "16:30" ||
							c.getcBeginTime() == "17:00" || c.getcBeginTime() == "17:00") {
						throw new CalendarException("오후반차 사용일 입니다.");
					}
					count = 1;
				}
			}
		}

		int result3 = cService.updateCalendar(c);
		
		if(result.isEmpty() && (result2.isEmpty() || count == 1) && result3 > 0) {
			mv.setViewName("calendar/calendarClose");
		} else {
			throw new CalendarException("일정 수정에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("calOnedayDelete.do")
	public ModelAndView calendarOnedayDelete(ModelAndView mv, int cId,
									String cDate, int mNo, String deptCode) {
		int result = cService.delectCalendar(cId);
		
		if(result > 0) {
			mv.addObject("cDate", cDate);
			mv.addObject("mNo", mNo);
			mv.addObject("deptCode", deptCode);
			mv.setViewName("redirect:calOneday.do");
		} else {
			throw new CalendarException("일정 삭제에 실패하였습니다.");
		}
		return mv;
	}
	
}