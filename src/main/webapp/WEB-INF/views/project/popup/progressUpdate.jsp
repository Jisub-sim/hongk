<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>상태변경</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    #progress_div{
        margin-left:70px;
        margin-top:50px;
    }
    #progress{
        width:250px;
        height:25px;
    }
    #progress_btn{
        margin-top:20px;
        margin-left:65px;
    }
    #progress_save{
        margin-right:30px;
    }
    </style>
</head>
<body>
    <div id="progress_div">
    <select id="progress">
        <option value="null">진행상태</option>
        <option value="I">진행중</option>
        <option value="S">보류</option>
        <option value="C">완료</option>
    </select>
    <br>

    <div id="progress_btn">
    <input type="button"  onClick="" id="progress_save" value="저장"/>
	<input type="button" onClick="window.close()" id="progress_cancel" value="취소"/>
    <input type="hidden" id="pId" value="${pId}">
    <script>
   		$("#progress_save").on("click", function(){
    		var progress = $("#progress option:selected").val();
    		var pId = $("#pId").val();
    		console.log(progress);
    		opener.location.href="progressUpdate.do?pId="+pId+"&progress="+progress;
    		window.close();
   			
   		});	
   	
    </script>
</div>
</div>
</form>
</body>
</html>