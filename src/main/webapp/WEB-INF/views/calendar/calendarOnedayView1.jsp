<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.hongk.calendar.model.vo.Calendar1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	ArrayList<Integer> test = (ArrayList<Integer>)request.getAttribute("test");
	pageContext.setAttribute("test", test);
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"/>
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

.cal_deptmember_input{
	border: 2px solid skyblue;
	margin: 0;
	padding: 1px 0 0 5px;
	width: 94%;
	height: 83%;
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
	padding: 0;
	height: 45px;
	text-align: center;
	font-size: 15px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

#cal_th1, #cal_th2{
	width: 99px;
}

#cal_th3{
	width: 150px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
#cal_th4{
	width: 250px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
#cal_th5, #cal_th6{
	width: 150px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

#cal_th7{
	width: 100px;
}

.cal_text_table button {
	margin: 1px;
}

.cal_td3_div{
	width: 145px;
	height: 20px;
	padding: 0 0 0 5px;
	text-align: center;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.cal_td4_div{
	width: 245px;
	height: 20px;
	padding: 0 0 0 5px;
	text-align: center;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.cal_td5_div, .cal_td6_div{
	width: 145px;
	height: 20px;
	padding: 0 0 0 5px;
	text-align: center;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.cal_td7_div{
	width: 95px;
	height: 20px;
	padding: 0 0 0 5px;
	text-align: center;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.cal_td3_div:hover, .cal_td4_div:hover,
 .cal_td5_div:hover, .cal_td6_div:hover{
	height: auto;
	white-space: normal;
	overflow: visible;
}

</style>
</head>
<body>

	<jsp:include page="../common/include.jsp" />

	<div id="main">
		<div class="cal_wrap">
			<div class="cal_ymd_div">
				<p class="cal_ymd_p" >${ calyear }년${ calmonth }월 ${ caldate }일</p>
			</div>
			<div class="cal_name_div">
				<input class="cal_deptmember_input" value=" ${ jTitle } ${ loginUser.mName }" readonly>
			</div>
			<div class="cal_input_div">
				<c:if test="${ loginUser.mNo eq mNo }">
					<button class="cal_input_btn" type="button"onclick="insert_popup();">일정 입력</button>
				</c:if>
				<c:if test="${ loginUser.mNo ne mNo }">
					<button class="cal_input_btn" type="button">일정 입력</button>
				</c:if>
			</div>
			<div class="cal_text_div">
				<table class="cal_text_table">
					<tr>
						<th id="cal_th1">시작시간</th>
						<th id="cal_th2">종료시간</th>
						<th id="cal_th3">제목</th>
						<th id="cal_th4">프로젝트</th>
						<th id="cal_th5">업무종류</th>
						<th id="cal_th6">장소</th>
						<th id="cal_th7"></th>
					</tr>
					<c:forTokens var="i"
						items="9:00,9:30,10:00,10:30,11:00,11:30,13:00,13:30,14:00,14:30,15:00,15:30,16:00,16:30,17:00,17:30"
						delims="," varStatus="status">
						<tr>
							<td id="cal_td1" class="cal_td1">${ i }</td>
							<c:choose>
								<c:when test="${ status.index == 0 }">
									<td class="cal_td2">9:30</td>
								</c:when>
								<c:when test="${ status.index == 1 }">
									<td class="cal_td2">10:00</td>
								</c:when>
								<c:when test="${ status.index == 2 }">
									<td class="cal_td2">10:30</td>
								</c:when>
								<c:when test="${ status.index == 3 }">
									<td class="cal_td2">11:00</td>
								</c:when>
								<c:when test="${ status.index == 4 }">
									<td class="cal_td2">11:30</td>
								</c:when>
								<c:when test="${ status.index == 5 }">
									<td class="cal_td2">12:00</td>
								</c:when>
								<c:when test="${ status.index == 6 }">
									<td class="cal_td2">13:30</td>
								</c:when>
								<c:when test="${ status.index == 7 }">
									<td class="cal_td2">14:00</td>
								</c:when>
								<c:when test="${ status.index == 8 }">
									<td class="cal_td2">14:30</td>
								</c:when>
								<c:when test="${ status.index == 9 }">
									<td class="cal_td2">15:00</td>
								</c:when>
								<c:when test="${ status.index == 10 }">
									<td class="cal_td2">15:30</td>
								</c:when>
								<c:when test="${ status.index == 11 }">
									<td class="cal_td2">16:00</td>
								</c:when>
								<c:when test="${ status.index == 12 }">
									<td class="cal_td2">16:30</td>
								</c:when>
								<c:when test="${ status.index == 13 }">
									<td class="cal_td2">17:00</td>
								</c:when>
								<c:when test="${ status.index == 14 }">
									<td class="cal_td2">17:30</td>
								</c:when>
								<c:otherwise>
									<td class="cal_td2">18:00</td>
								</c:otherwise>
							</c:choose>
							<c:forEach var="c" items="${ calList }">
								<c:if test="${ i eq c.cBeginTime }">
									<td class="cal_td3"><div class="cal_td3_div tooltip">${ c.cTitle }</div></td>
									<td class="cal_td4"><div class="cal_td4_div">${ c.pTitle }</td>
									<td class="cal_td5"><div class="cal_td5_div">${ c.cKind }</td>
									<td class="cal_td6"><div class="cal_td6_div">${ c.cPlace }</td>
									<td class="cal_td7">
										<c:if test="${ loginUser.mNo eq mNo }">
											<button class="cal_update_btn" type="button" value="${ c.cId }">수정</button>
											<button class="cal_delete_btn" type="button" value="${ c.cId }">삭제</button>
										</c:if>
										<c:if test="${ loginUser.mNo ne mNo }">
											<button class="cal_update_btn2" type="button" value="${ c.cId }">수정</button>
											<button class="cal_delete_btn2" type="button" value="${ c.cId }">삭제</button>
										</c:if>
									</td>
								</c:if>
							</c:forEach>
							<c:forEach var="t" items="${ test }">
								<c:if test="${ status.index eq t }">
		                    		<td class="cal_td3"></td>
			                        <td class="cal_td4"></td>
			                        <td class="cal_td5"></td>
			                        <td class="cal_td6"></td>
			                        <td class="cal_td7"></td>
		                    	</c:if>
		                   </c:forEach>
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
    	
    	function reloadPage() {
    	    location.reload();
    	};
    	
    	window.onload = function(){
    		$("#cal_teammember_select").val(${mNo}).prop("selected", true);
			$("#cal_deptmember_select").val(${mNo}).prop("selected", true);
    	}
    	
    	$(".cal_update_btn").click(function(){ 
    		var cId = $(this).val();
			var url = "./calOnedayUpView.do?cId="+cId;
			var name = "일정수정";
			var option = "width = 800, height = 410, left = 100, top = 50, location=no";
			window.open(url, name, option)
		});
    	
    	$(".cal_delete_btn").click(function(){ 
    		result = confirm("일정을 삭제하시겠습니까?");
    		if(result == true){
    			var cId = $(this).val();
        		location.href = "./calOnedayDelete.do?cId="+cId+"&cDate=${cDate}&mNo=${mNo}&deptCode=${loginUser.deptCode}&jTitle=${jTitle}";	
    		}
		});
    	
    	$(function(){
			$('#cal_teammember_select').change(function(){
				var mNo = $("#cal_teammember_select option:selected").val();
				var cDate = $(cDate);
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