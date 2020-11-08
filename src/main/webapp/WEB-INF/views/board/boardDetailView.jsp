<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <title>noticeboard</title>
    <script
      src="https://kit.fontawesome.com/5218f6fd6d.js"
      crossorigin="anonymous"
    ></script>
    <!--아이콘 참조 사이트 font awesome-->
  </head>
  <style>
  #CommunityDetailWrap {
  /* 상세페이지 백그라운드 */
  width: 800px;
  margin: auto;
}

.DetailHeader {
  /* 상세페이지 타이틀 부분 컨테이너 & 타이틀 백그라운드 이미지 */
  display: flex;
  flex-direction: column;
}

.detailtitle {
  /* 타이틀 스타일 */
  margin-left: -50px;
  text-align: center;
  background-color: skyblue;
  width: 900px;
  border-radius: 15px;
}

.userinfoArea {
  /* 작성자 정보부분 컨테이너 */
  display: flex;
  margin-bottom: -30px;
  margin-left: -10px;
}

#userimg {
  /* 작성자 프로필 스타일 */
  margin-top: 20px;
  border-radius: 50%;
  width: 40px;
}

.userinfo {
  /* 작성자 정보 스타일 */
  margin-left: 10px;
}

.tableArea {
  /* 전체 감싸기 */
  width: 1000px;
  margin: auto;
}

#content {
  /* 콘텐츠 출력 영역 */
  padding: 3%;
  text-align: left;
  height: 100%;
  border-bottom: 1px solid silver;
}

#newReply{
border : 2px solid skyblue;
border-radius: 10px;
width: 760px;
height: 2px;
}
.loginname{
margin-top: -20px;
margin-left:13px;
}


#rContent{
margin-left: 15px;
  border: none;
  resize: none;
}

textarea:focus {
  outline: none;
}
button:focus {
  outline: none;
}
input:focus {
  outline: none;
}

.Small_userimg {
  background-color: silver;
  border-radius: 50%;
  margin-top: 10px;
  width: 30px;
}

#rlpro{
	display: flex;
	height: 40px;
}


#replyUsermName{
	display: flex;
	padding: 12px;
	font-size: 15px;
	font-weight: bolder;
}

#rcarea{
 margin-left: 40px;
 
 
}
#replyContent{
	font-weight: inherit;
	
	
}

#replyDate{
	font-size: 12px;
	color: silver;
}

#rSubmit{
	border: none;
	width: 40px;
	background-color:white;
	color: silver;
	font-size: 15px;
	margin: 10px 20px; 
	font-weight: bold;
}

#detailbtn > button{
   width: 200px;
    height: 50px;
    border-radius: 10px;
 
}

.backlist{
 	color:black;
 	background-color: rgb(243, 229, 98);
}
#updateyBtn{
	color: white;
	background-color: green;
}
#deleteBtn{
 color: white;
 background-color: red;
}

#img {
  width: 300px;
  height: 200px;
}
  </style>

<body>
	<c:import url="../common/include.jsp"/>
<div id="main">
<div class="tableArea">
      <div id="CommunityDetailWrap">
        <div class="DetailHeader">
          <br />

          <!-- 타이틀 불러오기 -->
          <div class="detailtitle">
            <h1>${ board.bTitle }</h1>
          </div>
          <br /><br />
          <!-- flex 컨테이너 -->
          <div class="userinfoArea">
            <!-- 작성자 프로필 이미지 -->
            <div>
              <img id="userimg" src="/img/pro.jpg" />
            </div>

            <!-- 작성자 정보 -->
            <div class="userinfo">
              <p>${ board.bWriter }<br />
              ${ board.createDate } / ${ board.bCount }</p>
            </div>
          </div>
        </div>
        <br />
        <hr />
        <!-- 콘텐츠 내용 불러오기 -->
        <div id="content">
         	<p>${ board.bContent }</p>  
        </div>
    
        <!-- 게시글 상세보기 작성된 컨텐츠 영역 종료-->

        <!-- 댓글 내용 출력 -->
        <br>
        <div colspan="4"><b id="rCount"></b></div>
        <div id="replySelectArea">
        	<div id="ReplytextUserInfo">
        	  <div id="rlpro">
          		<img id="replyUserImg" class="Small_userimg" src="/img/loupe.png"></div>	
          		<div id="replyUsermName"></div>
          	  </div>
          	</div>
          	<div id="rcarea">
          		<div id="replyContent2"></div>
          		<div id="replyDate"></div>
          	</div>
        </div>
         <br> <br>

        <!-- 댓글 작성 -->
        <div class="replyArea">
            <table id="newReply" align="center" style="background-color: white">
              <tr>
                <td style="float: left" class="loginname"><br>${ loginUser.mName }</td>
              </tr>
              <tr>
                <td>
                  <textarea rows="5" cols="100" id="rContent" placeholder="댓글을 남겨보세요"></textarea>
                </td>
                <td>
                  <button id="rSubmit" style="float: right">등록</button>
                </td>
              </tr>
            </table>
            
          
            
          </div>
        </div>
        <c:url var="update" value="update.do">
			<c:param name="bId" value="${ board.bId }"/>
			<c:param name="page" value="${ currentPage }"/>
		</c:url>
		<c:url var="bdelete" value="bdelete.do">
			<c:param name="bId" value="${ board.bId }"/>
		</c:url>
		<c:url var="blist" value="blist.do">
			<c:param name="page" value="${ currentPage }"/>
		</c:url>

        <!-- 버튼'S -->
        <div align="center" id="detailbtn">
          <br />
          <!-- 로그인한 회원이 글쓴이인 경우만 수정/삭제 버튼을 보여준다 -->

          <button type="button" class="backlist" onclick="javascript:history.back();">목록으로</button>
          <c:if test="${ loginUser.mId eq board.bWriter }">
          <button id="updateyBtn" type="button" onclick="location.href='${ update }'">
            수정
          </button>
          
          <button
            id="deleteBtn"
            type="button"
            <%-- onclick="location.href='${bdelete}'" --%>
            onclick="del(${board.bId})"
          >
            삭제
          </button>
          </c:if>
        </div>
      </div>
    </div>
    <script>
    function del(bId) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='${bdelete}'
		}
	}	
	</script>
	
	<script>
		$(function(){
			getReplyList();	// 최초 페이지 로딩 시 댓글 불러오기
			
			setInterval(function(){
				getReplyList();	// 10초에 한번씩 지속적으로 댓글 리스트 불러오기(다른 회원이 작성한 댓글이 있다면 반영)
			}, 10000);
			
			// 댓글 등록 ajax
			$("#rSubmit").on("click", function(){
				var rContent = $("#rContent").val();
				var refBid = ${ board.bId };
				
				$.ajax({
					url:"addReply.do",
					data: {rContent:rContent, refBid:refBid},
					type: "post",
					success : function(data){
						console.log(data);
						// DB에 insert가 잘 되었다는 응답 메세지(문자열 값)를 받고
						// 등록 성공 시 댓글 리스트 다시 불러오기 -> getReplyList() 호출
						// 댓글 내용 textarea에 남아있지 않게 지워주기
						if(data == "success"){
							getReplyList();
							$("#rContent").val("");
						}
					},
					error : function(e){
						console.log(e);
					}
				});
			});
			
		})
	
	
	
		// 댓글 리스트를 불러오는 ajax 함수
		function getReplyList(){
			var bId = ${ board.bId };
			
			$.ajax({
				url : "rList.do",
				data : {bId:bId},
				dataType: "json",
				success : function(data){
					console.log(data);
					// tbody에 댓글 갯수 만큼(<tr>)
					// 작성자(<td>), 작성내용(<td>), 작성일(<td>) 담기
					// rCount에는 댓글 갯수 표기   ex. 댓글(5)
					// 등록 된 댓글이 없을 경우 <td colspan='3'>등록 된 댓글이 없습니다.</td>
					
					$replyDiv = $("#replySelectArea");
					$replyDiv.html("");
					
					$("#rCount").text("댓글 ("+data.length+")");
					
					if(data.length > 0){
						for(var key in data){
							
							var $replytextArea = $("<div class='replytextArea'>");
							var $ReplytextUserInfo = $("<div id='ReplytextUserInfo'>");
							var $rlpro = $("<div id='rlpro'>");
							var $img = $("<img id='replyUserImg' class='Small_userimg' src='resources/image/user.png'>");
							var $Writer = $("<div id='replyUsermName'>").text(data[key].rWriter);
							var $rcarea = $("<div id='rcarea'>")
							var $rContent = $("<div id='replyContent'>").text(data[key].rContent);
							var $date = $("<div id='replyDate'>").text(data[key].rCreateDate);
							
							
							
							
					     /*    <div id="replySelectArea">
					        	<div id="ReplytextUserInfo">
					        	  <div id="rlpro">
					          		<img id="replyUserImg" class="Small_userimg" src="/img/loupe.png"></div>	
					          		<div id="replyUsermId"></div>
					          	  </div>
					          	</div>
					          	<div id="rcarea">
					          		<div id="replyContent"></div>
					          		<div id="replyDate"></div>
					          	</div>
					        </div> */
							
							$replyDiv.append($replytextArea);
							$replytextArea.append($ReplytextUserInfo);
							$ReplytextUserInfo.append($rlpro);
							$rlpro.append($img, $Writer);
							$replyDiv.append($rcarea);
							$rcarea.append($rContent, $date);
							
												
							
						}

					}else{
						var $replytextArea = $("<div>");
						var $rContent = $("<div>").text("등록된 댓글이 없습니다.");
						
						$replytextArea.append($rContent);
						$replyDiv.append($replytextArea);
					}
				},
				error : function(e){
					console.log(e);
				}
			});
		} 
	
	</script>
	
  </body>
</html>