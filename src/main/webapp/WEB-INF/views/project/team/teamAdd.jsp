<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	ul,li{
    list-style-type: none;
}
#back{
    float:left;
    padding-left : 50px;
    padding-top : 20px;
}
#save{
    float:right;
    padding : 20px;
    margin-right:80px;
}
#team_create{
    margin-left: 100px;
    margin-top: 70px;
}
#team_create table{
    margin-left:-5px;
    text-align:left;
}
#team_create li{
    padding-bottom: 20px;
}

#m1{
    padding-left:40px;
    width:400px;    
}
#m2{
    width:350px;
}
#team_create th{
    font-weight: 500;
}
#tn{
    margin-left:50px;
}
#content{
    margin-left:50px;
    margin-top:15px;
    font-size : 20px;
}
.mem{
    margin-left:87px;
    height:250px;
    width:350px;
    float:left;
    
}
.choose{
    height:250px;
    width:350px;
    margin-left:490px;
}
.plus{
    width:20px;
    height:20px;
    position:absolute;
    text-align:center;
    padding-bottom:5px;
    margin-left: 455px;
    margin-top: 80px;
}
.plus a,.minus a{
    color:skyblue;
    font-weight: 800;
}
.minus{
    width:20px;
    height:20px;
    position: absolute;
    text-align: center;
    padding-bottom:5px;
    margin-left:455px;
    margin-top:130px;
}
textarea:focus, input:focus{
    outline: 0;
}
#main div{
	border : 2px solid skyblue;
}
</style>
</head>
<body>
	<jsp:include page="../../common/include.jsp" />
	
	   <div id="main">
        <li>
            <a href="teamcare.do" id="back">뒤로가기</a> <a href="" id="save">저장</a>
        </li>
        <ul id="team_create">
            <li>팀명   <input type="text" size="100" id="tn" style="border:2px solid skyblue;"></li>
            <table><th id="m">팀구성</th>
                <th id="m1">대상자</th>
                <th id="m2">선택목록</th>
            </table>
            <div class="mem">
            <table>
            	
            <c:forEach var="m" items="${ m }">
         		
         	</c:forEach>
            </table>
            </div>
            <div class="plus"><a href="">+</a></div>
            <div class="minus"><a href="">-</a></div>
            <div class="choose"></div>
            
            <table><tr><td>내용</td>
                <td><textarea id="content" cols="71" rows="10" style="border:2px solid skyblue;"></textarea></td></tr></table>

        </ul>


    </div>

</body>
</html>