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
    
    #ea_create_table textarea{
        width: 99%;
        resize: none;
        border: none;
    }

     #ea_create_table textarea::-webkit-scrollbar{
        display: none; 
    }
</style>
</head>
<body>
   <jsp:include page="../common/include.jsp" />

   <div id="main">
      <br>
   <div id="includedContent"></div>

    <br>
    <p id="form_title"> 품 의 서</p>
    <br><Br>
    <table class="ea_table" border="1" id="ea_create_table" >
    <tr>
        <td width="15%">기안자</td>
        <td width="35%"></td>
        <td width="15%">기안일자</td>
        <td width="35%"></td>
    </tr>
    <tr>
        <td>결재자</td>
        <td class="ea_line"></td>
        <td >기안부서</td>
        <td></td>
    </tr>
    <tr>
        <td>참조자</td>
        <td class="ea_line"></td>
        <td>구분</td>
        <td></td>
    </tr>
    <tr>
        <td>제목</td>
        <td colspan="3"><input type="text"></td>
        
    </tr>
    <tr></tr>
    <tr>
        <td colspan="4" style="background: white">
            <div>
               <textarea onkeyup="adjustHeight();">




               </textarea>
               
            </div>
        </td>
    </tr>
    <tr></tr>
    <tr><td colspan="4" style="text-align: left;"> &nbsp; 파일 업로드 </td></tr>
    <tr><td colspan="4" style=" background: white"><br><input type="file"></td></tr>
    </table>
    <br>
    
    <div id="ea_control_bt_div">
        <button type="button" class="ea_bt">취소</button> 
        <button type="button" class="ea_bt">완료</button>
    </div>
     <script>
    function adjustHeight() {
            var textEle = $('textarea');
            textEle[0].style.height = 'auto';
            var textEleHeight = textEle.prop('scrollHeight');
            textEle.css('height', textEleHeight);
            };

            var textEle = $('textarea');
            textEle.on('keyup', function() {
            adjustHeight();
            });


    </script>
   </div>

</body>
</html>