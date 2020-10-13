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

</style>
</head>
<body>
   <jsp:include page="../common/include.jsp" />

   <div id="main">
      <br>
     <br>
    <div class="ea_search_div">
        <label>기안자 </label>  <input type="text">
        <label>문서제목 </label>  <input type="text">
        <label> 양식명 </label>  <input type="text">
        <button type="button" class="ea_bt" id="ea_search_bt"> 검색</button>
    </div>
    <br><br><p style="width:90%;margin:auto;">참조 문서함 </p>
			 <hr style="width:90%"><br>
    <div>
        <table class="ea_table">
            <thead>
            <th width="5%"><input type="checkbox"></th>
            <th width="5%">NO</th>
            <th width="7%">서식함</th>
            <th width="7%">유형</th>
            <th width="36%">문서제목</th>
            <th width="10%">기안자</th>
            <th width="10%">기안부서</th>
            <th width="10%">기안일</th>
            <th width="10%">배정일</th>
        </thead>
            <tr>
                <td><input type="checkbox"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
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