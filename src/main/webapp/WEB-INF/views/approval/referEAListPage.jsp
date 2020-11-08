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

</style>
</head>
<body>
   <jsp:include page="../common/include.jsp" />

   <div id="main">
      <br>
     <br>
     <form action="RFEAsearch.do">
    <div class="ea_search_div">
        <label>기안자 </label>  <input type="search" name="searchDrafter">
        <label>문서제목 </label> <input type="search" name="searchTitle">
        <label> 양식명 </label>  <input type="search" name="searchFormName">
        <button type="submit" class="ea_bt" id="ea_search_bt"> 검색</button>
    </div>
    </form>
    <br><br><p style="width:90%;margin:auto;">참조 문서함 </p>
			 <hr style="width:90%"><br>
    <div>
        <table class="ea_table">
            <thead>
            <th width="5%">NO</th>
            <th width="7%">서식함</th>
            <th width="7%">유형</th>
            <th width="36%">문서제목</th>
            <th width="10%">기안자</th>
            <th width="10%">기안부서</th>
            <th width="10%">기안일</th>
        </thead>
        <c:forEach var="ea" items="${ list }">
            <tr>
                <td>${ea.ea_no }</td>
                <td>${ea.form_category }</td>
                <td>${ea.ea_type }</td>
                <td>
                	<c:url var="eadetail" value="eadetail.do">
                	  	<c:param name="CurPage" value="refer"></c:param>
	                	<c:param name="ea_no" value="${ ea.ea_no }"/>
	                </c:url>
	                <a href="${ eadetail }">${ ea.ea_title }</a>
                </td>
                <td>${ea.mName }</td>
                <td>${ea.deptTitle }</td>
                <td><fmt:formatDate var="draftng_date" type="date" value="${ea.draftng_date }" pattern="yyyy-MM-dd"/>
					${draftng_date }</td>
            </tr>
		</c:forEach>
		  	<tr align="center">
				<td colspan="7">
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="referEAList.do">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				<!-- 페이지 숫자 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4">[ ${ p } ]</font>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="referEAList.do">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="referEAList.do">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<a href="${ after }">[다음]</a>
				</c:if>
				</td>
			</tr>
        </table>

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
   </div>

</body>
</html>