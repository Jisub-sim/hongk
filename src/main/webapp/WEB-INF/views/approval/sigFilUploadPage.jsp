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
 #sig_div{
            border: solid rgb(31, 64, 96) 1px;
            width: 730px;
            height: 180px;
        }
        #sig_title{
            border: solid rgb(31, 64, 96) 1px;
            background:  rgb(156, 192, 236);
            padding-top: 0.5em;
            padding-bottom: 0.5em;
            font-size: 1.5em;
            color: white;
            width: 730px;
        }

        #cancelBt{
            float: right;
            font-size: 1.5em;
            background: none;
            border: none;
            color: white;
            margin-right: 0.5em;
        }
       
        .Nbt{
            background: white;
            color: rgb(105, 136, 199);
        }
        
        .uploadBt{
            width: 60px;
            padding: 0.3em;
            margin-left: 0.7em;
            float: right;
        }
        
        .uploadBt:hover{
            background: rgb(47, 74, 128);
            border: 2px solid rgb(47, 74, 128);
            color: white;
            cursor: pointer;
        }

        #imagefileupload{
            width: 80%;
            border: solid rgb(47, 74, 128) 1px;
            margin-left: 5%;
        }

        #sig_div ul{
            font-size: 15px;
        }

        #sig_bt_div{
            width: 90%;
            margin: auto;
        }
</style>
</head>
<body>

   <div id="main">
       <div id="sig_title">&nbsp;&nbsp;이미지 업로드 <button id="cancelBt" type="button">X</button></div>
    <div id="sig_div">
        <br>
        <input type="file" id="imagefileupload">
        <br>
            <ul>
                <li>파일 권장 용량 : 100Kbte</li>
                <li>Image 파일 가로 길이 : 60Pixel</li>
            </ul>
        <div id="sig_bt_div">
            <button class="ea_bt uploadBt Ybt"  >등록</button>
            <button class="ea_bt uploadBt Nbt" >취소</button>
        </div>    
        <br>
    </div>
   
   </div>

</body>
</html>