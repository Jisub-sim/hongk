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
 #form_insert_div{
            width: 90%;
            margin: auto;
          
        }
        
        #form_in_bt{
            float: right;
            margin-bottom: 1em;
        }
</style>
</head>
<body>
   <jsp:include page="../common/include.jsp" />

   <div id="main">
      <br>
      <br>
    <div class="ea_search_div" id="Test">
    	<form action="formsearch.do">
        <label> 양식명 </label>  <input id="fns" type="text" name="searchFormName" value="${ search.searchFormName }">
        <button type="submit" class="ea_bt" id="ea_search_bt"> 검색</button>
  		</form>
    </div>
    
    <br>
    <br>
    
    <p style="width:90%;margin:auto;">기안문 작성 > 서식 선택 </p>
    <hr style="width:90%"><br>
    <div>
<!--         <div id="form_insert_div"> -->
<!--             <button id="form_in_bt" class="ea_bt" > 추가 </button> -->
<!--         </div> -->
        <table class="ea_table">
            <thead>
            <th width="5%">NO</th>
            <th width="7%">유형</th>
            <th width="7%">서식함</th>
            <th width="36%">양식명</th>
        </thead>
        <c:forEach var="f" items="${ list }">
            <tr>
                <td>${ f.form_no }</td>
                <td>${ f.form_type }</td>
                <td>${ f.form_category}</td>
                <td>
                	<c:url var="formdetail" value="formdetail.do">
                		<c:param name="fid" value="${ f.form_no }"/>
                	</c:url>
                	<a href="${ formdetail }">${ f.form_name }</a>
                
                </td>
            </tr>
		</c:forEach>
		  	<tr align="center">
				<td colspan="4">
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="formList.do">
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
						<c:url var="pagination" value="formList.do">
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
					<c:url var="after" value="formList.do">
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