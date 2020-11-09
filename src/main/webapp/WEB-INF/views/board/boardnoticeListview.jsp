<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>noticeboard</title>
<script src="https://kit.fontawesome.com/5218f6fd6d.js"
	crossorigin="anonymous"></script>
<!--아이콘 참조 사이트 font awesome-->
</head>

<style>

/* 게시판 타이틀 */
.noticeTitle {
	font-size: 25px;
}

#searchArea {
	
}

#searchArea>input {
	width: 200px;
}

#searchimg {
	width: 30px;
	background-color: white;
	border: none;
}

.noticewrap {
	width: 90%;
	margin: auto;
}

#boardTable {
	width: 100%;
	border-collapse: collapse;
}

#boardTable th {
	background-color: rgb(217, 241, 255);
}

#boardTable td {
	text-align: center;
	font-size: 14pt;
	border-bottom: 0.5px solid gray;
}

/* 글쓰기 버튼///////////////////////////////////////////////////// */
.newcontent {
	background-color: green;
	color: white;
	border-radius: 5px;
	width: 80px;
	height: 30px;
	float: right;
	margin-right: 110px;
}

a:link {
	text-decoration: none;
	color: blue;
}

a:visited {
	text-decoration: none;
	color: black;
}

a:active {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: underline;
	color: black;
}

#bell{

}

#blink{
color: red;
	-webkit-animation:blink 0.5s ease-in-out infinite alternate;
    -moz-animation:blink .5s ease-in-out infinite alternate;
    animation:blink .5s ease-in-out infinite alternate;
}
@-webkit-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@-moz-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}

</style>



<body>
	<c:import url="../common/include.jsp" />
	<section id="main">
		<div class="section">
			<h1 class="noticeTitle">&emsp;&emsp;&emsp;&emsp;공지사항</h1>
			<br />
			<br />
			<!-- 검색 에리어 /////////////////////////////////// -->
			<div id="searchArea" align="center">
				<form action="nsearch.do" name="searchCondition">
					<select id="searchCondition" name="searchCondition">
						<option value="all"
							<c:if test="${search.searchCondition == 'all'}">selected
				</c:if>>전체</option>
						<option value="title"
							<c:if test="${search.searchCondition == 'title'}">selected
				</c:if>>제목</option>
						<option value="content"
							<c:if test="${search.searchCondition == 'content'}">selected
				</c:if>>내용</option>
					</select> <input type="search" name="searchValue"
						value="${ search.searchValue }" placeholder="검색" />
					<button id="searchimg">
						<img
							src="${pageContext.request.contextPath}/resources/img/loupe.png" />
					</button>
					<br />
				</form>
			</div>

			<br />
			<br />
			<!-- 게시글 리스트 /////////////////////////////////////// -->
			<div class="noticewrap">
				<table id="boardTable">
					<tr>
						<th></th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
					<c:forEach var="n" items="${ list }">
						<tr>
							<td>
							<c:if test="${n.b_Level == 1 }"><i id="blink" class="fas fa-bullhorn"></i></c:if>
							</td>
							<td>
								<c:if test="${ !empty loginUser }">
									<c:url var="bdetail" value="bdetail.do">
										<c:param name="bId" value="${ n.bId }" />
										<c:param name="page" value="${ pi.currentPage }" />
									</c:url>
									<a href="${ bdetail }">${ n.bTitle }</a>
								</c:if>
								<c:if test="${ empty loginUser }">
									${ n.bTitle }
								</c:if>
							</td>
								<td>${ n.createDate }</td>
							</tr>
					</c:forEach>
				</table>
			</div>

			<br />
			<!--  글 쓰기 버튼   -->
			<c:if test="${ !empty loginUser }">
				<button class="newcontent" onclick="location.href='binserView.do'">글쓰기</button>
			</c:if>
			<br />
			<br />

			<!-- 페이징 처리  -->
			<div align="center" height="20">
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="blist.do">
						<c:param name="page" value="${ pi.currentPage - 1 }" />
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				<!-- 페이지 숫자 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4">[ ${ p } ]</font>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="blist.do">
							<c:param name="page" value="${ p }" />
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="blist.do">
						<c:param name="page" value="${ pi.currentPage + 1 }" />
					</c:url>
					<a href="${ after }">[다음]</a>
				</c:if>
			</div>
	</section>
</body>
</html>