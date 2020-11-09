<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/include.css">
<script src="https://kit.fontawesome.com/5218f6fd6d.js"
	crossorigin="anonymous"></script>
<!--아이콘 참조 사이트 font awesome-->
</head>
<style>
@charset "UTF-8";

@import
	url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap")
	;

body {
	margin: 2;
	font-family: "Noto Sans KR", sans-serif;
}

a {
	text-decoration: none;
}

#header {
	display: flex;
	border-radius: 10px 10px 10px 10px;
	box-shadow: inset 1px -2px 1px skyblue, 1px 3px 1px skyblue;
	justify-content: space-between;
	align-items: center;
}

#logo_div {
	margin-left: 10px;
	display: flex;
}

#logo_font {
	text-decoration: none;
	font-size: 25px;
	font-weight: 800;
	width: auto;
}

#logo_div i {
	margin-right: 5px;
	padding-top: 10px;
	color: skyblue;
}

#navi_font {
	text-align: center;
	padding: 0;
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-right: 50px;
	padding-left: 0;
}

#navi_font li {
	list-style: none;
	font-weight: 600;
	padding: 8px 20px;
	width: 80px;
}

.navi_font:hover {
	background-color: skyblue;
	border-radius: 4px;
}

.navi_font {
	color: rgb(105, 112, 169);
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

#main {
	height: 100%;
	width: 75%;
	margin-top: 15px;
	margin-left: 220px;
	border-radius: 10px 10px 10px 10px;
	/* background-color:skyblue; */
	border: 2px solid skyblue;
	padding-bottom: 200px;
}

#icon_menu {
	width: 80px;
	height: 200px;
	border: 3px solid skyblue;
	margin-left: 91%;
	position: fixed;
	top: 200px;
	border-radius: 20px;
	background-color: bisque;
}

#icon_menu button {
	font-size: 50px;
	color: white;
	background-color: bisque;
	border: none;
	border-radius: 15px;
	padding-left: 12px;
	padding-top: 15px;
}

#login_area {
	margin-left: 0;
}

#find_idpwd {
	font-size: 12px;
	width: 60%;
	margin-left: 0;
	padding: 0;
}

#login_btn {
	font-size: 12px;
	width: 40%;
}

/* 
채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 
채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 
채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 채팅창 
--> */
.modal {
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	opacity: 0;
	visibility: hidden;
	transform: scale(1.1);
	transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform
		0.25s;
}
/* modal-content * { margin: 0px; padding: 0px; } */
.modal-content {
	position: absolute;
	top: 20%;
	left: 80%;
	transform: translate(-50%, -50%);
	width: 500px;
	height: 350px;
	border-radius: 0.5rem;
}

.close-button {
	float: right;
	margin-top: 82px;
	margin-right: 110px;
	width: 1.1rem;
	line-height: 1.1rem;
	text-align: center;
	cursor: pointer;
	border-radius: 50%;
	background-color: green;
}

.close-button:hover {
	background-color: red
}

.show-modal {
	opacity: 1;
	visibility: visible;
	transform: scale(1.0);
	transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s;
}

#chatbox {
	border: 1px solid gray;
	width: 290px;
	background: #fff;
	border-radius: 6px;
	overflow: hidden;
	height: 484px;
	position: absolute;
	top: 100px;
	left: 50%;
	margin-left: -155px;
}

#friendslist {
	position: absolute;
	width: 290px;
	height: 484px;
	overflow-y: scroll;
}

#topmenu {
	display: flex;
	padding: 0px;
	margin: 0px;
	height: 60px;
	width: 290px;
	border-bottom: 1px solid #d8dfe3;
}

.friend {
	height: 70px;
	border-bottom: 1px solid #e7ebee;
	position: relative;
}

.friend:hover {
	background: #f1f4f6;
	cursor: pointer;
}

.friend img {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	margin: 15px;
	float: left;
}

.floatingImg {
	width: 40px;
	border-radius: 50%;
	position: absolute;
	top: 0;
	left: 12px;
	border: 3px solid #fff;
}

.friend p {
	margin-top: 8px;
	padding: 0px;
	float: left;
	width: 220px;
}

.friend p strong {
	font-weight: 600;
	font-size: 15px;
	color: #597a96;
}

.friend p span {
	font-size: 13px;
	font-weight: 400;
	color: #aab8c2;
}

.friend .status {
	background: #26c281;
	border-radius: 50%;
	width: 9px;
	height: 9px;
	position: absolute;
	top: 31px;
	right: 17px;
}

.friend .status.away {
	background: #ffce54;
}

.friend .status.inactive {
	background: #eaeef0;
}

#search {
	background: #e3e9ed
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/search.png")
		-11px 0 no-repeat;
	height: 65px;
	width: 290px;
	bottom: 0;
	left: 0;
}

#searchfield {
	background: #e3e9ed;
	margin: 21px 0 0 55px;
	border: none;
	padding: 0;
	font-size: 14px;
	font-weight: 400px;
	color: #8198ac;
}

#searchfield:focus {
	outline: 0;
}


/* <!-- //////////////////////////////////////////////////////////////////////////////// ////////////////////////////////////////////////////////////////////////////////
                채팅창 디테일 css 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --> */
#chatview {
	width: 290px;
	height: 484px;
	position: absolute;
	top: 100px;
	left: 96px;
	display: none;
	background: #fff;

}
/* <!-- //////////////////////////////////////////////////////////////////////////////// ////////////////////////////////////////////////////////////////////////////////
                채팅창  디테일 상단  프로필
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --> */
#profile {
	height: 50px;
	overflow: hidden;
	text-align: center;
	background: skyblue;
	color: #fff;
}

.roomName {
	margin-top: 5px;
}
/* <!-- //////////////////////////////////////////////////////////////////////////////// ////////////////////////////////////////////////////////////////////////////////
                채팅방 프로필 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --> */
#chat-messages {
	width: 290px;
	height: 373px;
	overflow-y: scroll;
	overflow-x: hidden;
	padding-right: 20px;
}

#chat-messages label {
	color: #aab8c2;
	font-weight: 600;
	font-size: 12px;
	text-align: center;
	margin: 15px 0;
	width: 290px;
	display: block;
}

#chat-messages div.message {
	padding: 0 0 30px 58px;
	clear: both;
	margin-bottom: 45px;
}

#chat-messages div.message.right {
	padding: 0 58px 30px 0;
	/* /*  */
	margin-right: -19px;
	margin-left: 19px;
}

#chat-messages .message img {
	float: left;
	margin-left: -38px;
	border-radius: 50%;
	width: 30px;
	margin-top: 12px;
}

#chat-messages div.message.right img {
	float: right;
	margin-left: 0;
	margin-right: -20px;
}

.message .bubble {
	background: #f0f4f7;
	font-size: 13px;
	margin-top: 5px;
	font-weight: 600;
	padding: 10px;
	border-radius: 5px 5px 5px 0px;
	color: #8495a3;
	position: relative;
	float: left;
}

#chat-messages div.message.right .bubble {
	float: right;
	border-radius: 5px 5px 0px 5px;
}

.bubble .corner {
	background:
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/bubble-corner.png")
		0 0 no-repeat;
	position: absolute;
	width: 7px;
	height: 7px;
	left: -5px;
}

div.message.right .corner {
	background:
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/bubble-cornerR.png")
		0 0 no-repeat;
	left: auto;
	right: -5px;
}

.bubble span {
	color: #aab8c2;
	font-size: 11px;
	position: absolute;
	right: 0;
	bottom: -22px;
}

#sendmessage {
	height: 60px;
	border-top: 1px solid #e7ebee;
	position: absolute;
	bottom: 0;
	right: 0px;
	width: 290px;
	background: #fff;
	padding-bottm: 50px;
}

.tomId {
	display: none;
}

/* <!-- //////////////////////////////////////////////////////////////////////////////// ////////////////////////////////////////////////////////////////////////////////
                채팅창 디테일 텍스트 에리어
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --> */
#sendmessage input {
	background: #fff;
	border: none;
	margin: 2px;
	height: 70px;
	width: 210px;
	padding: 0;
	font-size: 14px;
	font-weight: 400px;
	color: black;
}

#sendmessage input:focus {
	outline: 0;
}

#sendmessage button {
	background: blue;
	font-size: 16px;
	width: 60px;
	height: 50px;
	padding: 0px;
	position: absolute;
	right: 15px;
	top: 5px;
}

#sendmessage button:hover {
	cursor: pointer;
	background-position: 0 0;
}

#sendmessage button:focus {
	outline: 0;
}

#close {
	position: absolute;
	top: 8px;
	opacity: 0.8;
	right: 10px;
	width: 20px;
	height: 20px;
	cursor: pointer;
}

#close:hover {
	opacity: 1;
	color: red;
}

.cx, .cy {
	background: #fff;
	position: absolute;
	width: 0px;
	top: 15px;
	right: 15px;
	height: 3px;
	-webkit-transition: all 250ms ease-in-out;
	-moz-transition: all 250ms ease-in-out;
	-ms-transition: all 250ms ease-in-out;
	-o-transition: all 250ms ease-in-out;
	transition: all 250ms ease-in-out;
}

.cx.s1, .cy.s1 {
	right: 0;
	width: 20px;
	-webkit-transition: all 100ms ease-out;
	-moz-transition: all 100ms ease-out;
	-ms-transition: all 100ms ease-out;
	-o-transition: all 100ms ease-out;
	transition: all 100ms ease-out;
}

.cy.s2 {
	-ms-transform: rotate(50deg);
	-webkit-transform: rotate(50deg);
	transform: rotate(50deg);
	-webkit-transition: all 100ms ease-out;
	-moz-transition: all 100ms ease-out;
	-ms-transition: all 100ms ease-out;
	-o-transition: all 100ms ease-out;
	transition: all 100ms ease-out;
}

.cy.s3 {
	-ms-transform: rotate(45deg);
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
	-webkit-transition: all 100ms ease-out;
	-moz-transition: all 100ms ease-out;
	-ms-transition: all 100ms ease-out;
	-o-transition: all 100ms ease-out;
	transition: all 100ms ease-out;
}

.cx.s1 {
	right: 0;
	width: 20px;
	-webkit-transition: all 100ms ease-out;
	-moz-transition: all 100ms ease-out;
	-ms-transition: all 100ms ease-out;
	-o-transition: all 100ms ease-out;
	transition: all 100ms ease-out;
}

.cx.s2 {
	-ms-transform: rotate(140deg);
	-webkit-transform: rotate(140deg);
	transform: rotate(140deg);
	-webkit-transition: all 100ms ease-out;
	-moz-transition: all 100ms ease-out;
	-ms-transition: all 100ease-out;
	-o-transition: all 100ms ease-out;
	transition: all 100ms ease-out;
}

.cx.s3 {
	-ms-transform: rotate(135deg);
	-webkit-transform: rotate(135deg);
	transform: rotate(135deg);
	-webkit-transition: all 100ease-out;
	-moz-transition: all 100ms ease-out;
	-ms-transition: all 100ms ease-out;
	-o-transition: all 100ms ease-out;
	transition: all 100ms ease-out;
}

#chatview, #sendmessage {
	overflow: hidden;
	border-radius: 6px;
}

#mainwrap {
	padding: 30px;
	display: flex;
	justify-content: space-between;
	justify-items: center;
	flex-wrap: wrap;
}

#mainwrap {
	padding: 30px;
	display: flex;
	justify-content: space-between;
	justify-items: center;
	flex-wrap: wrap;
}

.Division {
	margin: 10px;
	width: 430px;
	height: 350px;
	text-align: center;
	border-radius: 5px;
}

.Divisiontext {
	background-color: skyblue;
	padding: 5px;
	height: 30px;
	border-radius: 10px 10px 0px 0px;
	font-size: 20px;
}

.projecttable {
	width: 100%;
	border-collapse: collapse;
	border-bottom: 1px solid gray;
}

.projecttable th {
	padding: 3px;
	border-bottom: 1px solid gray;
}

/* ///////////////전자 결재 아코디언 스타일/////////////////// */
.Eawrapper ul li:hover a {
	padding-left: 10px;
	color: black;
	font-weight: nomal;
}

.Eawrapper ul li a:hover {
	padding-left: 16px;
	font-weight: blod;
	color: rgb(105, 136, 199);
}

.eaMainMenu {
	display: block;
	border-radius: 10px;
}

.item {
	overflow: hidden;
}

/* 기안, 결재, 기타 */
.eabtn {
	display: block;
	position: relative;
}

/* 내용물들*/
.subMenu {
	overflow: hidden;
	transition: max-height 0.7s;
	max-height: 0;
}

.subMenu a {
	display: block;
	font-size: 14px;
	position: relative;
}

.subMenu a:last-child {
	border: none;
}

.item:target .subMenu {
	max-height: 20em;
}

/* 아코디언 스타일 끝 */

/* 출퇴근 기록 */
        .workstart {
            width: 50px;
            height: 30px;
            border-radius: 5px;
            /*  border:1px soid White; */
            border: none;
            font-weight: bold;
            font-size: 10px;
            color: White;
            background-color: rgba(36, 236, 203, 0.897);
            float:left;
        }

        .workend {
            width: 50px;
            height: 30px;
            border-radius: 5px;
            border: none;
            border: 1px soid White;
            font-weight: bold;
            font-size: 10px;
            color: White;
            background-color: rgba(193, 138, 238, 0.966);
            
        }

</style>
<body>
	<c:if test="${ !empty msg }">
		<script>alert('${msg}');</script>
		<c:remove var="msg" />
	</c:if>
	<nav id="header">
		<div id="logo_div">
			<c:url var="home" value="home.do"/>
			<i class="fab fa-accusoft"></i> <a href="${home }" id="logo_font">Hongk</a>
		</div>
		<c:url var="approval" value="app.do">
			<c:param name="pageurlnum" value="1" />
		</c:url>
		<c:url var="project" value="myProject.do">
			<c:param name="pageurlnum" value="2" />
		</c:url>
		<c:url var="calendar" value="calendar.do">
			<c:param name="deptCode" value="${ loginUser.deptCode }" />
			<c:param name="mNo" value="${ loginUser.mNo }" />
			<c:param name="pageurlnum" value="3" />
		</c:url>
		<c:url var="attlist" value="attlist.do">
			<c:param name="pageurlnum" value="4" />
		</c:url>
		<c:url var="board" value="blist.do">
			<c:param name="pageurlnum" value="5" />
		</c:url>

		<ul id="navi_font">
			<li id="1"><a href="${ approval }" class="navi_font">전자결재</a></li>
			<li id="2"><a href="${ project }" class="navi_font">프로젝트</a></li>
			<li id="3"><a href="${ calendar }" class="navi_font">일정관리</a></li>
			<li id="1"><a href="${ attlist }" class="navi_font">근태관리</a></li>
			<li id="1"><a href="${ board }" class="navi_font">게시판</a></li>
			<li id="1"><a href="" class="navi_font"> 정보수정</a></li>
			<li> <c:if test="${ loginUser.mLevel <= 2 }">
               		<a href="${ MemberJoin }" class="navi_font">사원등록</a>
           		 </c:if>
            </li>
		</ul>
	</nav>

	<div class="sidebar">
		<header>
			<c:if test="${ empty sessionScope.loginUser }">
				<form action="login.do" method="post">
					<table id="login_area">
						<tr>
							<td>ID</td>
							<td><input type="text" size="13" name="mId"></td>
						</tr>
						<tr>
							<td>PWD</td>
							<td><input type="password" size="13" name="mPwd"></td>
						</tr>


						<tr>
							<td colspan="2"><a href="" id="find_idpwd">아이디/비밀번호 찾기</a><br>
								<button href=""
									onclick="document.forms[0].submit();return false;"
									id="login_btn">로그인</button>
						</tr>
					</table>
				</form>
			</c:if>


			<c:if test="${ !empty sessionScope.loginUser }">
				<c:if test="${ !empty sessionScope.file }">
					<img
						src="${pageContext.request.contextPath}/resources/ProfileFileUpload/${ file.reName_FileName }">
				</c:if>
				<c:if test="${ empty sessionScope.file }">
					<img
						src="${pageContext.request.contextPath}/resources/ProfileFileUpload/profileDefault.PNG"
						width="140px" height="140px" />
				</c:if>
				<h4>${ loginUser.mName }/${ loginUser.jobTitle }/ ${ loginUser.deptTitle }</h4>
				<c:url var="logout" value="logout.do" />
				<button><a href="${logout}">로그아웃</a></button>
			</c:if>
		</header>

		<c:if test="${ pageurlnum1 == 1 }">
		<!-- 전자결재 -->
		<c:url var="formList" value="formList.do" />
		<c:url var="earequest" value="earequest.do" />
		<c:url var="temporEAList" value="temporEAList.do" />
		<c:url var="wEAList" value="wEAList.do" />
		<c:url var="progressEAList" value="progressEAList.do" />
		<c:url var="completeEAList" value="completeEAList.do" />
		<c:url var="TBackEAList" value="TBackEAList.do" />
		<c:url var="referEAList" value="referEAList.do" />
		<c:url var="sigList" value="sigList.do" />
		<c:url var="FormInsertPage" value="FormInsertPage.do" />

		<div class="Eawrapper">
			<ul class="eaMainMenu">
				<li class="item" id="account"><a href="#account" class="eabtn"><b>기안</b></a>
					<div class="subMenu">
						<a class="eamenu" href="${ formList }">기안문 작성</a> <a
							class="eamenu" href="${ earequest }">결재 요청함</a> <a class="eamenu"
							href="${ temporEAList }">임시 저장함</a>
					</div></li>
				<li class="item" id="about"><a href="#about" class="eabtn"><b>결재</b></a>
					<div class="subMenu">
						<a href="${ wEAList }">결재대기함</a> <a href="${ progressEAList }">결재진행함</a>
						<a href="${ completeEAList }">완료문서함</a> <a href="${ TBackEAList }">반려문서함</a>
						<a href="${ referEAList }">참조문서함</a>
					</div></li>
				<li class="item" id="support"><a href="#support" class="eabtn"><b>기타</b></a>
					<div class="subMenu">
						<a href="${ sigList }">서명관리</a>
						<c:if test="${ loginUser.mLevel <= 2 }">
							<a href="${ FormInsertPage }">양식 추가</a>
						</c:if>
					</div></li>
			</ul>
		</div>
		</c:if>
		
		<c:if test="${ pageurlnum1 == 3 }">
		<!-- 일정관리 -->
		<h3 id="sideTitle">일정관리</h3>
		<c:url var="calendar" value="calendar.do">
			<c:param name="deptCode" value="${ deptCode }" />
			<c:param name="mNo" value="${ mNo }" />
		</c:url>
		<c:url var="calendarTeam" value="calendarTeam.do">
			<c:param name="deptCode" value="${ deptCode }" />
			<c:param name="mNo" value="${ mNo }" />
		</c:url>
		<c:url var="calendarDept" value="calendarDept.do">
			<c:param name="deptCode" value="${ deptCode }" />
			<c:param name="mNo" value="${ mNo }" />
		</c:url>
		<c:url var="wkinsertview" value="wkinsertview.do" />
		<c:url var="wkList" value="wkList.do" />
		<ul>
			<li><a href="${ anninsert }">개인 일정</a></li>
			<li><a href="${ annList }">팀원 일정</a></li>
			<li><a href="${ annUseList }">부서원 일정</a></li>
		</ul>
		</c:if>
		
		<c:if test="${ pageurlnum1 == 4 }">
		<!-- 근태관리 -->
		<h3 id="sideTitle">근태</h3>
		<c:url var="anninsert" value="anninsert.do" />
		<c:url var="annList" value="annList.do" />
		<c:url var="annUseList" value="annUseList.do" />
		<c:url var="wkinsertview" value="wkinsertview.do" />
		<c:url var="wkList" value="wkList.do" />
		<ul>
			<li><a href="${ anninsert }">휴가신청</a></li>
			<li><a href="${ annList }">휴가신청 조회</a></li>
			<li><a href="${ annUseList }">휴가사용 조회</a></li>
			<li><a href="${ wkinsertview }">근무신청</a></li>
			<li><a href="${ wkList }">근무신청 조회</a></li>
		</ul>
		</c:if>
		
		<c:if test="${ pageurlnum1 == 5 }">
		<!-- 게시판 -->
		<h3 id="sideTitle">게시판</h3>
		<ul>
			<li><a href="#" style="color: orange">공지사항</a></li>
			<li><a href="#">제안 게시판</a></li>
			<li><a href="#">부서 게시판</a></li>
			<li><a href="#">자유 게시판</a></li>
			<%-- <li><a href="myProject.do">내 프로젝트보기</a></li> --%>
		</ul>
		</c:if>


	</div>

	<div id="icon_menu">
		<button class="trigger">
			<i class="fas fa-comments"></i>
		</button>
		<div class="modal">
			<div class="modal-content">
				<span class="close-button">&times;</span>
				<div id="chatbox">
					<div id="friendslist">
						<div id="topmenu">
							<span id="search"> <input type="search" name=""
								id="searchfield" value="사원 검색" />
							</span>
						</div>
						<c:forEach var="m" items='${ mList }'>
							<c:if test="${ loginUser.mId ne m.mId }">
								<!-- 친구목록창 -->
								<div id="friends">
									<!-- 친구 1명1명 -->
									<div class="friend">
										<img
											src="https://pbs.twimg.com/profile_images/1221798271951130624/uTFmKI4b_400x400.jpg" />
										<input class="tomId" type="hidden" value="${ m.mId }"></input>
										<p>
											<strong>${ m.mName } / ${ m.jobCode } </strong><br> <span>${ m.email }
											</span>
										</p>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>

				<!-- //////////////////////////////////////////////////////////////////////////////// ////////////////////////////////////////////////////////////////////////////////
                           채팅창 디테일
           //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

				<div id="chatview" class="p1">
					<div id="profile">
						<div id="close">
							<div class="cy"></div>
							<div class="cx"></div>
						</div>

						<div class="roomName">${ Member.mId }님과대화</div>

					</div>
					<!-- //////////////////////////////////////////////////////////////////////////////// ////////////////////////////////////////////////////////////////////////////////

                           채팅창 디테일 내용
           //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

					<div id="chat-messages">
						<label id="today"></label>

						<div class="message">
							<img class="chatuserimg"
								src="data:image/jpeg;base64,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" />
							<div class="bubble">
								<div></div>
								<div class="corner"></div>
								<span></span>
							</div>
						</div>
						<div class="message right">
							<img
								src="data:image/jpeg;base64,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" />
							<div class="bubble">
								<div class="corner"></div>
								<span></span>
							</div>
						</div>


					</div>

					<div id="sendmessage">
						<input type="text" name='message' id='message' />
						<button class='btn btn-primary' id="sendBtn">전송</button>
					</div>
				</div>

			</div>
		</div>
	</div>
	</div>

	<!-- 스크립트  -->
	<script>

 var modal = document.querySelector(".modal");
 var trigger = document.querySelector(".trigger");
 var closeButton = document.querySelector(".close-button");
	

 //console.log(modal);

 function toggleModal() {
     modal.classList.toggle("show-modal");
     
 }

 function windowOnClick(event) {
     if (event.target === modal) {
         toggleModal();
     }
 }

 trigger.addEventListener("click", toggleModal);
 closeButton.addEventListener("click", toggleModal);
 window.addEventListener("click", windowOnClick);
 // 모달 끝

       $("#searchfield").focus(function(){
    	   
           if($(this).val() == "사원 검색"){
               $(this).val("");
           }
       });
       

 $(document).ready(function(){
 	
 	var preloadbg = document.createElement("img");
     
     
 	
       $("#searchfield").focus(function(){
           if($(this).val() == ""){
               $(this).val("");
           }
       });
       
       
       $("#sendmessage input").focus(function(){
           if($(this).val() == ""){
               $(this).val("");
            
           }
       });
      
       $(".friend").each(function(){         
           $(this).click(function(){
               var childOffset = $(this).offset();
               var parentOffset = $(this).parent().parent().offset();
               var childTop = childOffset.top - parentOffset.top;
               var clone = $(this).find('img').eq(0).clone();
               var top = childTop+12+"px";
               var mId = $(this).children('.tomId').val();
               
               if(!confirm("메세지를 보내시겠습니까?")){
             	 return;
              }else{
            	  
          			getChatList();	// 최초 페이지 로딩 시 댓글 불러오기
          			
          			setInterval(function(){
          				getChatList();	// 10초에 한번씩 지속적으로 댓글 리스트 불러오기(다른 회원이 작성한 댓글이 있다면 반영)
          			}, 10000); 
          			console.log(mId);	  
          			// 댓글 등록 ajax
          			$("#sendBtn").on("click", function(){
          				var chatContent = $("#message").val();
          				var fromId = $("loginUser.mId").val();
          				console.log(mId);	  
          				$.ajax({
          					url: "addChat.do",
          					data : {chatContent:chatContent,fromId:fromId, mId:mId},
          					type : "post",
          					success : function(data){
          						if(data == "success"){
          							getChatList();
        							$("#message").val("");
          						}
          					},
          					error : function(e){
          						console.log(e);
          					}
          				});
          			});
			
				function getChatList(){
            		
            		   $.ajax({
            			   url : "chList.do",
            			   data : {mId:mId},
            			   dataType : "json",
            			   success : function(data){
            				  $chardiv = $("#chat-messages")
            				  $chardiv.html("");
            				  
            				   if(data.length > 0) {
            					   for(var key in data){
            						   
            						   var $chatlistarea = $("<div class='chatlistdiv'>");
            						   var $message = $("<div class='message'>");
            						   var $messageRight = $("<div class='message right'>");
            						   var $img = $("<img src='data:image/jpeg;base64,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'/>");
            						   var $img2 = $("<img  src='https://pbs.twimg.com/profile_images/1221798271951130624/uTFmKI4b_400x400.jpg' />");
            						   var $bubble = $("<div class='bubble'>");
            						   var $chatContetn = $("<div>").text(data[key].chatContent);
            						   var $corner = $("<div class='corner'>");
            						   var $spandate = $("<span>");
            						   var $toId = data[key].toId;
            						  
            						   console.log($spandate);	
            						   
            						   if($toId != mId){            						
	            						   $chardiv.append($chatlistarea);
	            						   $chatlistarea.append($message);
	            						   $message.append($img);
	            						   $message.append($bubble);
	            						   $bubble.append($chatContetn);
	            						   $bubble.append($corner);
	            						  
            						   }else{
            							   $chardiv.append($chatlistarea);
                						   $chatlistarea.append($messageRight);
                						   $messageRight.append($img2);
                						   $messageRight.append($bubble);
                						   $bubble.append($chatContetn);
                						   $bubble.append($corner);
            						   }
                						   $bubble.append($spandate);
            						   }
            					    
            						   
            			           
            					   }
            				   }
            				   	
            			   
            		   })
            	   }
              }
                                 
          	document.getElementById("close").onclick =function(){
          		 mId = "";
          	}
          	
               
           
               setTimeout(function(){$("#profile p").addClass("animate");$("#profile").addClass("animate");}, 100);
               setTimeout(function(){
                   $("#chat-messages").addClass("animate");
                   $('.cx, .cy').addClass('s1');
                   setTimeout(function(){$('.cx, .cy').addClass('s2');}, 100);
                   setTimeout(function(){$('.cx, .cy').addClass('s3');}, 200);         
               }, 150);                                                        
          
            
               var name = $(this).find("p strong").html();
               var email = $(this).find("p span").html();                                                      
               $("#profile p").html(name);
               $("#profile span").html(email);         
               
               $(".message").not(".right").find("img").attr("src", $(clone).attr("src"));                                  
               $('#friendslist').fadeOut();
               $('#chatview').fadeIn();
           
               
               $('#close').unbind("click").click(function(){               
                   $("#chat-messages, #profile, #profile p").removeClass("animate");
                   $('.cx, .cy').removeClass("s1 s2 s3");
                   $('.floatingImg').animate({
                       'width': "40px",
                       'top':top,
                       'left': '12px'
                   }, 200, function(){$('.floatingImg').remove()});                
                   
                   setTimeout(function(){
                       $('#chatview').fadeOut();
                       $('#friendslist').fadeIn();             
                   }, 50);
               });
               
           });
       });         
   }); 
 </script>

	<%--   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/chating.js?v=1.3"></script> --%>
</body>
</html>