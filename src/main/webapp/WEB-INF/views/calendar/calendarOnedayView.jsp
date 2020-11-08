<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.cal_wrap {
		margin: 10px 0 0 10px;
		padding: 0;
		width: 98%;
		height: 900px;
		border-radius: 15px;
		position: relative;
	}
	
	.cal_ymd_div {
		margin: 11px 0 0 15px;
		padding: 0px;
		border: 2px solid skyblue;
		border-radius: 10px;
		width: 170px;
		height: 45px;
		position: relative;
		display: inline-block;
	}
	
	.cal_ymd_p {
		margin: 0px;
		padding: 11px 0 0 0;
		text-align: center;
		font-size: 16px;
	}
	
	.cal_name_div {
		margin: 11px 0 0 10px;
		padding: 0;
		border: 2px solid skyblue;
		border-radius: 10px;
		width: 120px;
		height: 45px;
		position: relative;
		display: inline-block;
	}
	
	.cal_name_p {
		margin: 0px;
		padding: 11px 0 0 0;
		text-align: center;
		font-size: 16px;
	}
	
	.cal_input_div {
		margin: 0 15px 0 655px;
		padding: 0px;
		width: 100px;
		height: 48px;
		position: relative;
		display: inline-block;
	}
	
	.cal_input_btn {
		margin: 0;
		border: 2px solid skyblue;
		border-radius: 10px;
		width: 100px;
		height: 48px;
		text-align: center;
		font-size: 15px;
	}
	
	.cal_text_div {
		margin: 15px;
		padding: 0;
		width: 97.5%;
		height: 89%;
	}
	
	.cal_text_table {
		margin: 0;
		padding: 0;
		width: 100%;
		height: 100%;
		border: 2px solid skyblue;
		border-spacing: 0;
		border-collapse: collapse;
	}
	
	.cal_text_table th {
		border: 2px solid skyblue;
		background: #f0f6f9;
		font-size: 15px;
	}
	
	.cal_text_table td {
		border: 2px solid skyblue;
		text-align: center;
		font-size: 15px;
	}
</style>
</head>
<body>

	<jsp:include page="../common/include.jsp"/>
	
	<div id="main">
        <div class="cal_wrap">
            <div class="cal_ymd_div">
                <p class="cal_ymd_p">${ calyear }년 ${ calmonth }월 ${ caldate }일</p>
            </div>
            <div class="cal_name_div">
                <p class="cal_name_p">${ loginUser.mName }</p>
            </div>
            <div class="cal_input_div">
                <button class="cal_input_btn" type="button" onclick="insert_popup();">일정 입력</button>
            </div>
            <div class="cal_text_div">
                <table class="cal_text_table">
                    <tr>
                        <th>시작시간</th>
                        <th>종료시간</th>
                        <th>업무종류</th>
                        <th>프로젝트명</th>
                        <th>제목</th>
                        <th>장소</th>
                    </tr>
                    
                    <%-- <c:forTokens var="i" items="9:00,9:30,10:00,10:30,11:00,:11:30,13:00,13:30,14:00,14:30,15:00,15:30,16:00,:16:30,17:00,17:30" delims=",">
                    
	                    <td>${ i }</td> --%>
                    <c:forTokens var="j" items="9:30,10:00,10:30,11:00,11:30,13:00,13:30,14:00,14:30,15:00,15:30,16:00,16:30,17:00,17:30,18:00" delims=",">
                    <tr>
                        <td>${ j }</td>
                        <td>${ j }</td>
                    <c:forEach var="c" items="${ calList }" varStatus="status">
                    	<c:if test="${ j eq c.cEndTime }" var="test1">
                    		<td>${ c.cKind }</td>
	                        <td>${ c.cTitle }</td>
	                        <td>${ c.pTitle }</td>
	                        <td>${ c.cPlace }</td>
                    		<c:set var="test" value="1"/>
                    	</c:if>
                    </c:forEach>
                    	<c:if test="${ empty test1 }">
                    		<td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
                    	</c:if>
                    <c:if test="${ empty calList }">
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </c:if>
                    </tr>
                    </c:forTokens>
                    <%-- </c:forTokens> --%>
                </table>
            </div>
        </div>
    </div>
    
    <script>
    	function insert_popup(){
    		<c:url var="insertPopup" value="insertPopup.do"/>
    		var url = "${ insertPopup }";
    		var name = "일정등록";
    		var option = "width = 800, height = 410, left = 100, top = 50, location=no";
    		window.open(url, name, option)
    	};
    	
    	function reloadPage() {
    	    location.reload();
    	};
    	
    	/* function window.onload() {
    		var count = 0;
    		var j = "00";
    		var setTableHTML ="";
    		setTableHTML += '<table class="cal_text_table">';
    		setTableHTML += '<tr><th>시작시간</th><th>종료시간</th><th>업무종류</th><th>프로젝트명</th><th>제목</th><th>장소</th></tr>';
    		
    		for(var i = 9; i <= 18; i++){
    			if(count == 0){
    				j = "00";
    				count = 1;
    			} else if(count == 1){
    				j = "30";
    				count = 0;
    			}
    			setTableHTML += '<tr><td>i:j</td>';
    			setTableHTML += '<td>i:j</td>';
    			for(ArrayList c : calList){
    				if(c.cEndTime == j){
    					setTableHTML += '<td>c.cKind</td>';
    					setTableHTML += '<td>c.cTitle</td>';
    					setTableHTML += '<td>c.pTitle</td>';
    					setTableHTML += '<td>c.cPlace</td>';
    				} else if {
    					cal_text_div += '<td></td>';
    					cal_text_div += '<td></td>';
    					cal_text_div += '<td></td>';
    					cal_text_div += '<td></td>';
    				}
    				setTableHTML += '</tr>';
    			}
    		}
    		setTableHTML += '</table>';
    		$(".cal_text_div").html(setTableHTML);
    	}; */
    </script>
</body>
</html>