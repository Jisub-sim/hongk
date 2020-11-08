<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- cnd 방식으로 sockjs 불러오기
sockjs 검색 -> SockJS-client GitHub -> CDN 참조
https://github.com/sockjs/sockjs-client
 -->
<!-- <script src="http://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script> -->
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">



<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 부트스트랩적용 -->
<!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> -->
<!-- Optional theme -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous"> -->
<!-- Latest compiled and minified JavaScript -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> -->

<meta charset="UTF-8">
<title>실시간 채팅</title>

<script>
	/* SockJS 객체 생성 보낼 url경로를 매개변수로 등록 */
	var sock = new SockJS("<c:url value='/echo'/>");
	sock.onmessage = onMessage; 
	// new SocketJS().onmessage=function(evt)
	// 웹소켓 처리 객체에서 전달만은 TextMessage를 처리하는 함수
	// 전송 문자열을 파싱처리하여 페이지에 메세지 내용, 사용자를 처리
	// 전송된 메세지내용은 메게변수(evt) 객체에 담겨서 전달받음 
	sock.onclose = onClose;
	// new socketjs().onclose=function(evt)
	// 소캣 종료 시 
	var today = null;
	$(function(){
		$("#sendBtn").click(function(){
			console.log("send message.....");
			/* 채팅창에 작성한 메세지 전송 */
			sendMessage();
			/* 전송 후 작성창 초기화 */
			$("#message").val('');
		});
		
		$("#exitBtn").click(function(){
			console.log("exit message.....");
			/* 채팅창에 작성한 메세지 전송 */
			sock.onclose();
		});
	});
	
	function sendMessage(){
		/* 맵핑된 핸들러 객체의 handleTextMessage 메소드가 실행 */
		sock.send($("#message").val());
		// new SocketJS().send() 
		// 메세지를 페이지에서 웹소켓처리 객체로 전송하는 함수
	};
	
	function onMessage(evt){
		var data = evt.data; // new text객체로 보내준 값을 받아옴.
		var host = null; //메세지를 보낸 사용자 ip저장
		var strArray = data.split("|"); //데이터 파싱처리하기
		var userName = null; //대화명 저장

		//전송된 데이터 출력해보기
		for(var i = 0; i < strArray.length ; i++){
			console.log('str['+i+'] :' + strArray[i]);	 		
		}
		
		today = new Date();
		printDate = today.getFullYear() + "/" + (today.getMonth()+1) + "/" + today.getDate() + " "
				+ today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
		
		if(strArray.length > 1) { // 채팅 창에 입력한 경우
			sessionId = strArray[0]; 
			message = strArray[1];
			host = strArray[2].substr(1,strArray[2].indexOf(":")-1);
			userName = strArray[3];
			
			var ck_host='${host}'; // 컨트롤러에서 확인한 ip
	
			console.log(sessionId);
			console.log(message);
			console.log('host : ' + host); 
			// EchoHandler에서 전송 받은 ip 분리
			console.log('ck_host : ' + ck_host); 
			// 컨트롤러에서 확인한 ip
			
			/* 서버에서 데이터를 전송할 경우 분기 처리 */
			if(host == ck_host || (host == 0 && ck_host.includes('0:0:'))){
				// 2개 아이피가 일치 ==> 내 메세지 출력
				// localhost로 접속한 경우는 host가 0 ck_host가 0:0:0:0:0:0:0:1 
				console.log('${loginUser.mName}');
				var printHTML = "<div class='well' >";
				printHTML += "<div class='alert alert-info'>";
				printHTML += "<sub>"+printDate+"</sub><br/>";
				printHTML += "<strong>["+${loginUser.mName}+"] : "+message+"</strong>";
				printHTML += "</div>";
				printHTML += "</div>";
				$('#chat-messages').append(printHTML);
			}else{
				// 그외의 경우는 상대 메세지 출력
				var printHTML = "<div class='well'  style='margin-left: -5%;margin-right:30%;'>";
				printHTML += "<div class='alert alert-warning'>";
				printHTML += "<sub>"+printDate+"</sub><br/>";
				printHTML += "<strong>["+${loginUser.mName}+"] : "+message+"</strong>";
				printHTML += "</div>";
				printHTML += "</div>";
				$('#chat-messages').append(printHTML);
			} 
		}else{ // 연결이 끊어진 경우 - 채팅방 퇴장 시
			message = strArray[0];
			var printHTML = "<div class='well'  style='margin-left30%:'>";
			printHTML += "<div class='alert alert-danger'>";
			printHTML += "<strong>["+userName+"] : "+message+"</strong>";
			printHTML += "<sub>"+printDate+"</sub><br/>";
			printHTML += "</div>";
			printHTML += "</div>";
			$('#chat-messages').append(printHTML);
			
		}
	};

	function onClose(evt){
		 location.href='${pageContext.request.contextPath};';  
	};
</script>
<style>
#chatbox {
	border: 1px solid gray;
	width: 290px;
	background: #fff;
	border-radius: 6px;
	overflow: hidden;
	height: 450px;
	position: absolute;
	top: 100px;
	left: 50%;
	margin-left: -155px;
}

#chatview {
	width: 290px;
	height: 484px;
	position: absolute;
	top: 0;
	left: 0;
	background: #fff;
}

#profile {
	height: 70px;
	overflow: hidden;
	text-align: center;
	display: flex;
	justify-content: space-between;
	padding: 20px;
	background-color: #e7ebee;
	border: 1px solid red;
}

.roomName {
	font-size: 20px;
}

#chat-messages {
	margin-top: 30px;
	width: 290px;
	height: 270px;
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
	margin-right: -5px;
	margin-left: 19px;
}

/* 이미지 동그라미  */
#chat-messages .message img {
	float: left;
	margin-left: -40px;
	border-radius: 50%;
	width: 30px;
	margin-top: 12px;
}

#chat-messages div.message.right img {
	float: right;
	margin-left: 0;
	margin-right: -38px;
}

.message .bubble {
	background: #f0f4f7;
	font-size: 13px;
	font-weight: 600;
	padding: 12px 13px;
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
	position: absolute;
	width: 7px;
	height: 7px;
	left: -5px;
	bottom: 0;
}

div.message.right .corner {
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
	border-top: 1px solid #e7ebee;
	position: absolute;
	right: 0px;
	width: 288px;
	height: 78px;
	background: #fff;
}

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
	width: 60px;
	height: 50px;
	position: absolute;
	right: 15px;
	top: 10px;
}

#sendmessage button:hover {
	cursor: pointer;
	background-position: 0 0;
}

#sendmessage button:focus {
	outline: 0;
}
</style>
</head>
<body>
<h1>${loginUser.mName}</h1>
	<div id="chatbox">
		<div id="chatview" class="p1">
			<div id="profile">
				<div class="goList">목록</div>
				<div class="roomName"text-align:center;">${tutor_name }님과
					대화</div>
				<div class="rommClose">닫기</div>
			</div>
			<div id="chat-messages">
				<label>2020/ 11 / 11</label>
				<div class="message">
					<img
						src="data:image/jpeg;base64,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" />
					<div class="bubble">

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


	<button class='btn btn-primary' id='exitBtn'>나가기</button>

</body>
</html>