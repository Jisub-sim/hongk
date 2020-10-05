<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul, li {
	list-style-type: none;
}

#back {
	float: left;
	padding-left: 20px;
}

#save {
	float: right;
	margin-right: 80px;
}

.project_name {
	width: 95%;
	margin: 0 auto;
	margin-top: 30px;
}

#pt {
	border: 1px solid skyblue;
	width: 100%;
}

.project_name table th {
	font-weight: 500;
	border-right: 1px solid skyblue;
}

.project_name table td {
	border: 1px solid skyblue;
}

#tn {
	width: 100px;
}

#tm {
	width: 100px;
}

#tc {
	width: 500px;
}

#status {
	width: 100px;
}

#ptn {
	color: gray;
	margin-left: 50px;
}

#button {
	height: 20px;
}

hr {
	border: 1px solid skyblue;
}

.status_btn {
	text-align: center;
}

textarea:focus, input:focus {
	
}
textarea:focus, input:focus{
    outline: 0;
}
</style>
</head>
<body>
	<jsp:include page="../../common/include.jsp" />

	<div id="main">
		<div id="button">
			<ul><c:url var="teamadd" value="teamadd.do"/>
				<li><a href="project.do" id="back">뒤로가기</a> <a href="${ teamadd }" id="save">팀추가</a>
				</li>

			</ul>
		</div>
		<hr>
		<h3 id="ptn">프로젝트명</h3>

		<div class="project_name">
			<table id="pt">
				<th id="tn">팀명</th>
				<th id="tm">팀원</th>
				<th id="tc">내용</th>
				<th id="status">편집</th>
				<tr>
					<td>1팀</td>
					<td>팀장<br>팀원<br>팀원
					</td>
					<td>파이널 프로젝트 팀관리 내용</td>
					<td class="status_btn"><a href="">수정</a> / <a href="">삭제</a></td>
				</tr>
				<tr>
					<td>2팀</td>
					<td>팀장<br>팀원<br>팀원
					</td>
					<td>파이널 프로젝트 팀관리 내용</td>
					<td class="status_btn"><a href="">수정</a> / <a href="">삭제</a></td>
				</tr>
			</table>
		</div>



	</div>
</body>
</html>