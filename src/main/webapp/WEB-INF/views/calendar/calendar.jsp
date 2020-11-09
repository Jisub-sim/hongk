<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>캘린더</title>
<meta charset="UTF-8">

<style>
.calendar td {
	font-family: "돋움";
	font-size: 11pt;
	color: #595959;
}

.calendar th {
	font-family: "돋움";
	font-size: 9pt;
	color: #000000;
}

.calendar select {
	font-family: "돋움";
	font-size: 9pt;
	color: #595959;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

.navigation A:link {
	font-size: 15pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

.navigation A:visited {
	font-size: 15pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

.navigation A:active {
	font-size: 15pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}

.navigation A:hover {
	font-size: 15pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}

.day {
	width: 100px;
	height: 30px;
	font-weight: bold;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
}

.sat {
	color: #529dbc;
}

.sun {
	color: red;
}

.today_button_div {
	float: right;
}

.today_button {
	width: 100px;
	height: 30px;
}

.calendar {
	width: 98%;
	margin: auto;
}

.navigation {
	margin-top: 50px;
	margin-bottom: 30px;
	text-align: center;
	font-size: 25px;
	vertical-align: middle;
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
	height: 150px;
	background-color: #c9c9c9;
	text-align: left;
	vertical-align: top;
}

.calendar_body .date {
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .sat_day {
	border: 1px solid white;
	height: 150px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sat_day .sat {
	color: #529dbc;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .sun_day {
	border: 1px solid white;
	height: 150px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sun_day .sun {
	color: red;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .normal_day {
	border: 1px solid white;
	height: 150px;
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
	height: 127px;
	padding: 0;
}

.cal_text {
	width: 99%;
	height: 23px;
	margin: 1px 0 0 0;
	padding: 0 0 0 2px;
	font-size: 13px;
	background-color: #f7d872;
	border: 1px solid #f7d872;
	border-radius: 5px;
}
</style>
</head>
<body>

	<jsp:include page="../common/include.jsp" />

	<div id="main">

		<form name="calendarFrm" id="calendarFrm" action="" method="GET">

			<div class="calendar">

				<!--날짜 네비게이션  -->
				<div class="navigation">
					<a class="before_after_year"
						href="./calendar.do?year=${today_info.search_year-1}&month=${today_info.search_month-1}">
						&lt;&lt; <!-- 이전해 -->
					</a> <a class="before_after_month"
						href="./calendar.do?year=${today_info.before_year}&month=${today_info.before_month}">
						&lt; <!-- 이전달 -->
					</a> <span class="this_month"> &nbsp;${today_info.search_year}.
						<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
					</span> <a class="before_after_month"
						href="./calendar.do?year=${today_info.after_year}&month=${today_info.after_month}">
						<!-- 다음달 --> &gt;
					</a> <a class="before_after_year"
						href="./calendar.do?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
						<!-- 다음해 --> &gt;&gt;
					</a>
				</div>

				<!-- <div class="today_button_div"> -->
				<!-- <input type="button" class="today_button" onclick="javascript:location.href='/calendar.do'" value="go today"/> -->
				<!-- </div> -->
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
										<c:param name="mName" value="${ loginUser.mNo }" />
									</c:if>
									<c:if test="${ dateList.date >= 10 }">
										<c:param name="cDate"
											value="${ today_info.search_year }${today_info.search_month}${ dateList.date }" />
										<c:param name="mName" value="${ loginUser.mNo }" />
									</c:if>
								</c:url>
								<c:choose>
									<c:when test="${dateList.value=='today'}">
										<td class="today" OnClick="location.href='${ calOneday }'">
											<div class="date">${dateList.date}</div>
											<div class="cal_wrap">
												<c:if test="${ !empty calList }">
													<c:forEach var="c" items="${ calList }">
														<c:if test="${ dateList.date < 10 }">
															<c:if
																test="${ c.cDate.substring(8, 10) eq 0+dateList.date }">
																<div class="cal_text">${ c.cTitle }</div>
															</c:if>
														</c:if>
														<c:if test="${ dateList.date >= 10 }">
															<c:if
																test="${ c.cDate.substring(8, 10) eq dateList.date }">
																<div class="cal_text">${ c.cTitle }</div>
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
												<c:if test="${ !empty calList }">
													<c:forEach var="c" items="${ calList }">
														<c:if test="${ dateList.date < 10 }">
															<c:if
																test="${ c.cDate.substring(8, 10) eq 0+dateList.date }">
																<div class="cal_text">${ c.cTitle }</div>
															</c:if>
														</c:if>
														<c:if test="${ dateList.date >= 10 }">
															<c:if
																test="${ c.cDate.substring(8, 10) eq dateList.date }">
																<div class="cal_text">${ c.cTitle }</div>
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
									<c:if test="${ !empty calList }">
										<c:forEach var="c" items="${ calList }">
											<c:if test="${ dateList.date < 10 }">
												<c:if
													test="${ c.cDate.substring(8, 10) eq 0+dateList.date }">
													<div class="cal_text">${ c.cTitle }</div>
												</c:if>
											</c:if>
											<c:if test="${ dateList.date >= 10 }">
												<c:if test="${ c.cDate.substring(8, 10) eq dateList.date }">
													<div class="cal_text">${ c.cTitle }</div>
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
										<c:if test="${ !empty calList }">
											<c:forEach var="c" items="${ calList }">
												<c:if test="${ dateList.date < 10 }">
													<c:if
														test="${ c.cDate.substring(8, 10) eq 0+dateList.date }">
														<div class="cal_text">${ c.cTitle }</div>
													</c:if>
												</c:if>
												<c:if test="${ dateList.date >= 10 }">
													<c:if test="${ c.cDate.substring(8, 10) eq dateList.date }">
														<div class="cal_text">${ c.cTitle }</div>
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


	<script>
	</script>

</body>
</html>
