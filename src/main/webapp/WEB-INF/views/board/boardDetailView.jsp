<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrap {
		width:50%;
		margin:auto;
	}
	#boardTable, #replyTable {
		width:100%;
		border:solid 1px white;
	}
	
	#boardTable th, #boardTable td {
		border:solid 1px white;
		text-align:center;
	}
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<h1 align="center">${ board.bId }번 게시글 상세보기</h1>
	<br>
	
	<div class="wrap">
	<table id="boardTable">
		<tr>
			<td>제목</td>
			<td>${ board.bTitle }</td>
			<td>작성자</td>
			<td>${ board.bWriter }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3">${ board.bContent }</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td colspan="3">
				<c:if test="${ !empty board.originalFileName }">
					<a href="${ contextPath }/resources/buploadFiles/${ board.renameFileName }" download="${ board.originalFileName }">${ board.originalFileName }</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<c:url var="bupview" value="bupView.do">
					<c:param name="bId" value="${ board.bId }"/>
					<c:param name="page" value="${ currentPage }"/>
				</c:url>
				<c:url var="bdelete" value="bdelete.do">
					<c:param name="bId" value="${ board.bId }"/>
				</c:url>
				<c:url var="blist" value="blist.do">
					<c:param name="page" value="${ currentPage }"/>
				</c:url>
				<button onclick="location.href='${ blist }'">목록으로</button>
				<c:if test="${ loginUser.id eq board.bWriter }">
					<button onclick="location.href='${ bupview }'">수정하기</button> 
					<button onclick="location.href='${ bdelete }'">삭제하기</button> 
				</c:if>
			</td>
		</tr>
		<!-- 댓글 등록 부분 => ajax에서 기능 구현-->
		<tr>
			<td colspan="3">
				<textarea cols="75" rows="3" id="rContent"></textarea>
			</td>
			<td><button id="rSubmit">등록하기</button></td>
		</tr>
	</table>
	<br>
	<br>
	
	<!-- 댓글 목록보기 => ajax에서 기능 구현 -->
	<table id="replyTable">
		<thead>
			<tr>
				<td colspan="4"><b id="rCount"></b></td>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
	</div>
	
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
					$tableBody = $("#replyTable tbody");
					$tableBody.html("");
					
					$("#rCount").text("댓글 ("+data.length+")");
					
					if(data.length > 0){
						for(var i in data){
							
							var $tr = $("<tr>");
							var $rWriter = $("<td width='100'>").text(data[i].rWriter);
							var $rContent = $("<td>").text(data[i].rContent);
							var $rCreateDate = $("<td width='100'>").text(data[i].rCreateDate);
							
							$tr.append($rWriter);
							$tr.append($rContent);
							$tr.append($rCreateDate);
							
							$tableBody.append($tr);
						}
					}else{
						var $tr = $("<tr>");
						var $rContent = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
						
						$tr.append($rContent);
						$tableBody.append($tr);
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