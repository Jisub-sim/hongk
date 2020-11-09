<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<style>
.pTitle{
 width: 140px;
}	
.pmName{
	width:30px;
}
.dateString{
	width:70px;
}
.ptable{
	text-align:center;
}
</style>
<body>
	<jsp:include page="common/include.jsp"/>
	  <div id="main">
        <div id="mainwrap">
            <div class="Division" id="projecdiv">
                <div class="Divisiontext">프로젝트</div>
                <div class="projectwrap">
                <table class="projecttable">
                    <tr>
                    
                      <th class="pTitle">프로젝트 명</th>
                    
                      <th class="pmName">담당자</th>
                   
                      <th class="dateString">마감일</th>
                    </tr>
						<c:forEach var="p" items="${plist}">
						<c:url var="project" value="project.do">
							<c:param name="pId" value="${p.pId}"/>
						</c:url>
					<tr class="ptable">
						<td><a href="${project}">${p.pTitle }</a></td>
						<td>${p.mName }</td>
						<td>${p.dateString}</td>
					</tr>		
							
					</c:forEach>
                  </table>
                
                  </div>
            </div>
            
            <div class="Division" id="plandiv">
                <div class="Divisiontext">일정</div>
            </div>
            <div class="Division" id="accepdiv">
                <div class="Divisiontext">결재 대기함</div>
                <div class="projectwrap">
                    <table class="projecttable">
                         <thead>
				                <th width="5%">NO</th>
				                <th width="36%">문서제목</th>
				                <th width="10%">기안자</th>
				                <th width="10%">상태</th>
				         </thead>
				            <c:forEach var ="listWp" items="${ listWp }">
				            <c:set var="status" value="${listWp.ea_status }"/>
				            <tr>
				                <td>${listWp.ea_no }</td>
				                <td>${listWp.ea_title }</td>
				                <td>${listWp.mName }</td>
				              <c:choose>
								<c:when test="${ status eq 'B' }">
									<td>반려</td>
								</c:when>
								<c:when test="${ status eq 'C' }">
									 <td>완료</td>
								</c:when>
								<c:when test="${ status eq 'W' }">
									 <td>진행</td>
								</c:when>
								<c:when test="${ status eq 'R' }">
									<td>회수</td>
								</c:when>
							</c:choose>
				            </tr>
						</c:forEach>
                    </table>
                </div>
                
            </div>
            <div class="Division" id="noticediv">
                <div class="Divisiontext">공지사항</div>
                <div class="projectwrap">
                    <table class="projecttable">
                        <tr>
                            <th>NO</th>
                            <th>상태</th>
                            <th>제목</th>
                            <th>작성일</th>
                        </tr>
                        <tr>    
                            <th>22</th>
                            <th><i id="blink" class="fas fa-bullhorn"></i></th>
                            <th>공지사항 제목</th>
                            <th>2020/11/11</th>
                        </tr>
                        <tr>    
                            <th>22</th>
                            <th><i id="blink" class="fas fa-bullhorn"></i></th>
                            <th>공지사항 제목</th>
                            <th>2020/11/11</th>
                        </tr>
                        <tr>    
                            <th>22</th>
                            <th><i id="blink" class="fas fa-bullhorn"></i></th>
                            <th>공지사항 제목</th>
                            <th>2020/11/11</th>
                        </tr>
                        <tr>    
                            <th>22</th>
                            <th><i id="blink" class="fas fa-bullhorn"></i></th>
                            <th>공지사항 제목</th>
                            <th>2020/11/11</th>
                        </tr>
                    
                    </table>
                </div>
            </div>
        </div>
        </div> 
    

</body>
</html>
