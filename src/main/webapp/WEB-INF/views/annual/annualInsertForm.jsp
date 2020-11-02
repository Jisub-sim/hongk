<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
        integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
   integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
   crossorigin="anonymous"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!--    
   // jQuery UI CSS파일 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
// jQuery 기본 js파일
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
// jQuery UI 라이브러리 js파일
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>   -->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/approvalcss.css">
       
<title>Insert title here</title>
<style>
    table.type02 {
        border-collapse: separate;
        border-spacing: 0;
        text-align: left;
        line-height: 1.5;
        border-top: 1px solid #ccc;
        border-left: 1px solid #ccc;
        margin: 20px 10px;
        margin-left:100px;
        

    }

    table.type02 th {
        width: 150px;
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
        width: 150px;
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
        margin-left:100px;
        
    }

    table.type01 th {
        width: 100px;
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

    .aunnalsm {
        margin-left: 400px;
    }

    table.type03 {
        border-collapse: collapse;
        text-align: left;
        line-height: 1.5;

    }

    table.type03 thead th {
        padding: 10px;
        font-weight: bold;
        vertical-align: top;
        color: #369;
        border-bottom: 3px solid #036;
    }

    table.type03 tbody th {
        width: 150px;
        padding: 10px;
        font-weight: bold;
        vertical-align: top;
        border-bottom: 1px solid #ccc;
        background: #f3f6f7;
    }

    table.type03 td {
        width: 350px;
        padding: 10px;
        vertical-align: top;
        border-bottom: 1px solid #ccc;
    }
    
    .btclick{
    	margin-left:100px;
    	background-color:skyblue;
    	color:white;
    	border: 1px solid whitesmoke;
    }
    
    h2{
    text-align: center;
     vertical-align: middle;
    }
</style>
</head>
<body>
<jsp:include page="../common/include.jsp" />
<div id="main">
<br>
<h2>휴가신청서</h2>
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
            <td>${ ann.annual_signupday}</td>
        </tr>
        <tr>
            <th scope="row">문서 번호</th>
            <td></td>
        </tr>
    </table>
    <form action="annTypeSelect.do" >
    <table class="type02">
        
        <tr>
        <th scope="row">제목</th>
        <td> <input type="text" name="annual_title"></td>
        </tr>
        <tr>
            <th scope="row">휴가 종류</th>
            <td><select id="annual_type" name="a_type">
                    <option selected>----</option>
                    <option value="0">연차유급휴가</option>
                    <option value="1">병가</option>
                    <option value="2">경조</option>
                    <option value="3">월차</option>
                    <option value="4">반차</option>

                </select></td>
        </tr>
        <tr>
            <th scope="row">기간 및 일시</th>
            <td>
            <!-- onchange="ceil()" -->
               	시작일 :  <input type="date" class="datepicker" name="annual_start" id="annual_start" > - 
               	종료일 : <input type="date" class="datepicker" name="annual_end" id="annual_end" >
                
                <p>사용일수 <input type="text" name="annual_day_use" id="annual_day_use"></p>
            </td>
        </tr>
        <tr>
            <th scope="row">반차 여부</th>
            <td>

               
                    
                    <p> <input type="radio" name="annual_halftime" value="am" > <span class="up">오전</span>&nbsp;
                        <input type="radio" name="annual_halftime" value="pm" > <span class="up">오후</span></p>
                         <input type="radio" name="annual_halftime" value="none" > <span class="up">없음</span></p>

            </td>
        </tr>
        <tr>
            <th scope="row">연차 일수</th>
            <td>
                <p style="width: 200px;" name="annual_day_count">전체연차수: ${ann.annual_day_count } </p>
                <p style="width: 200px;" name="annual_day_remain">잔여연차: ${ann.annual_day_remain }</p>
            </td>
        </tr>

        <tr>
            <th scope="row">휴가 사유</th>
            <td>
                <textarea type="text" style="width: 700px; height: 150px;" name="annual_content"></textarea>
            </td>
        </tr>
        
        <tr>
        <th>담당자</th>
        <td><input type="text" class="ea_line" id="managerBt" required></td>
        <input type="hidden" name="mid" id="mid" >
         <c:url var="managerList" value="managerList.do"/>
		</tr>
        <!-- <table class="type03">
            <thead>
                <tr>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">사원명</th>
                    <td>김몰라</td>
                </tr>
                <tr>
                    <th scope="row">휴가종류</th>
                    <td>연차</td>
                </tr>
                <tr>
                    <th scope="row">항목명</th>
                    <td>내용이 들어갑니다.</td>
                </tr>
            </tbody>
        </table>
 -->
 
    </table>
    
    <div class="aunnalsm">
        <button type="submit" class=" btclick">신청하기</button>
    </div>
    
    </div>
    </form>
    <script type="text/javascript">
    // 담당자 선택
           $(function(){
               $("#managerBt").click(function(){
                  window.open('${managerList}','window_name','width=1000,height=700,left=130,top=250,location=no,status=no,scrollbars=yes');
               });
            });
    </script>
<!-- <script type="text/javascript">


function calcDate() {
    var date1 = document.getElementById("#annual_start").value;

    var date2 = document.getElementById("#annual_end").value;


    var count = 0;
    


while(true) {  


    var temp_date = date1;
    if(temp_date.getTime() > date2.getTime()) {
        console.log("count : " + count);
        break;
    } else {
        var tmp = temp_date.getDay();
        if(tmp == 0 || tmp == 6) {
            // 주말
            console.log("주말");
        } else {
            // 평일
            console.log("평일");
            count++;         
        }
        temp_date.setDate(date1.getDate() + 1); 
    }
}


}
</script> -->





<!-- function calculus(){    
    var sta_ymd = document.getElementById("STA_YMD").value;        
    var sta_ymd_arr = sta_ymd.split(".");
    
    var end_ymd = document.getElementById("END_YMD").value;    
    var end_ymd_arr = end_ymd.split(".");
        
    
    var sta_ymd_obj = new Date(sta_ymd_arr[0], Number(sta_ymd_arr[1])-1, sta_ymd_arr[2]);
    var end_ymd_obj = new Date(end_ymd_arr[0], Number(end_ymd_arr[1])-1, end_ymd_arr[2]);
    
    var betweenDay = (end_ymd_obj.getTime() - sta_ymd_obj.getTime())/1000/60/60/24;
    
    document.getElementById("DT_RESULT").value = betweenDay;
} -->




    
</body>
</html>