<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"/>
<title>Insert title here</title>
<style>
	#main{
	    height:100%;
	    width:97%;
	    margin:10px 0 0 10px;
	    border-radius : 10px 10px 10px 10px;
	    /* background-color:skyblue; */
	    border:2px solid skyblue;
	    padding-bottom:20px;
	}
	
	
	
	.cal_category{
	    margin: 10px 0 0 10px;
	    font-size: 35px;
	}
	.cal_table{
	    width: 96%;
	    margin: 10px 0 0 10px;
	    font-size: 18px;
	}
	.cal_td1{
	    width: 140px;
	}
	.cal_td1_p{
	    margin: 4px 0 0 10px;
	}
	
	.cal_wrap input, select{
	    border: 2px solid skyblue;
	    height: 38px;
	    font-size: 17px;
	    font-weight: 100;
	    border-radius: 5px;
	}
	.cal_title{
	    width: 100%;
	    margin: 0 0 0 0;
	    padding: 0 0 0 5px;
	}
	#cal_startdate{
	    width: 120px;
	    margin: 15px 5px 0 0;
	    padding: 2px 0 0 5px;
	    display: inline-block;
	}
	#cal_starttime {
	    width: 120px;
	    margin: 0 10px 0 0;
	}
	#cal_endtime{
		width: 120px;
	    margin: 0 0 0 10px;;
	    padding: 0 0 0 5px;
	}
	.cal_pname{
	    width: 100%;
	    margin: 15px 0 0 0;
	    font-size: 17px;
	    font-weight: 300;
	}
	.cal_type{
	    width: 100%;
	    margin: 15px 0 0 0;
	    padding: 0 0 0 5px;
	}
	.cal_location{
	    width: 100%;
	    margin: 15px 0 0 0;
	    padding: 0 0 0 5px;
	}
	.cal_submit{
		margin: 15px 0 0 0;
	}
</style>
</head>
<body>
	<div id="main">
        <h3 class="cal_category">일정 수정</h3><br>
        <div class="cal_wrap">
        <form action="<c:url value="calOnedayUpdate.do"/>" id="cal_form" name="cal_form" onsubmit="return checkAll()">
	        <input type="hidden" name="cId" value="${ cal.cId }">
            <table class="cal_table">
                <tr>
                    <td class="cal_td1"><p class="cal_td1_p">제목</p></td>
                    <td class="cal_td2"><input class="cal_title" name="cTitle" value="${ cal.cTitle }"></td>
                </tr>
                <tr>
                    <td class="cal_td1"><p class="cal_td1_p">날짜</p></td>
                    <td class="cal_td2">
                        <input type="text" id="cal_startdate" name="cDate" value="${ cal.cDate }">
						<select id="cal_starttime" name="cBeginTime">
							<c:forTokens var="i" items="9,10,11,13,14,15,16,17" delims=",">
								<option value="${ i }:00">${ i }:00</option>
								<option value="${ i }:30">${ i }:30</option>
							</c:forTokens>
						</select>
                            ~
                        <input type="text" id="cal_endtime" name="cEndTime" readonly>
                    </td>
                </tr>
                <tr>
                    <td class="cal_td1"><p class="cal_td1_p">프로젝트명</p></td>
                    <td class="cal_td2">
                        <select class="cal_pname" name="pTitle">
                        	<c:forEach var="p" items="${ list }">
                            <option>${ p.pTitle }</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="cal_td1"><p class="cal_td1_p">업무종류</p></td>
                    <td class="cal_td2">
                        <input class="cal_type" name="cKind" value="${ cal.cKind }">
                    </td>
                </tr>
                <tr>
                    <td class="cal_td1"><p class="cal_td1_p">장소</p></td>
                    <td class="cal_td2">
                        <input class="cal_location" name="cPlace" value="${ cal.cPlace }">
                    </td>
                </tr>
                <tr>
                	<td class="cal_td1" colspan="2" align="center"><input class="cal_submit" type="submit" value="등록하기" onclick="close_popup();"></td>
                </tr>
            </table>
        </form>
        </div>
    </div>

    <script>
        $(function () {
			$("#cal_startdate").datepicker({
                dateFormat: 'yy-mm-dd',
                showMonthAfterYear: true,
                changeYear: true,
				changeMonth: true,
				dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
				dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
				monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
				monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
			});
        });
        
        function checkAll() {
        	var frm = document.cal_form;
        	
        	if(frm.cTitle.value == ''){
        		alert('제목을 입력하세요.');
        		frm.cTitle.focus();
        		return false;
        	} else if(frm.cDate.value == ''){
        		alert('날짜를 입력하세요.');
        		frm.cDate.focus();
        		return false;
        	} else if(frm.cKind.value == '') {
        		alert('업무종류를 입력하세요.');
        		frm.cKind.focus();
        		return false;
        	} else if(frm.cPlace.value == ''){
        		alert('장소를 입력하세요.');
        		frm.cPlace.focus();
        		return false;
        	}
        	
        return true;
    	
        }
        
        /* function close_popup(){
        	document.getElementById('cal_form').action = 'calOnedayUpdate.do';
        	document.getElementById('cal_form').submit();
        } */
        
        jQuery(function($) {
        	var targetText1 = "${ cal.cBeginTime }";
        	var targetText2 = "${ cal.cEndTime }";
        	var targetText3 = "${ cal.pTitle }";
        	var targetVal1 = $('#cal_starttime option:contains(' + targetText1 + ')').val();
        	var targetVal3 = $('.cal_pname option:contains(' + targetText3 + ')').val();
        	$('#cal_starttime').val(targetVal1);
        	$('#cal_endtime').val(targetText2);
        	$('.cal_pname').val(targetVal3);
        });
        
        $(function(){
			$('#cal_starttime').change(function(){
				var etime = $("#cal_starttime option:selected").val();
				var etime2 = etime.split(":");
				
				var t = etime2[0];
				var m = etime2[1];
				var etime3 = "";
				if(m == "00"){
					var etime3 = t+":30";
				}else{
					var etime3 = parseInt(t)+1+":00";
				}
				
				$('#cal_endtime').val(etime3);
			});
		});


    </script>
</body>
</html>