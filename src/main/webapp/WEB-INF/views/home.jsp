<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<style>
.pTitle{
 width: 140px;
}	
.pmName{
	width:30px;
}
.dateString{
	width:70px;
}
.ptable{
	text-align:center;
}

/* 캘린더 CSS 시작 */
.calendar td { 
	font-family: "돋움";
	font-size: 9pt;
	color: #595959;
}

.calendar th {
	font-family: "돋움";
	font-size: 8pt;
	color: #000000;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

.navigation A:link {
	font-size: 10pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

.navigation A:visited {
	font-size: 10pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

.navigation A:active {
	font-size: 10pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}

.navigation A:hover {
	font-size: 10pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}

.day {
	width: 14.285%;
	height: 25px;
	font-weight: bold;
	font-size: 5px;
	font-weight: bold;
	text-align: center;
}

.sat {
	color: #529dbc;
}

.sun {
	color: red;
}

.calendar {
	width: 98%;
	margin: auto;
}

.cal_depttitle_div{
	width: 15%;
	height: 35px;
	margin: 0px 0 30px 3px;
	padding: 0;
	float: left;
}

.cal_depttitle_input1{
	width: 65px;
	height: 18px;
	margin: 0;
	font-size:3px;
	text-align: center;
	block: inline-block;
	border: 2px solid skyblue;
	border-radius: 3px;
}

.cal_depttitle_input{
	width: 65px;
	height: 18px;
	margin: 0;
	font-size:3px;
	block: inline-block;
	border: 2px solid skyblue;
	border-radius: 3px;
}
.cal_teammember_div, .cal_deptmember_div {
	width: 65px;
	height: 18px;
	margin: 5px 0 5px 5px;
	padding: 2px 0 0 0;
	float: left;
}

.cal_teammember_select, .cal_deptmember_select {
	border: 2px solid skyblue;
	width: 100%;
	height: 5px;
	font-size: 5px;
	border-radius: 3px;
}

.navigation {
	margin-top: 2px;
	margin-bottom: 5px;
	margin-left: 15px;
	width: 100px;
	height: 20px;
	text-align: center;
	font-size: 15px;
	vertical-align: middle;
	float: left;
}

.calendar_body {
	width: 100%;
	background-color: #FFFFFF;
	border: 1px solid white;
	margin-bottom: 50px;
	border-collapse: collapse;
}

.calendar_body .today {
	border: 1px solid white;
	height: 17px;
	background-color: #c9c9c9;
	text-align: left;
	vertical-align: top;
}

.calendar_body .date {
	height: 10px;
	font-weight: bold;
	font-size: 5px;
	padding-left: 3px;
}

.calendar_body .sat_day {
	border: 1px solid white;
	height: 17px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sat_day .sat {
	height: 10px;
	color: #529dbc;
	font-weight: bold;
	font-size: 5px;
	padding-left: 3px;
}

.calendar_body .sun_day {
	border: 1px solid white;
	height: 17px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sun_day .sun {
	height: 10px;
	color: red;
	font-weight: bold;
	font-size: 5px;
	padding-left: 3px;
}

.calendar_body .normal_day {
	border: 1px solid white;
	height: 17px;
	background-color: #EFEFEF;
	vertical-align: top;
	text-align: left;
}

.before_after_month {
	margin: 10px;
	font-weight: bold;
}

.before_after_year {
	font-weight: bold;
}

.this_month {
	margin: 10px;
}

.cal_wrap {
	width: 99%;
	height: 32px;
	padding: 0;
	line-height: 10px;
	max-height: 32px;
	-webkit-line-clamp: 5;
	-webkit-box-orient: vertical;
	overflow-y: auto;
}

.cal_wrap::-webkit-scrollbar {
	display: none;
}

.cal_text {
	width: 53px;
	height: 10px;
	margin: 1px 0 0 0;
	padding: 0;
	font-size: 5px;
	background-color: #f7d872;
	border: 1px solid #f7d872;
	border-radius: 3px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.cal_text2 {
	width: 53px;
	height: 10px;
	margin: 1px 0 0 0;
	padding: 0;
	font-size: 5px;
	background-color: #f7d872;
	border: 1px solid #f7d872;
	border-radius: 3px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.cal_text3 {
	width: 53px;
	height: 25px;
	margin: 1px 0 0 0;
	padding: 0;
	font-size: 5px;
	background-color: #f7d872;
	border: 1px solid #f7d872;
	border-radius: 3px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
/* 캘린더 CSS 종료 */
</style>
<body>
	<jsp:include page="common/include.jsp"/>
	  <div id="main">
        <div id="mainwrap">
            <div class="Division" id="projecdiv">
                <div class="Divisiontext">프로젝트</div>
                <div class="projectwrap">
                <table class="projecttable">
                    <tr>
                    
                      <th class="pTitle">프로젝트 명</th>
                    
                      <th class="pmName">담당자</th>
                   
                      <th class="dateString">마감일</th>
                    </tr>
						<c:forEach var="p" items="${plist}">
						<c:url var="project" value="project.do">
							<c:param name="pId" value="${p.pId}"/>
						</c:url>
					<tr class="ptable">
						<td><a href="${project}">${p.pTitle }</a></td>
						<td>${p.mName }</td>
						<td>${p.dateString}</td>
					</tr>		
							
					</c:forEach>
                  </table>
                
                  </div>
            </div>
            
            <div class="Division" id="plandiv">
                <div class="Divisiontext">일정</div>
                <div class="projectwrap">
                	<form name="calendarFrm" id="calendarFrm" action="" method="GET">

			<div class="calendar">
				<div class="cal_deptmember_div">
					<input class="cal_depttitle_input1" value="${ dTitle }" readonly>
				</div>
				<div class="cal_deptmember_div">
					<input class="cal_depttitle_input" value="${ jTitle } ${ cname }" readonly>
				</div>
				
					<!--날짜 네비게이션  -->
				<div class="navigation">
					<span class="this_month"> &nbsp;${today_info.search_year}.
						<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
					</span>
				</div>

				<table class="calendar_body">

					<thead>
						<tr bgcolor="#CECECE">
							<td class="day sun">일</td>
							<td class="day">월</td>
							<td class="day">화</td>
							<td class="day">수</td>
							<td class="day">목</td>
							<td class="day">금</td>
							<td class="day sat">토</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:forEach var="dateList" items="${dateList}"
								varStatus="date_status">
								<c:url var="calOneday" value="calOneday.do">
									<c:if test="${ dateList.date < 10 }">
										<c:param name="cDate"
											value="${ today_info.search_year }${today_info.search_month}0${ dateList.date }" />
										<c:param name="mNo" value="${ mNo }" />
										<c:param name="deptCode" value="${ loginUser.deptCode }" />
										<c:param name="jTitle" value="${ jTitle }"/>
									</c:if>
									<c:if test="${ dateList.date >= 10 }">
										<c:param name="cDate"
											value="${ today_info.search_year }${today_info.search_month}${ dateList.date }" />
										<c:param name="mNo" value="${ mNo }" />
										<c:param name="deptCode" value="${ loginUser.deptCode }" />
										<c:param name="jTitle" value="${ jTitle }"/>
									</c:if>
								</c:url>
								<c:choose>
									<c:when test="${dateList.value=='today'}">
										<td class="today" OnClick="location.href='${ calOneday }'">
											<div class="date">${dateList.date}</div>
											<div class="cal_wrap">
												<c:if test="${ !empty aList }">
													<c:forEach var="a" items="${ aList }">
														<c:if test="${ dateList.date < 10 }">
															<c:if
																test="${ a.annual_start.toString().substring(0,4) eq dateList.year && a.annual_start.toString().substring(5,7)-1 eq dateList.month && a.annual_start.toString().substring(8,10) eq 0+dateList.date}">
																<c:choose>
																	<c:when test="${ a.annual_halftime eq 'am' }">
																		<div class="cal_text2">오전반차</div>
																	</c:when>
																	<c:when test="${ a.annual_halftime eq 'pm' }">
																	</c:when>
																	<c:otherwise>
																		<div class="cal_text3">휴가</div>
																	</c:otherwise>
																</c:choose>
															</c:if>
														</c:if>
														<c:if test="${ dateList.date >= 10 }">
															<c:if
																test="${ a.annual_start.toString().substring(0,4) eq dateList.year && a.annual_start.toString().substring(5,7)-1 eq dateList.month && a.annual_start.toString().substring(8,10) eq dateList.date}">
																<c:choose>
																	<c:when test="${ a.annual_halftime eq 'am' }">
																		<div class="cal_text2">오전반차</div>
																	</c:when>
																	<c:when test="${ a.annual_halftime eq 'pm' }">
																	</c:when>
																	<c:otherwise>
																		<div class="cal_text3">휴가</div>
																	</c:otherwise>
																</c:choose>
															</c:if>
														</c:if>
													</c:forEach>
												</c:if>
												<c:if test="${ !empty calList }">
													<c:forEach var="c" items="${ calList }">
														<c:if test="${ dateList.date < 10 }">
															<c:if
																test="${ c.cDate.substring(8, 10) eq 0+dateList.date }">
																<div class="cal_text">${c.cBeginTime}~${c.cEndTime}
																	${ c.cTitle }</div>
															</c:if>
														</c:if>
														<c:if test="${ dateList.date >= 10 }">
															<c:if
																test="${ c.cDate.substring(8, 10) eq dateList.date }">
																<div class="cal_text">${c.cBeginTime}~${c.cEndTime}
																	${ c.cTitle }</div>
															</c:if>
														</c:if>
													</c:forEach>
												</c:if>
												<c:if test="${ !empty aList }">
													<c:forEach var="a" items="${ aList }">
														<c:if test="${ dateList.date < 10 }">
															<c:if
																test="${ a.annual_start.toString().substring(0,4) eq dateList.year && a.annual_start.toString().substring(5,7)-1 eq dateList.month && a.annual_start.toString().substring(8,10) eq 0+dateList.date}">
																<c:if test="${ a.annual_halftime eq 'pm' }">
																	<div class="cal_text2">오후반차</div>
																</c:if>
															</c:if>
														</c:if>
														<c:if test="${ dateList.date >= 10 }">
															<c:if
																test="${ a.annual_start.toString().substring(0,4) eq dateList.year && a.annual_start.toString().substring(5,7)-1 eq dateList.month && a.annual_start.toString().substring(8,10) eq dateList.date}">
																<c:if test="${ a.annual_halftime eq 'pm' }">
																	<div class="cal_text2">오후반차</div>
																</c:if>
															</c:if>
														</c:if>
													</c:forEach>
												</c:if>
											</div>
										</td>
									</c:when>
									<c:when test="${date_status.index%7==6}">
										<td class="sat_day" OnClick="location.href='${ calOneday }'">
											<div class="sat">${dateList.date}</div>
											<div class="cal_wrap">
												<c:if test="${ !empty aList }">
													<c:forEach var="a" items="${ aList }">
														<c:if test="${ dateList.date < 10 }">
															<c:if
																test="${ a.annual_start.toString().substring(0,4) eq dateList.year && a.annual_start.toString().substring(5,7)-1 eq dateList.month && a.annual_start.toString().substring(8,10) eq 0+dateList.date}">
																<c:choose>
																	<c:when test="${ a.annual_halftime eq 'am' }">
																		<div class="cal_text2">오전반차</div>
																	</c:when>
																	<c:when test="${ a.annual_halftime eq 'pm' }">
																	</c:when>
																	<c:otherwise>
																		<div class="cal_text3">휴가</div>
																	</c:otherwise>
																</c:choose>
															</c:if>
														</c:if>
														<c:if test="${ dateList.date >= 10 }">
															<c:if
																test="${ a.annual_start.toString().substring(0,4) eq dateList.year && a.annual_start.toString().substring(5,7)-1 eq dateList.month && a.annual_start.toString().substring(8,10) eq dateList.date}">
																<c:choose>
																	<c:when test="${ a.annual_halftime eq 'am' }">
																		<div class="cal_text2">오전반차</div>
																	</c:when>
																	<c:when test="${ a.annual_halftime eq 'pm' }">
																	</c:when>
																	<c:otherwise>
																		<div class="cal_text3">휴가</div>
																	</c:otherwise>
																</c:choose>
															</c:if>
														</c:if>
													</c:forEach>
												</c:if>
												<c:if test="${ !empty calList }">
													<c:forEach var="c" items="${ calList }">
														<c:if test="${ dateList.date < 10 }">
															<c:if
																test="${ c.cDate.substring(8, 10) eq 0+dateList.date }">
																<div class="cal_text">${c.cBeginTime}~${c.cEndTime}
																	${ c.cTitle }</div>
															</c:if>
														</c:if>
														<c:if test="${ dateList.date >= 10 }">
															<c:if
																test="${ c.cDate.substring(8, 10) eq dateList.date }">
																<div class="cal_text">${c.cBeginTime}~${c.cEndTime}
																	${ c.cTitle }</div>
															</c:if>
														</c:if>
													</c:forEach>
												</c:if>
												<c:if test="${ !empty aList }">
													<c:forEach var="a" items="${ aList }">
														<c:if test="${ dateList.date < 10 }">
															<c:if
																test="${ a.annual_start.toString().substring(0,4) eq dateList.year && a.annual_start.toString().substring(5,7)-1 eq dateList.month && a.annual_start.toString().substring(8,10) eq 0+dateList.date}">
																<c:if test="${ a.annual_halftime eq 'pm' }">
																	<div class="cal_text2">오후반차</div>
																</c:if>
															</c:if>
														</c:if>
														<c:if test="${ dateList.date >= 10 }">
															<c:if
																test="${ a.annual_start.toString().substring(0,4) eq dateList.year && a.annual_start.toString().substring(5,7)-1 eq dateList.month && a.annual_start.toString().substring(8,10) eq dateList.date}">
																<c:if test="${ a.annual_halftime eq 'pm' }">
																	<div class="cal_text2">오후반차</div>
																</c:if>
															</c:if>
														</c:if>
													</c:forEach>
												</c:if>
											</div>
										</td>
									</c:when>
									<c:when test="${date_status.index%7==0}">
						</tr>
						<tr>
							<td class="sun_day" OnClick="location.href='${ calOneday }'">
								<div class="sun">${dateList.date}</div>
								<div class="cal_wrap">
									<c:if test="${ !empty aList }">
										<c:forEach var="a" items="${ aList }">
											<c:if test="${ dateList.date < 10 }">
												<c:if
													test="${ a.annual_start.toString().substring(0,4) eq dateList.year && a.annual_start.toString().substring(5,7)-1 eq dateList.month && a.annual_start.toString().substring(8,10) eq 0+dateList.date}">
													<c:choose>
														<c:when test="${ a.annual_halftime eq 'am' }">
															<div class="cal_text2">오전반차</div>
														</c:when>
														<c:when test="${ a.annual_halftime eq 'pm' }">
														</c:when>
														<c:otherwise>
															<div class="cal_text3">휴가</div>
														</c:otherwise>
													</c:choose>
												</c:if>
											</c:if>
											<c:if test="${ dateList.date >= 10 }">
												<c:if
													test="${ a.annual_start.toString().substring(0,4) eq dateList.year && a.annual_start.toString().substring(5,7)-1 eq dateList.month && a.annual_start.toString().substring(8,10) eq dateList.date}">
													<c:choose>
														<c:when test="${ a.annual_halftime eq 'am' }">
															<div class="cal_text2">오전반차</div>
														</c:when>
														<c:when test="${ a.annual_halftime eq 'pm' }">
														</c:when>
														<c:otherwise>
															<div class="cal_text3">휴가</div>
														</c:otherwise>
													</c:choose>
												</c:if>
											</c:if>
										</c:forEach>
									</c:if>
									<c:if test="${ !empty calList }">
										<c:forEach var="c" items="${ calList }">
											<c:if test="${ dateList.date < 10 }">
												<c:if
													test="${ c.cDate.substring(8, 10) eq 0+dateList.date }">
													<div class="cal_text">${c.cBeginTime}~${c.cEndTime}
														${ c.cTitle }</div>
												</c:if>
											</c:if>
											<c:if test="${ dateList.date >= 10 }">
												<c:if test="${ c.cDate.substring(8, 10) eq dateList.date }">
													<div class="cal_text">${c.cBeginTime}~${c.cEndTime}
														${ c.cTitle }</div>
												</c:if>
											</c:if>
										</c:forEach>
									</c:if>
									<c:if test="${ !empty aList }">
										<c:forEach var="a" items="${ aList }">
											<c:if test="${ dateList.date < 10 }">
												<c:if
													test="${ a.annual_start.toString().substring(0,4) eq dateList.year && a.annual_start.toString().substring(5,7)-1 eq dateList.month && a.annual_start.toString().substring(8,10) eq 0+dateList.date}">
													<c:if test="${ a.annual_halftime eq 'pm' }">
														<div class="cal_text2">오후반차</div>
													</c:if>
												</c:if>
											</c:if>
											<c:if test="${ dateList.date >= 10 }">
												<c:if
													test="${ a.annual_start.toString().substring(0,4) eq dateList.year && a.annual_start.toString().substring(5,7)-1 eq dateList.month && a.annual_start.toString().substring(8,10) eq dateList.date}">
													<c:if test="${ a.annual_halftime eq 'pm' }">
														<div class="cal_text2">오후반차</div>
													</c:if>
												</c:if>
											</c:if>
										</c:forEach>
									</c:if>
								</div>
							</td>
							</c:when>
							<c:otherwise>
								<td class="normal_day" OnClick="location.href='${ calOneday }'">
									<div class="date">${dateList.date}</div>
									<div class="cal_wrap">
										<c:if test="${ !empty aList }">
											<c:forEach var="a" items="${ aList }">
												<c:if test="${ dateList.date < 10 }">
													<c:if
														test="${ a.annual_start.toString().substring(0,4) eq dateList.year && a.annual_start.toString().substring(5,7)-1 eq dateList.month && a.annual_start.toString().substring(8,10) eq 0+dateList.date}">
														<c:choose>
															<c:when test="${ a.annual_halftime eq 'am' }">
																<div class="cal_text2">오전반차</div>
															</c:when>
															<c:when test="${ a.annual_halftime eq 'pm' }">
															</c:when>
															<c:otherwise>
																<div class="cal_text3">휴가</div>
															</c:otherwise>
														</c:choose>
													</c:if>
													<c:if test="${ a.annual_day_use > 1 }">
														<c:if test="${ a.annual_start.toString().substring(0,4) eq dateList.year && a.annual_start.toString().substring(5,7)-1 eq dateList.month && a.annual_start.toString().substring(8,10)+1 eq 0+dateList.date}">
															<c:choose>
															<c:when test="${ a.annual_halftime eq 'am' }">
																<div class="cal_text2">오전반차</div>
															</c:when>
															<c:when test="${ a.annual_halftime eq 'pm' }">
															</c:when>
															<c:otherwise>
																<div class="cal_text3">휴가</div>
															</c:otherwise>
														</c:choose>
													</c:if>
													</c:if>
												</c:if>
												<c:if test="${ dateList.date >= 10 }">
													<c:if
														test="${ a.annual_start.toString().substring(0,4) eq dateList.year && a.annual_start.toString().substring(5,7)-1 eq dateList.month && a.annual_start.toString().substring(8,10) eq dateList.date}">
														<c:choose>
															<c:when test="${ a.annual_halftime eq 'am' }">
																<div class="cal_text2">오전반차</div>
															</c:when>
															<c:when test="${ a.annual_halftime eq 'pm' }">
															</c:when>
															<c:otherwise>
																<div class="cal_text3">휴가</div>
															</c:otherwise>
														</c:choose>
													</c:if>
													<c:if test="${ a.annual_day_use > 1 }">
														<c:if test="${ a.annual_start.toString().substring(0,4) eq dateList.year && a.annual_start.toString().substring(5,7)-1 eq dateList.month && a.annual_start.toString().substring(8,10)+1 eq 0+dateList.date}">
															<c:choose>
															<c:when test="${ a.annual_halftime eq 'am' }">
																<div class="cal_text2">오전반차</div>
															</c:when>
															<c:when test="${ a.annual_halftime eq 'pm' }">
															</c:when>
															<c:otherwise>
																<div class="cal_text3">휴가</div>
															</c:otherwise>
														</c:choose>
													</c:if>
													</c:if>
												</c:if>
											</c:forEach>
										</c:if>
										<c:if test="${ !empty calList }">
											<c:forEach var="c" items="${ calList }">
												<c:if test="${ dateList.date < 10 }">
													<c:if
														test="${ c.cDate.substring(8, 10) eq 0+dateList.date }">
														<div class="cal_text">${c.cBeginTime}~${c.cEndTime}
															${ c.cTitle }</div>
													</c:if>
												</c:if>
												<c:if test="${ dateList.date >= 10 }">
													<c:if test="${ c.cDate.substring(8, 10) eq dateList.date }">
														<div class="cal_text">${c.cBeginTime}~${c.cEndTime}
															${ c.cTitle }</div>
													</c:if>
												</c:if>
											</c:forEach>
										</c:if>
										<c:if test="${ !empty aList }">
											<c:forEach var="a" items="${ aList }">
												<c:if test="${ dateList.date < 10 }">
													<c:if
														test="${ a.annual_start.toString().substring(0,4) eq dateList.year && a.annual_start.toString().substring(5,7)-1 eq dateList.month && a.annual_start.toString().substring(8,10) eq 0+dateList.date}">
														<c:if test="${ a.annual_halftime eq 'pm' }">
															<div class="cal_text2">오후반차</div>
														</c:if>
													</c:if>
												</c:if>
												<c:if test="${ dateList.date >= 10 }">
													<c:if
														test="${ a.annual_start.toString().substring(0,4) eq dateList.year && a.annual_start.toString().substring(5,7)-1 eq dateList.month && a.annual_start.toString().substring(8,10) eq dateList.date}">
														<c:if test="${ a.annual_halftime eq 'pm' }">
															<div class="cal_text2">오후반차</div>
														</c:if>
													</c:if>
												</c:if>
											</c:forEach>
										</c:if>
									</div>
								</td>
							</c:otherwise>
							</c:choose>
							</c:forEach>
					</tbody>
				</table>
			</div>
		</form>
                </div>
            </div>
            
            <div class="Division" id="accepdiv">
                <div class="Divisiontext">결재 대기함</div>
                <div class="projectwrap">
                    <table class="projecttable">
                         <thead>
				                <th width="5%">NO</th>
				                <th width="36%">문서제목</th>
				                <th width="10%">기안자</th>
				                <th width="10%">상태</th>
				         </thead>
				            <c:forEach var ="listWp" items="${ listWp }">
				            <c:set var="status" value="${listWp.ea_status }"/>
				            <tr>
				                <td>${listWp.ea_no }</td>
				                <td>${listWp.ea_title }</td>
				                <td>${listWp.mName }</td>
				              <c:choose>
								<c:when test="${ status eq 'B' }">
									<td>반려</td>
								</c:when>
								<c:when test="${ status eq 'C' }">
									 <td>완료</td>
								</c:when>
								<c:when test="${ status eq 'W' }">
									 <td>진행</td>
								</c:when>
								<c:when test="${ status eq 'R' }">
									<td>회수</td>
								</c:when>
							</c:choose>
				            </tr>
						</c:forEach>
                    </table>
                </div>
                
            </div>
            <div class="Division" id="noticediv">
                <div class="Divisiontext">공지사항</div>
                <div class="projectwrap">
                    <table class="projecttable">
                        <tr>
                            <th>NO</th>
                            <th>상태</th>
                            <th>제목</th>
                            <th>작성일</th>
                        </tr>
                        <tr>    
                            <th>22</th>
                            <th><i id="blink" class="fas fa-bullhorn"></i></th>
                            <th>공지사항 제목</th>
                            <th>2020/11/11</th>
                        </tr>
                        <tr>    
                            <th>22</th>
                            <th><i id="blink" class="fas fa-bullhorn"></i></th>
                            <th>공지사항 제목</th>
                            <th>2020/11/11</th>
                        </tr>
                        <tr>    
                            <th>22</th>
                            <th><i id="blink" class="fas fa-bullhorn"></i></th>
                            <th>공지사항 제목</th>
                            <th>2020/11/11</th>
                        </tr>
                        <tr>    
                            <th>22</th>
                            <th><i id="blink" class="fas fa-bullhorn"></i></th>
                            <th>공지사항 제목</th>
                            <th>2020/11/11</th>
                        </tr>
                    
                    </table>
                </div>
            </div>
        </div>
        </div> 
    

</body>
</html>
