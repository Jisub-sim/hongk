<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#projectList{
		width : 95%;
		border:2px solid skyblue;
		margin : 0 auto;
	}
	#projectList th{
		background-color: lightgray;
	}
	#pm{
		width: 60%;
	}
	#date{
		width:10%;
	}
	.l1{
		text-align:center;
	}
	#mp_h3font{
		font-size: 20px;
		margin-left: 20px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/include.jsp"/>
	<div id="main">
	<h3 id="mp_h3font">내 프로젝트 관리</h3>
		<table id="projectList">
			<th>코드명</th>
			<th id="pm">프로젝트명</th>
		
			<th class="l1">상태</th>
			<th id="date" class="l1">마감일</th>
			<c:forEach var="p" items="${ list }">
			<tr>
				<td class="l1">${ p.pId }</td>
				<td><c:url var="project" value="project.do">
						<c:param name="pId" value="${ p.pId }"/>
					</c:url>
				<a href="${ project }">${ p.pTitle }</a></td>
				<td class="l1"><c:if test="${ p.progress eq 'I'}">진행중</c:if>
				<c:if test="${ p.progress eq 'S'}">보류</c:if>
				<c:if test="${ p.progress eq 'C'}">완료</c:if></td>
				<td class="l1">${ p.dateString }</td>
			</tr>
			</c:forEach>
		</table>
		
		
	
	</div>

</body>
</html>