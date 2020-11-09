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
    overflow:scroll;
}
#ask{
    height:250px;
    width:46%;
    margin-right: 2.4%;
    overflow:scroll;
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
    width:110px;
    float:right;
    border:none;
}
ul, li{
  list-style-type:none;  
}
#main_info{
    padding-top: 20px;
    padding-left:80px;
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
    width:50%;
}
.task_mana{
    width:15%;
    text-align:center;
}
.task_status{
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
		 <form name="data" id="data" method="post">
		 	<input type="hidden" name="pId" id="pId" value="${p.pId}"/>
		 </form>
        <div class="project" id="project_info">
            <div id="progress"><a href="#" onClick="clickfunction();" id="pg">
            	<c:if test="${ p.progress eq 'I'}">진행중</c:if>
				<c:if test="${ p.progress eq 'S'}">보류</c:if>
				<c:if test="${ p.progress eq 'C'}">완료</c:if>
            </a></div>
            <c:url var="progress" value="progress.do">
            	<c:param name="pId" value="${ p.pId }"/>
            </c:url>
            
            <section id="update">
            <script>
            	function clickfunction(){            		
            		window.open("${progress}","a","width=400,height=150,left=100, top=50");
            		
            		var frm = document.data;            		
            		/* frm.submit(); */
            	}
            </script>
            <c:url var="proUpdateForm" value="proUpdateFrom.do">
            	<c:param name="pId" value="${p.pId}"/>
            </c:url>
            <a href="${proUpdateForm}">수정</a>
            /
            <c:url var="teamcare" value="teamcare.do">
            	<c:param name="pId" value="${ p.pId }"/>
            </c:url>
            <a href="${ teamcare }">팀관리</a>
        </section>
        <ul id="main_info">
            <li>프로젝트명 : ${ p.pTitle } </li>
            <li>내용 : ${ p.pContent }
            <li>책임자 정보(생성자) : ${ p.mName }</li>
            <li>기간 : ${ p.dateString } ~ ${ p.pdateString }</li>
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
                <c:forEach var="pt" items="${ pt }">
                <tr>                
                    <td>${ pt.ptTitle }</td>
                    <td>${ pt.mCount }</td>
                    <td><c:if test="${ pt.tCount == null }">0</c:if>
                  	<c:if test="${ pt.tCount != null }">${ pt.tCount }</c:if>
                    </td>
                    <td>${pt.persent}%</td>                    
                </tr>
              	</c:forEach>
            </table>

        </div>
        <c:url var="taskaddForm" value="taskaddForm.do">
        		<c:param name="pId" value="${p.pId}"/>
        </c:url>
        <div class="project" id="task">
            <table id="task_style">
                <th colspan="4">업무목록<a href="${taskaddForm}" class="plus">+</a></th>
                  <c:if test="${tl.isEmpty()}">
                       	<tr><td>요청사항이 없습니다.</td></tr>
                      </c:if>
                      <c:if test="${!tl.isEmpty()}">
                <c:forEach var="tl" items="${tl}">
                <tr>                
               		<c:url var="task" value="taskClick.do">
						<c:param name="twId" value="${tl.twId}"/>
						<c:param name="pId" value="${p.pId}"/>
					</c:url>
                    <td class="task_name"><a href="${task}">${tl.twTitle}</a></td>
                    <c:if test="${tl.manager ne null}">
                    <td class="task_mana">${tl.manager}</td>
                    </c:if>
          
                    <c:if test="${tl.manager eq null }">
                    <td class="task_mana"></td>
                    </c:if>
					<td class="task_status">
					<c:if test="${tl.twStatus eq 'Y'}">
					미완료
					</c:if>
					<c:if test="${tl.twStatus eq 'N' }">
					완료
					</c:if>
					</td>
                    <td class="task_date">${tl.twEnd}</td>
                </tr>
                </c:forEach>
                </c:if>
             <!--    <tr>
                        <td class="task_name">오늘까지 이거해라</td>
                        <td class="task_mana">담당자</td>
                        <td class="task_status">상태</td>
                        <td class="task_date">2020-10-03</td>
                    </tr> -->
            </table>
        </div>
        <div class="project" id="ask">
                <table id="ask_style">
                <c:url var="askaddForm" value="askaddForm.do">
        		<c:param name="pId" value="${p.pId}"/>
        	</c:url>
                        <th colspan="4">요청사항<a href="${askaddForm}" class="plus">+</a></th>
                       <c:if test="${!rqList.isEmpty()}">
                       
                     	 <c:forEach var="rq" items="${rqList}">
                        <tr>
                        <c:url var="askclick" value="askClick.do">
								<c:param name="trId" value="${rq.trId}"/>
								<c:param name="pId" value="${p.pId}"/>
							</c:url>
                        
                                <td class="task_name"><a href="${askclick}">${rq.trTitle}</a></td>
                                <c:if test="${rq.trManager eq 0 }">
                                	<td class="task_mana">담당자없음</td> 
                                </c:if>
                                <c:if test="${rq.trManager ne 0}">
                                	<td class="task_mana">${rq.manager}</td>
                                </c:if>
                                
                                <td class="task_status">${rq.trType}</td>
                         		<td class="task_date">${rq.trDate}</td>
                            </tr>
                            
                      </c:forEach>
                      </c:if>
                      <c:if test="${rqList.isEmpty()}">
                       	<tr><td>요청사항이 없습니다.</td></tr>
                      </c:if>
                    </table>

        </div>
</body>

</html>