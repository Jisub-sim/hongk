<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		
		<!-- 검색 form  -->
		<form action="EAsearch.do" name="searchCondition">
			<div include-html="common.html"></div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div id="header"></div>
			<br>
			<div class="ea_search_div">
				<label>기안자 </label> <input type="search" name="searchDrafter" value="${ search.searchDrafter }"> 
				<label>문서제목</label> <input type="search" name="searchTitle" value="${ search.searchTitle }"> 
				
				<label>문서상태 </label> 
				<select id="searchCondition" name="searchCondition">
				<option value="all"
				<c:if test="${search.searchCondition == 'all'}">selected
				</c:if>>전체</option>
				<option value="W"
				<c:if test="${search.searchCondition == 'W'}">selected
				</c:if>>진행중</option>
				<option value="C"
				<c:if test="${search.searchCondition == 'C'}">selected
				</c:if>>완료</option>
				<option value="B"
				<c:if test="${search.searchCondition == 'B'}">selected
				</c:if>>반려</option>
				<option value="R"
				<c:if test="${search.searchCondition == 'R'}">selected
				</c:if>>회수</option>
			</select>
				&nbsp; &nbsp;
				<button type="submit" class="ea_bt">검색</button>
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
						<th></th>
						<th width="5%">NO</th>
						<th width="8%">서식함</th>
						<th width="8%">유형</th>
						<th width="40%">문서제목</th>
						<th width="15%">기안일</th>
						<th width="15%">완료일</th>
						<th width="15%">상태</th>
					</thead>
					
					<c:forEach var="ea" items="${ list }">
					<tr class=" ea1">
						<td></td>
						<td>${ea.ea_no }</td>
						<td>${ea.form_category }</td>
						<td>${ea.ea_type }</td>
						<td>
							<c:url var="eadetail" value="eadetail.do">
								<c:param name="CurPage" value="RequestL"></c:param>
	                			<c:param name="ea_no" value="${ ea.ea_no }"/>
	                		</c:url>
	                		<a href="${ eadetail }">${ ea.ea_title }</a>
						</td>
						<td>
							<fmt:formatDate var="draftng_date" type="date" value="${ea.draftng_date }" pattern="yyyy-MM-dd"/>
							${draftng_date }
						</td>
						<td><fmt:formatDate var="complete_date" type="date" value="${ea.complete_date }" pattern="yyyy-MM-dd"/>
							${complete_date }</td>
						<td>
							<c:set var = "status" value="${ea.ea_status }" />
						
							<c:choose>
								<c:when test="${ status eq 'B' }">
									<label class="return_bt">반려</label>
								</c:when>
								<c:when test="${ status eq 'C' }">
									<label class="compl_bt">완료</label>
								</c:when>
								<c:when test="${ status eq 'W' }">
									<label class="pro_bt">진행</label>
								</c:when>
								<c:when test="${ status eq 'R' }">
									<label class="back_bt">회수</label>
								</c:when>
							</c:choose>
			
						</td>
					</tr>
					</c:forEach>
				<tr align="center">
				<td colspan="8">
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:if test="${ search == null }">
						<c:url var="before" value="earequest.do">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }">[이전]</a> &nbsp;
					</c:if>
					<c:if test="${ search != null }">
						<c:url var="before" value="EAsearch.do">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
							<c:param name="searchDrafter" value="${search.searchDrafter}"/>
							<c:param name="searchTitle" value="${search.searchTitle}"/>
							<c:param name="searchCondition" value="${search.searchCondition}"/>
							
						</c:url>
						<a href="${ before }">[이전]</a> &nbsp;
					</c:if>
						
				</c:if>
				<!-- 페이지 숫자 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4">[ ${ p } ]</font>
					</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:if test="${ search == null }">
								<c:url var="pagination" value="earequest.do">
									<c:param name="page" value="${ p }"/>
										</c:url>
								<a href="${ pagination }">${ p }</a> &nbsp;
							</c:if>
							<c:if test="${ search != null }">
								<c:url var="pagination" value="EAsearch.do">
									<c:param name="page" value="${ p }"/>
									<c:param name="searchDrafter" value="${search.searchDrafter}"/>
									<c:param name="searchTitle" value="${search.searchTitle}"/>
									<c:param name="searchCondition" value="${search.searchCondition}"/>
								</c:url>
								<a href="${ pagination }">${ p }</a> &nbsp;
							</c:if>
						</c:if>
				</c:forEach>
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:if test="${ search == null }">
						<c:url var="after" value="earequest.do">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url>
						<a href="${ after }">[다음]</a>
					</c:if>
						<c:if test="${ search != null }">
						<c:url var="after" value="EAsearch.do">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
							<c:param name="searchDrafter" value="${search.searchDrafter}"/>
							<c:param name="searchTitle" value="${search.searchTitle}"/>
							<c:param name="searchCondition" value="${search.searchCondition}"/>
						</c:url>
						<a href="${ after }">[다음]</a>
					</c:if>
					
				</c:if>
				</td>
			</tr>
					
				</table>
				<br>
			</div>
	</div>
	<script>
        	var message = ${ msg };
        	console.log(message);
        	if( !message.equals('')){
            	alert(message);
        	}
        	
        	var s = ${search}
        	console.log(s);
        	
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