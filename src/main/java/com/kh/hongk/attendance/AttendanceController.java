package com.kh.hongk.attendance;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AttendanceController {
	@RequestMapping("attendance.do")
	public String attendanceList() {
		System.out.println("컨트롤러 진입 : ");
		return "attendance/AttendancePage";
	}

	

}
