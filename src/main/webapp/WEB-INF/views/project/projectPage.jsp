<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.project{
    width:95%;
    margin: 0 auto;
    margin-top : 10px;
}
#project_info{
    height: 200px;
}
#pro_content{
    padding-bottom: 20px;
}
#task{
    height:250px;
    width:46%;
    float:left;
    margin-left: 2.4%;
    
}
#ask{
    height:250px;
    width:46%;
    float:right;
    margin-right: 2.4%;
    
}
#progress{
    width:100px;
    height:30px;
    text-align:center;
    padding-top : 7px;
    font-weight: 700;
    background-color:skyblue;
    margin-left:0;
}
hr{
    border: 1px solid skyblue;
}
#progress{
    float:left;
}
#update{
    width:165px;
    float:right;
    border:none;
}
ul, li{
  list-style-type:none;  
}
#main_info{
    padding-top: 40px;
    padding-left:50px;
}
#main_info li{
    padding-top:10px;
}
#main_team{
    padding-left:10px;
    color:gray;
    padding-top:10px;
}
#team_table{
    border: 1px solid skyblue;
}
#team_table th{
    border-bottom:1px solid skyblue;
}
#team_table td{
    color:gray;
}
#team_table{
    text-align:center;
    margin : 0 auto;
    width: 95%;
}
#task_style th, #ask_style th{
    height:20px;
    text-align:left;
    border-bottom:1px solid skyblue;
    padding:5px;
}
#task_style, #ask_style{
    width:100%;
    padding-left:5px;
}
.plus{
    float:right;
    padding-right:5px;
}
.task_name{
    width:65%;
}
.task_mana{
    width:15%;
    text-align:center;
}
.task_date{
    width:20%;
    text-align:center;
}
#main div{
	border: 1px solid skyblue;
}
#pg{
	color:white;
}
</style>
</head>
<body>
		<jsp:include page="../common/include.jsp"/>
		
		 <div id="main">
        <div class="project" id="project_info">
            <div id="progress"><a href="javascript:clickfunction();" id="pg">진행률</a></div>
            <section id="update">
            <script>
            	function clickfunction(){
            		window.open("progress.do","a","width=400,height=150,left=100, top=50");
            	}
            </script>
            <a href>수정</a>
            /
            <a href>삭제</a>
            /
            <c:url var="teamcare" value="teamcare.do"/>
            <a href="${ teamcare }">팀관리</a>
        </section>
        <ul id="main_info">
            <li>프로젝트명 : </li>
            <li>책임자 정보(생성자) : </li>
            <li>기간 : </li>
        </ul>
        


        </div>
        <div class="project" id="pro_content">
            <li id="main_team">팀진행 현황</li>
            <hr>
            <table id="team_table">
                <th>팀명</th>
                <th>팀원수</th>
                <th>업무수</th>
                <th>진행률</th>
                <tr>
                    <td>1팀</td>
                    <td>3</td>
                    <td>5</td>
                    <td>30%</td>                    
                </tr>
                <tr>
                        <td>2팀</td>
                        <td>5</td>
                        <td>3</td>
                        <td>50%</td>                    
                    </tr>
              <tr>
                        <td>3팀</td>
                        <td>5</td>
                        <td>3</td>
                        <td>50%</td>                    
                    </tr>

            </table>

        </div>
        <div class="project" id="task">
            <table id="task_style">
                <th colspan="3">업무목록<a href="taskadd.do" class="plus">+</a></th>
                
                <tr>
                    <td class="task_name"><a href="taskclick.do">업무명</a></td>
                    <td class="task_mana">담당자</td>
                    <td class="task_date">게시일</td>
                </tr>
                <tr>
                        <td class="task_name">오늘까지 이거해라</td>
                        <td class="task_mana">담당자</td>
                        <td class="task_date">2020-10-03</td>
                    </tr>
            </table>
        </div>
        <div class="project" id="ask">
                <table id="ask_style">
                        <th colspan="3">요청사항<a href="askadd.do" class="plus">+</a></th>
                        
                        <tr>
                            <td class="task_name">업무명</td>
                            <td class="task_mana">담당자</td>
                            <td class="task_date">게시일</td>
                        </tr>
                        <tr>
                                <td class="task_name">오늘까지 이거해주세요</td>
                                <td class="task_mana">담당자</td>
                                <td class="task_date">2020-10-03</td>
                            </tr>
                    </table>

        </div>
</body>

</html>