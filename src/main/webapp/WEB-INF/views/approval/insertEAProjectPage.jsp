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
   <div id="includedContent"></div>

    <br>
    <p id="form_title">프로젝트</p>
    <br><Br>
    <table class="ea_table" border="1" id="ea_create_table" >
    <tr>
        <td width="15%">기안자</td>
        <td width="35%"><input type="text"></td>
        <td width="15%">기안일자</td>
        <td width="35%"><input type="text"></td>
    </tr>
    <tr>
        <td>담당자</td>
        <td><input type="text" class="ea_line"></td>
        <td>기안부서</td>
        <td><input type="text" ></td>
    </tr>
    <tr>
        <td>기간</td>
        <!-- 기간 선택 -->
        <td><input type="time" class="ea_line"></td>
        <td>구분</td>
        <td><input type="text"></td>
    </tr>
    <tr>
        <td>제목</td>
        <td colspan="3"><input type="text"></td>
        
    </tr>
    <tr></tr>
    <tr>
        <td colspan="4" style="background: white">
            <div>
                <pre style="text-align:left; width: 90%; margin:auto;">




 사유

    다음와 같이 품의를 올리오니, 검토 후 바랍니다.

                          - 다 음 -

    1.1 첨부 문서 :



    2. 위와 같은 내용을 품의 후 결정 동시에 시행 하겠습니다.


                                                -끝-

                </pre>
                
            </div>
        </td>
    </tr>
    <tr></tr>
    <tr><td colspan="4" style="text-align: left;"> &nbsp; 파일 업로드 </td></tr>
    <tr><td colspan="4" style=" background: white"><input type="file"></td></tr>
    </table>
    <br>
    
    <div id="ea_control_bt_div">
        <button type="button" class="ea_bt">저장/결재</button> 
        <button type="button" class="ea_bt">임시저장</button>
        <button type="button" class="ea_bt">취소</button>
    </div>
    <br>
    <br> <br>
   </div>

</body>
</html>