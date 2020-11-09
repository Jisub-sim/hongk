<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="nowDate" class="java.util.Date" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
        integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
        integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
        crossorigin="anonymous"></script>
    <link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/approvalcss.css">    
 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

</head>
<style>
    table.type02 {
   		 width:90%;
        border-collapse: separate;
        border-spacing: 0;
        text-align: left;
        line-height: 1.5;
        border-top: 1px solid #ccc;
        border-left: 1px solid #ccc;
        margin: 20px 10px;
        margin-left: 100px;

    }

    table.type02 th {
        padding: 10px;
        font-weight: bold;
        vertical-align: top;
        border-right: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
        border-top: 1px solid #fff;
        border-left: 1px solid #fff;
        background: #eee;
        text-align: center;
        vertical-align: middle;
    }

    table.type02 td {
        padding: 10px;
        vertical-align: top;
        border-right: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
    }

    table.type01 {
        border-collapse: separate;
        border-spacing: 0;
        text-align: left;
        line-height: 1.5;
        border-top: 1px solid #ccc;
        border-left: 1px solid #ccc;
        margin: 20px 10px;
        margin-top:-10px;
        text-align: center;
        margin-left: 100px;
    }

    table.type01 th {
        width: 150px;
        padding: 10px;
        font-weight: bold;
        vertical-align: top;
        border-right: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
        border-top: 1px solid #fff;
        border-left: 1px solid #fff;
        background: #eee;

    }

    table.type01 td {
        width: 100px;
        padding: 10px;
        vertical-align: top;
        border-right: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
    }

    table.type11 {
        border-collapse: separate;
        border-spacing: 1px;
        text-align: center;
        line-height: 1.5;
        margin: 20px 10px;
        vertical-align: middle;
    }

    table.type11 th {
        width: 350px;
        padding: 10px;
        font-weight: bold;
        vertical-align: top;
        color: #fff;
        background: #59d4d4e0;
        vertical-align: middle;
    }

    table.type11 td {
        width: 350px;
        padding: 10px;
        vertical-align: top;
        border-bottom: 1px solid #ccc;
        background: #eee;
        vertical-align: middle;
    }

    .mypage {
        border: 3px solid #ccc;
        height: 250px;
        margin-left: 50px;
        margin-right: 50px;

    }

    .submit {
        margin-left: 750px;
    }
    
     .btclick{
    	margin-left:100px;
    	background-color:skyblue;
    	color:white;
    	border: 1px solid whitesmoke;
    	margin-left: 400px;
    }
    
      #smartEditor{
    width:100%;
    	height:35vh;
    	resize: none;
    }
</style>
</style>
<body>
<jsp:include page="../common/include.jsp" />
<div id="main">
<br>
<h2>근무신청서</h2>
<br>
<table class="type01">
        <tr>
            <th scope="row">기안자</th>
            <td>${member.mName }</td>
        </tr>
        <tr>
            <th scope="row">기안부서</th>
            <td>${member.deptTitle }</td>
        </tr>
        <tr>
            <th scope="row">기안일</th>
            <td><fmt:formatDate value="${nowDate}" pattern="yyyy-MM-dd" /></td>
        </tr>
        <!-- <tr>
            <th scope="row">문서 번호</th>
            <td></td>
        </tr> -->
    </table>
    <form action="workinsert.do" method="POST">
    <table class="type02">
    	<tr>
    		<th scope="row" width="15%">*제목</th>
    		<td width="85%"><input type="text" name="work_title"> </td>
    	</tr>
        <tr>
            <th scope="row">*근무구분</th>
            <td><select id="work_type" name="wk_type">
            	<option selected>----</option>
            	<option value="1">외근</option>
            	<option value="2">조퇴</option>
            </select></td>
        </tr>
        <tr>
            <th scope="row">*근무일</th>
            <td>
                <p><input type="date" class="datecalnder" name="work_date">
                    <!-- <input type="time" class="datetime" name="start_time"> - <input type="time" class="datetime" name="end_time"> -->
            </td>
        </tr>
        <tr>
            <th scope="row">*근무시간</th>
            <td>
                <input  type="time"class="disabledInput"  name="start_time" >- <input  type="time"class="disabledInput"  name="end_time" >
                
<!--                 type="text" placeholder="근무시간 표시" disabled -->
            </td>
        </tr>

        <tr>
            <th scope="row">*신청 사유</th>
            <td>
                 <div>
	                <textarea name="smartEditor" id="smartEditor" rows="10" cols="100" >${ form.form_content }</textarea>
	            </div>
            </td>
        </tr>
        <tr>
        <th>담당자</th>
        <td><input type="text" class="ea_line" id="managerBt" required></td>
        <input type="hidden" name="mid" id="mid" >
        <input type="hidden" name="form_no" value="${ form.form_no }">
        
         <c:url var="managerList" value="managerList.do"/>
		</tr>


    </table>
    <div class="worksm">
        <button type="submit" class=" btclick" id="savebutton">신청하기</button>
    </div>
    
    </form>
     <script type="text/javascript">
     var oEditors = [];
     nhn.husky.EZCreator.createInIFrame({ 
     	oAppRef : oEditors,
     	elPlaceHolder : "smartEditor", 
     	sSkinURI : "${pageContext.request.contextPath}/resources/se2/SmartEditor2Skin.html", //경로를 꼭 맞춰주세요! 
     	fCreator : "createSEditor2", htParams : { 
     	// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
     	bUseToolbar : true, 
     	// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
     	bUseVerticalResizer : false, 
     	// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
     	bUseModeChanger : false
     	} 
     }); 
     
     $(function() { 
 		$("#savebutton").click(function() { 
 			oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []); 
 			var content = document.getElementById("smartEditor").value;
 			document.getElementById("smartEditor").setAttribute('name','ea_content' );

 			var result = confirm("등록 하시겠습니까?"); 
 			if(result){ 
 				
 			}else{ 
 				return; 
 			} 
 		}); 
 	})
     
    // 담당자 선택
           $(function(){
               $("#managerBt").click(function(){
                  window.open('${managerList}','window_name','width=1000,height=700,left=130,top=250,location=no,status=no,scrollbars=yes');
               });
            });
    </script>
    
    </div>
    
    
    
</body>
</html>