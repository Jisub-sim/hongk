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

        #form_title{
        text-align: center;
        font-size: 25px;
        font-weight: 500;
    }

     #ea_create_table{
         border-color:  rgba(183, 209, 241, 0.313);
         width: 80%;
     }
     #ea_create_table input{
         width: 98%;
         border: none;
         height: 100%;
     }
     #ea_create_table td:nth-child(odd){
        background: rgb(241, 241, 241);
        font-weight: bold;
     }
    #ea_control_bt_div {
        margin: auto;
        width: 80%;
    }
    #ea_control_bt_div button{
      
       float: right;
       margin-left: 1em;
    }
    .ea_line:hover{
        cursor: pointer;
        outline: 1px solid gray;
    }
</style>
</head>
<body>
   <jsp:include page="../common/include.jsp" />

   <div id="main">
      <br>
   <br>
    <p id="form_title">${ form.form_name }</p>
    <br><Br>
    <table class="ea_table" border="1" id="ea_create_table">
        <tr>
            <td width="15%">양식명</td>
            <td width="35%">${ form.form_name }</td>
            <td width="15%">서식함</td>
            <td width="35%">${ form.form_category }</td>
        </tr>
        <tr>
            <td>양식유형</td>
            <td>${ form.form_type }</td>
        </tr>
        <tr></tr>
        <tr>
            <td colspan="4" style="background: white">
                <div>
                    <pre style="text-align:left; width: 90%; margin:auto;"><br>${ form.form_content }<br></pre>
                </div>
            </td>
        </tr>
        <tr></tr>
    </table>
    <br>
	<c:url var="formList" value="formList.do"/>
	<c:url var="insertEAPage" value="insertEAPage.do">
		<c:param name="fid" value="${ form.form_no }"/>
	</c:url>
    <div id="ea_control_bt_div">
        <button type="button" class="ea_bt" onclick="location.href='${ insertEAPage }'">양식 사용</button>
        <button type="button" class="ea_bt" onclick="location.href='${ formList }'">목록</button>
    </div>
    <br>
    <br> <br>
   </div>

</body>
</html>