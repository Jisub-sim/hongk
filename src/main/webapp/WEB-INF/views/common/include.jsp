<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=<device-width>, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
    <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
    <!-- <link rel="stylesheet" href="gw.css"> -->
    <script src="https://kit.fontawesome.com/5218f6fd6d.js" crossorigin="anonymous"></script>
    <!--아이콘 참조 사이트 font awesome-->
    
    <style>
    @import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap");
	
	body {
	  margin: 2;
	  font-family: "Noto Sans KR", sans-serif;
	}
   
 
a {
    text-decoration: none;
}
#header{
    display:flex;
    border-radius : 10px 10px 10px 10px;
    box-shadow: inset 1px -2px 1px   skyblue, 1px 3px 1px   skyblue;
    justify-content: space-between;
    align-items:center;
}
#logo_div{
    margin-left : 10px;
    display: flex;

}
#logo_font{
    text-decoration: none;
    font-size: 25px;
    font-weight: 800;
    width:auto;
}
#logo_div i{
    margin-right: 5px;
    padding-top:10px;
    color:skyblue;
}
#navi_font{
    text-align:center;        
    padding:0;
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-right:50px;
    padding-left:0;
    }
#navi_font li{
    list-style:none;
    font-weight: 600;
    padding: 8px 20px;
    width:80px;
    
    
}
.navi_font:hover{
    background-color:skyblue;
    border-radius:4px;
}
.navi_font{
    color:rgb(105, 112, 169);
}

.sidebar * {
  margin: 10px;
  padding: 0;
}
.sidebar {
  margin-top: 10px;
  border-radius: 15px;
  float: left;
  left: 0;
  width: 200px;
  height: 100vh;
  background-color: skyblue;
}

.sidebar header {
  text-align: center;
  border-bottom: 1px solid black;
}

.sidebar img {
  border-radius: 70px;
}

#sideTitle {
  padding: 15px;
  color: black;
}
.sidebar ul {
  list-style: none;
  text-decoration: none;
  border-radius: 15px;
  background-color: white;
  box-shadow: black 1px 1px 1px;
}

.sidebar ul a {
  display: block;
  padding: 15px;
  color: black;
  padding-left: 10px;
  box-sizing: border-box;
  transition: 0.4s;
}

.sidebar ul li:hover a {
  padding-left: 40px;
  color: orange;
  font-weight: bold;
}

.sidebar ul a i {
  margin-right: 16px;
}
#main{
    height:100vh;
    width:75%;
    margin-top:15px;
    margin-left: 220px;
    border-radius : 10px 10px 10px 10px;
    /* background-color:skyblue; */
    border:2px solid skyblue;
    padding-bottom:200px;

}
#icon_menu{
    width:80px;
    height:200px;
    border:3px solid skyblue;
    margin-left:91%;
    position:fixed;
    top:200px;
    border-radius:20px;
    background-color:bisque;
    
    
    
}
#icon_menu i{
	font-size:50px;
	color:white;
	padding-left:12px;
	padding-top:15px;
}
#login_area{
	margin-left:0;
}
#find_idpwd{
	font-size:12px;
	width:60%;
	margin-left:0;
	padding:0;
}
#login_btn{
	font-size:12px;
	width:40%;	
}
    </style>
</head>
<body>
	<c:if test="${ !empty msg }">
		<script>alert('${msg}');</script>
		<c:remove var="msg"/>
	</c:if>


    <nav id="header">
        <div id="logo_div">
            <i class="fab fa-accusoft"></i>
            <a href="" id="logo_font">Hongk</a>
        </div>
        	<c:url var="approval" value="app.do"/>
            <c:url var="project" value="project.do"/>
        <ul id="navi_font">
            <li><a href="${ approval }"class="navi_font">전자결재</a></li>
            <li><a href="${ project }" class="navi_font">프로젝트</a></li>
            <li><a href="" class="navi_font">일정관리</a></li>
            <li><a href="" class="navi_font">게시판</a></li>
            <li><a href="" class="navi_font">마이페이지</a></li>
        </ul>    
    </nav>

   <div class="sidebar">
      <header>
      <c:if test="${ empty sessionScope.loginUser }">
     	<form action="login.do" method="post">
        <table id="login_area">
        	<tr>
        		<td>I  D</td>
        		<td><input type="text" size="13" name="mId"></td>
        	</tr>
        	<tr>
        		<td>PWD</td>
        		<td><input type="password" size="13" name="mPwd"></td>
        	</tr>
        	<tr>
        		<td colspan="2"><a href="" id="find_idpwd">아이디/비밀번호 찾기</a>
        		 <a href="" onclick="document.forms[0].submit();return false;" id="login_btn">로그인</a></td>
        	</tr>
        </table>
        </form>
        </c:if>
        <c:if test="${ !empty sessionScope.loginUser }">
        	<img src="/img/pro.jpg" width="140px" height="140px" />
        <h4>${ loginUser.mName } / ${ loginUser.jobCode } / ${ loginUser.deptCode }</h4>
        <c:url var="logout" value="logout.do"/>
       	<a href="${logout}">로그아웃</button>
        </c:if>
      </header>
      <h3 id="sideTitle">게시판</h3>
       <!--   
      <ul>
        <li><a href="notice.html" style="color: orange">공지사항</a></li>
        <li><a href="propose.html">제안 게시판</a></li>
        <li><a href="department.html">부서 게시판</a></li>
        <li><a href="free.html">자유 게시판</a></li>
        <li><a href="myProject.do">내 프로젝트보기</a></li>
      </ul>
      
      -->
           
        <c:url var="formList" value="formList.do"/>
<!--     formList  approverList    -->
        <c:url var="earequest" value="earequest.do"/>
        <c:url var="temporEAList" value="temporEAList.do"/>
        <c:url var="wEAList" value="wEAList.do"/>
        <c:url var="progressEAList" value="progressEAList.do"/>
        <c:url var="completeEAList" value="completeEAList.do"/>
        <c:url var="TBackEAList" value="TBackEAList.do"/>
        <c:url var="referEAList" value="referEAList.do"/>
        <c:url var="sigList" value="sigList.do"/>
        <c:url var="FormInsertPage" value="FormInsertPage.do"/>
        <ul>
        <li><br><b>기안</b></li>
        <li><a href="${ formList }">기안문 작성</a></li>
        <li><a href="${ earequest }">결재 요청함</a></li>
        <li><a href="${ temporEAList }">임시 저장함</a></li>
        <li><br><b>결재</b></li>
        <li><a href="${ wEAList }">결재대기함</a></li>
        <li><a href="${ progressEAList }">결재진행함</a></li>
        <li><a href="${ completeEAList }">완료문서함</a></li>
        <li><a href="${ TBackEAList }">반려문서함</a></li>
        <li><a href="${ referEAList }">참조문서함</a></li>
        <li><br><b>기타</b></li>
        <li><a href="${ sigList }">서명관리</a></li>
        <li><a href="${ FormInsertPage }">양식 추가</a></li>
      </ul> 
      
    </div>
    
    <div id="icon_menu">
			<i class="fas fa-comments"></i>
        </div>
    <!-- <div id="main">


        </div> -->
</body>
</html>