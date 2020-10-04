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
  height: 100%;
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
    border:2px solid skyblue;
    margin-left:91%;
    position:fixed;
    top:200px;
    
    
}
    </style>
</head>
<body>
    <nav id="header">
        <div id="logo_div">
            <i class="fab fa-accusoft"></i>
            <a href="" id="logo_font">Hongk</a>
        </div>
            <c:url var="project" value="project.do"/>
        <ul id="navi_font">
            <li><a href="" class="navi_font">전자결재</a></li>
            <li><a href="${ project }" class="navi_font">프로젝트</a></li>
            <li><a href="" class="navi_font">일정관리</a></li>
            <li><a href="" class="navi_font">게시판</a></li>
            <li><a href="" class="navi_font">마이페이지</a></li>
        </ul>    
    </nav>

   <div class="sidebar">
      <header>
        <img src="/img/pro.jpg" width="140px" height="140px" />
        <h4>이다희/ 과장 / 인사과</h4>
      </header>
      <h3 id="sideTitle">게시판</h3>
      <ul>
        <li><a href="notice.html" style="color: orange">공지사항</a></li>
        <li><a href="propose.html">제안 게시판</a></li>
        <li><a href="department.html">부서 게시판</a></li>
        <li><a href="free.html">자유 게시판</a></li>
      </ul>
    </div>
    
    <div id="icon_menu">

        </div>
    <!-- <div id="main">


        </div> -->
</body>
</html>