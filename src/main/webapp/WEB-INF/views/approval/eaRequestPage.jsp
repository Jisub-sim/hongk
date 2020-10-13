<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Page Title</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/approvalcss.css">
<style>
#ea_de_bt {
	float: right;
}

#ap_status_p {
	width: 30%;
	margin-left: 72%;
}

#ea_bt_div {
	width: 90%;
	margin: auto;
}
/* 결재 상태 스타일(진행, 완료, 반려, 회수) */
.return_bt {
	background: rgb(255, 114, 114);
	border-radius: 5px;
	margin: 0;
	padding: 0.1em;
	padding-left: 0.6em;
	padding-right: 0.6em;
	color: white;
}

.pro_bt {
	background: rgb(113, 175, 251);
	border-radius: 5px;
	margin: 0;
	padding: 0.1em;
	padding-left: 0.6em;
	padding-right: 0.6em;
	color: white;
}

.compl_bt {
	background: rgb(97, 221, 143);
	border-radius: 5px;
	margin: 0;
	padding: 0.1em;
	padding-left: 0.6em;
	padding-right: 0.6em;
	color: white;
}

.back_bt {
	background: rgb(250, 194, 73);
	border-radius: 5px;
	margin: 0;
	padding: 0.1em;
	padding-left: 0.6em;
	padding-right: 0.6em;
	color: white;
}
</style>
</head>
<body>
	<jsp:include page="../common/include.jsp" />

	<div id="main">
		<br>
		<form>
			<div include-html="common.html"></div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div id="header"></div>
			<br>
			
			<div class="ea_search_div">
				<label>기안자 </label> <input type="text"> <label>문서제목
				</label> <input type="text"> <label>문서상태 </label> <select>
					<option>-----</option>
					<option>진행중</option>
					<option>완료</option>
					<option>반려</option>
					<option>회수</option>

				</select> &nbsp; &nbsp;
				<button type="button" class="ea_bt">검색</button>
			</div>
			<br> <br>
			<p style="width:90%;margin:auto;">결재 요청함 </p>
			 <hr style="width:90%">
			<div>

				<p id="ap_status_p">
					<label class="pro_bt">진행</label> &nbsp; <label class="compl_bt">완료</label>&nbsp;
					<label class="return_bt">반려</label>&nbsp; <label class="back_bt">회수</label>
				</p>

				<table class="ea_table">
					<thead>
						<th><input type="checkbox"></th>
						<th>NO</th>
						<th>서식함</th>
						<th>유형</th>
						<th>문서제목</th>
						<th>기안일</th>
						<th>완료일</th>
						<th>상태</th>
					</thead>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><label class="return_bt">반려</label></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><label class="pro_bt">진행</label></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><label class="pro_bt">진행</label></td>
					</tr>


				</table>
				<br>
				<div id="ea_bt_div">
					<button id="ea_de_bt" class="ea_bt">삭제</button>
				</div>
			</div>
	</div>
	<script>
            $(function(){
                $(".ea_table td").mouseenter(function(){
                    $(this).parent().css({"cursor":"pointer"});
                    $(this).parent().css({"background":"lightgray", "font-weight":"bold"});
                }).mouseleave(function(){
                    $(this).parent().css({"background":"white", "font-weight":"normal"});
                });
            });
        </script>
</body>
</html>