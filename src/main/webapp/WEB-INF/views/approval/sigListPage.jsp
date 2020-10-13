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
        #sig_div1{
            border: solid rgba(89, 118, 223, 0.184) 1px;
            width: 85%;
            margin: auto;
        }

        #select_sig_table{
            border: solid rgba(89, 118, 223, 0.184) 1px;
            width: 85%;
            margin: auto;
            height: 60px;
            padding: 0;
        }
        
        #select_sig_table td{
            font-size: 15px;
            height: 60px;
          
        }

        #select_sig_table td:first-child{
            background: rgba(183, 209, 241, 0.313);
            text-align: center;
            vertical-align: middle;
        }
        

        #sig_table td{
            height: 50px;
        }
       
        #uploadBt{
            float: right;
        }
        
        .sig_img{
            width: 60px;
            height: 60px;
            border: 1px solid black;            
        }
</style>
</head>
<body>
   <jsp:include page="../common/include.jsp" />

   <div id="main">
      <br>
   <br>
    <div id="sig_div1">
        <ul>
            <li>이미지 권장 크기는 가로*세로=60*60픽셀, 용량 100kbyte 입니다.</li>
            <li>확장자는 jpg, gif, png 이미지를 등록 하셔야 합니다.</li>
            <li>이미지명은 영문, 숫자사용을 권장합니다.</li>
         </ul>
    </div>
    <br>
        <table id="select_sig_table">
            <tr>
            <td width="20%">서명이미지</td>
            <td width="60%"><img href="" class="sig_img"></td>
            </tr>
        </table>

    <br>

	<c:url var="siginsertPage" value="siginsertPage.do"/>
    <div id="ea_bt_div"><button class="ea_bt" id="uploadBt" type="button" 
    		onclick="window.open('${siginsertPage}','window_name','width=700,height=300,location=no,status=no,scrollbars=yes');"> 업로드 </button></div>
    <br><br>
    <table class="ea_table" id="sig_table">
        <thead>
            <th width="10%">NO</th>
            <th width="55%">서명이미지</th>
            <th width="25%">등록일</th>
            <th width="10%">기본사용</th>
        </thead>
        <tr>
            <td></td>
            <td><img href="" class="sig_img"></td>
            <td></td>
            <td></td>
        </tr>
    </table>
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