<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <option>진행률</option>
        <option>진행중</option>
        <option>보류</option>
        <option>완료</option>
    </select>
    <br>
    <div id="progress_btn">
    <button id="progress_save">저장</button>

    <button id="progress_cancel">취소</button>
</div>
</div>
</body>
</html>