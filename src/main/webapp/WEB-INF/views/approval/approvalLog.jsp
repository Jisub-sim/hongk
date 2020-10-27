<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>결재 로그</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
   integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
   crossorigin="anonymous"></script>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/approvalcss.css">
<style>
        #form_close_div{
            width: 90%;
            margin: auto;
            text-align: center;
            vertical-align: middle;
        }
        
        #form_cl_bt{
            margin-bottom: 1em;
        }
          .ea_subtitle {
            width: 90%;
            margin: auto;
            padding: 0.5em;
        }
</style>
</head>
<body>

   <div id="main">
    <div>
		<p class="ea_subtitle">결재 로그 </p>
        <table class="ea_table" style="width:100%;">
            <thead>
            <th width="20%">부서명</th>
            <th width="20%">사원명</th>
            <th width="20%">결재상태</th>
            <th width="20%">결재일</th>
        </thead>
        <c:forEach var="list" items="${ list }">
        <c:set var="stauts" value="${ list.approval_status }"/>
            <tr style="height:50px;">
                <td>${ list.deptTitle }</td>
                <td>${ list.mName }</td>
                <c:if test="${ stauts eq 'Y' }">
            		<td style="color: darkgreen">결재</td>
            	</c:if>
                 <c:if test="${ stauts eq 'N' }">
            		<td  style="color: darkred;">반려</td>
            	</c:if>
                <td><fmt:formatDate var="approval_date" type="date" value="${list.approval_date }" pattern="yyyy-MM-dd"/>
							${approval_date }</td>
            </tr>
                
		</c:forEach>
        </table>
        <br>
        <div id="form_close_div">
            <button id="form_cl_bt" class="ea_bt" onclick="wclose();"> 닫기 </button>
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
            
            function wclose(){
            	 window.close();  
            }
        </script>
   </div>

</body>
</html>