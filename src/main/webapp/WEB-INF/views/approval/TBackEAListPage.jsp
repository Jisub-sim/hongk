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
  #ea_bt_div{
            width: 90%;
            margin: auto;

        }

        #ea_de_bt{
            float: right;
        }

        #menubar{
            width: 100%
        }
</style>
</head>
<body>
   <jsp:include page="../common/include.jsp" />

   <div id="main">
      <br>
      <br>
    <div class="ea_search_div">
        <label>문서제목 </label>  <input type="text"> &nbsp;
        <label> 양식명 </label>  <input type="text">   &nbsp;
      
        <button type="button" class="ea_bt"> 검색</button>
    </div>
    <br>
    <br><p style="width:90%;margin:auto;">반려 문서함 </p>
			 <hr style="width:90%"><br>
    <div>
        <table class="ea_table">
            <thead>
            <th><input type="checkbox"></th>
            <th>NO</th>
            <th>서식함</th>
            <th>문서제목</th>
            <th>기안부서</th>
            <th>등록일</th>
            </thead>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
        <br>
        <div id="ea_bt_div">
        <button id="ea_de_bt" class="ea_bt"> 삭제</button>
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
   </div>

</body>
</html>