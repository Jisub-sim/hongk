<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.hongk.calendar.model.vo.Calendar1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.cal_wrap {
	margin: 10px 0 0 10px;
	padding: 0;
	width: 98%;
	height: 900px;
	border-radius: 15px;
	position: relative;
}

.cal_ymd_div {
	margin: 11px 0 0 15px;
	padding: 0px;
	border: 2px solid skyblue;
	border-radius: 10px;
	width: 170px;
	height: 45px;
	position: relative;
	display: inline-block;
}

.cal_ymd_p {
	margin: 0px;
	padding: 11px 0 0 0;
	text-align: center;
	font-size: 16px;
}

.cal_name_div {
	margin: 0 0 0 10px;
	padding: 0;
	border-radius: 10px;
	width: 150px;
	height: 52px;
	position: relative;
	display: inline-block;
}

.cal_deptmember_select {
	border: 2px solid skyblue;
	margin: 0;
	padding: 1px 0 0 5px;
	width: 100%;
	height: 93%;
	font-size: 16px;
	border-radius: 10px;
}

.cal_input_div {
	margin: 0 15px 0 625px;
	padding: 0px;
	width: 100px;
	height: 48px;
	position: relative;
	display: inline-block;
}

.cal_input_btn {
	margin: 0;
	border: 2px solid skyblue;
	border-radius: 10px;
	width: 100px;
	height: 48px;
	text-align: center;
	font-size: 15px;
}

.cal_text_div {
	margin: 15px;
	padding: 0;
	width: 97.5%;
	height: 89%;
}

.cal_text_table {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
	border: 2px solid skyblue;
	border-spacing: 0;
	border-collapse: collapse;
}

.cal_text_table th {
	border: 2px solid skyblue;
	background: #f0f6f9;
	font-size: 15px;
}

.cal_text_table td {
	border: 2px solid skyblue;
	text-align: center;
	font-size: 15px;
}

.cal_text_table button {
	margin: 1px;
}

#cal_td7 {
	padding: 0;
	margin: 0;
}
</style>
</head>
<body>

	<jsp:include page="../common/include.jsp" />

	<div id="main">
		<div class="cal_wrap">
			<div class="cal_ymd_div">
				<p class="cal_ymd_p">${ calyear }년${ calmonth }월 ${ caldate }일</p>
			</div>
			<div class="cal_name_div">
				<select class="cal_deptmember_select" id="cal_deptmember_select" name="mName">
						<c:forEach var="dm" items="${ dmList }">
							<option value="${ dm.mNo }">${ dm.jobCode }  ${ dm.mName }</option>
						</c:forEach>
					</select>
			</div>
			<div class="cal_input_div">
				<button class="cal_input_btn" type="button"
					onclick="insert_popup();">일정 입력</button>
			</div>
			<div class="cal_text_div">
				<table class="cal_text_table">
					<tr>
						<th>시작시간</th>
						<th>종료시간</th>
						<th>업무종류</th>
						<th>프로젝트명</th>
						<th>제목</th>
						<th>장소</th>
						<th></th>
					</tr>

					<c:forTokens var="i"
						items="9.00,9.30,10.00,10.30,11.00,11.30,13.00,13.30,14.00,14.30,15.00,15.30,16.00,16.30,17.00,17.30"
						delims="," varStatus="status">
						<tr>
							<td id="cal_td1">${ i }</td>
							<c:choose>
								<c:when test="${ status.count == 1 }">
									<td id="cal_td2[${status.count}]">9:30</td>
								</c:when>
								<c:when test="${ status.count == 2 }">
									<td id="cal_td2[${status.count}]">10:00</td>
								</c:when>
								<c:when test="${ status.count == 3 }">
									<td id="cal_td2[${status.count}]">10:30</td>
								</c:when>
								<c:when test="${ status.count == 4 }">
									<td id="cal_td2[${status.count}]">11:00</td>
								</c:when>
								<c:when test="${ status.count == 5 }">
									<td id="cal_td2[${status.count}]">11:30</td>
								</c:when>
								<c:when test="${ status.count == 6 }">
									<td id="cal_td2[${status.count}]">12:00</td>
								</c:when>
								<c:when test="${ status.count == 7 }">
									<td id="cal_td2[${status.count}]">13:30</td>
								</c:when>
								<c:when test="${ status.count == 8 }">
									<td id="cal_td2[${status.count}]">14:00</td>
								</c:when>
								<c:when test="${ status.count == 9 }">
									<td id="cal_td2[${status.count}]">14:30</td>
								</c:when>
								<c:when test="${ status.count == 10 }">
									<td id="cal_td2[${status.count}]">15:00</td>
								</c:when>
								<c:when test="${ status.count == 11 }">
									<td id="cal_td2[${status.count}]">15:30</td>
								</c:when>
								<c:when test="${ status.count == 12 }">
									<td id="cal_td2[${status.count}]">16:00</td>
								</c:when>
								<c:when test="${ status.count == 13 }">
									<td id="cal_td2[${status.count}]">16:30</td>
								</c:when>
								<c:when test="${ status.count == 14 }">
									<td id="cal_td2[${status.count}]">17:00</td>
								</c:when>
								<c:when test="${ status.count == 15 }">
									<td id="cal_td2[${status.count}]">17:30</td>
								</c:when>
								<c:otherwise>
									<td id="cal_td2[${status.count}]">18:00</td>
								</c:otherwise>
							</c:choose>
							<td id="cal_td3[${status.count}]"></td>
							<td id="cal_td4"></td>
							<td id="cal_td5"></td>
							<td id="cal_td6"></td>
							<td id="cal_td7">
								<button id="cal_test_${ i }" type="button" onclick="calupdate();">수정</button>
								<button id="cal_test_${ i }" type="button" onclick="caldelete();">삭제</button>
							</td>
						</tr>
					</c:forTokens>
				</table>
			</div>
		</div>
	</div>

	<script>
    	function insert_popup(){
    		<c:url var="insertPopup" value="insertPopup.do">
    			<c:param name="cidate" value="${ calyear }-${ calmonth }-${ caldate }"/>    		
    		</c:url>
    		var url = "${ insertPopup }";
    		var name = "일정등록";
    		var option = "width = 800, height = 410, left = 100, top = 50, location=no";
    		window.open(url, name, option)
    	};
    	
    	function calupdate(){
    		<c:url var="calupdate" value="calOnedayUpView.do">
    			<c:param name="cId" value="27"/>
			</c:url>
			var url = "${ calupdate }";
			var name = "일정수정";
			var option = "width = 800, height = 410, left = 100, top = 50, location=no";
			window.open(url, name, option)
    	};
    	
    	function reloadPage() {
    	    location.reload();
    	};
    	
    	window.onload = function(){
    		
    		$("#cal_teammember_select").val(${mNo}).prop("selected", true);
			$("#cal_deptmember_select").val(${mNo}).prop("selected", true);

    	};
    	
    	$(function(){
			$('#cal_teammember_select').change(function(){
				var mNo = $("#cal_teammember_select option:selected").val();
				location.href="./calOneday.do?cDate=${cDate}&mNo="+mNo+"&deptCode=${loginUser.deptCode}";
			});
			$('#cal_deptmember_select').change(function(){
				var mNo = $("#cal_deptmember_select option:selected").val();
				location.href="./calOneday.do?cDate=${cDate}&mNo="+mNo+"&deptCode=${loginUser.deptCode}";
			});
		});
    	
    	
    </script>
</body>
</html>