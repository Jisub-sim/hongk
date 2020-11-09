<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul, li {
	list-style-type: none;
}

#back {
	float: left;
	padding-left: 20px;
}

.save {
	float: right;
	margin-right: 80px;
	cursor: pointer;
}

hr {
	border: 1px solid skyblue;
}

#button {
	height: 20px;
}

#ptn {
	color: gray;
	margin-left: 50px;
	margin-bottom: 10px;
	margin-top: 10px;
}

#list {
	margin-left: 50px;
	margin-right: 50px;
	margin-top: 40px;
}

#task_name {
	width: 475px;
	height: 250px;
	border: 2px solid skyblue;
	padding-right: 0;
	float: left;
}

#task_info {
	width: 475px;
	height: 250px;
	border: 2px solid skyblue;
	padding-right: 0;
	float: left;
	margin-left: 50px;
	padding-right: 0;
	text-align: center;
	position: relative;
}

#task_info table {
	width: 100%;
}

#task_table tr {
	margin: 0 auto;
}

#task_table tr td {
	border-bottom: 1px solid skyblue;
	border-right: 1px solid skyblue;
}

#task_table tbody>tr:last-child>td {
	border-bottom: 0;
}

.tn, .tm, .tc {
	width: 60px;
	text-align: center;
}

.rrTitle, .rrContent {
	width: 80px;
	padding-bottom: 20px;
	text-align: center;
}

.tn, .tm {
	height: 30px;
}

.tc {
	height: 145px;
}

.task_in {
	padding-left: 10px;
	padding-top: 5px;
	text-align: left;
	color: gray;
	font-weight: 600;
	padding-bottom: 20px;
}

.write {
	padding-top: 5px;
	float: right;
}

.title {
	align: left;
	width: 280px;
}

.writer {
	width: 80px;
}

.date {
	width: 140px;
}

th {
	font-weight: 400;
	border-top: 1px solid skyblue;
	border-bottom: 1px solid skyblue;
}

#task_memo {
	height: 350px;
}

.memo {
	border-top: 1px solid skyblue;
	border-bottom: 1px solid skyblue;
	height: 100px;
	width: 80%;
	margin: 0 auto;
	margin-bottom: 10px;
}

.memo_font {
	color: gray;
	font-weight: 600;
	font-size: 15px;
	margin-left: 50px;
}

.memo_writer {
	float: left;
	font-size: 13px;
	font-weight: 400;
}

.memo_date {
	float: right;
	margin-right: 50px;
	font-size: 13px;
	font-weight: 400;
}

.memo_content {
	margin-left: -20px;
	padding-top: 50px;
}

.memo_wd {
	margin-top: -20px;
}

.memo_delete {
	font-size: 12px;
	float: right;
	margin-top: 10px;
	margin-right: 10px;
}

#getManager {
	float: right;
}

.content {
	width: 90%;
}

.writer, .manager {
	width: 37%;
}

#file {
	display: none;
}

#page {
	position: absolute;
	bottom: 0;
	width: 100%;
	text-align: center;
}

#mm {
	width: 100%;
	margin-top: 20px;
	text-align: center;
	position: relative;
}

#rSubmit {
	position: absolute;
	margin-top: 20px;
	margin-left: 5px;
}

.rr {
	padding-bottom: 20px
}

#rrbtn {
	margin-left: 330px;
}
</style>
</head>
<body>
	<jsp:include page="../../common/include.jsp" />

	<div id="main">
		<c:url var="trStatusUp" value="trStatusUp.do">
			<c:param name="trId" value="${rq.trId}" />
		</c:url>

		<div id="button">
			<ul>
				<c:url var="project" value="project.do">
					<c:param name="pId" value="${pId}" />
				</c:url>
				<li><a href="${ project }" id="back">뒤로가기</a> <c:if
						test="${rq.trStatus eq 'Y' }">
						<a class="save">상태 변경</a></li>
				</c:if>


			</ul>
		</div>
		<script>
			$("#save").on("click",function(){
				if(confirm("요청 상태를 '확인'으로 변경하시겠습니까?\n(한번 변경하면 돌릴 수 없습니다.)")){
					location.href="${trStatusUp}";
				}else{
					alert("취소하였습니다.");
				}
			});
		</script>

		<hr>
		<div id="list">


			<div id="task_name">
				<table id="task_table">
					<tr>
						<td class="tn">요청명</td>
						<td class="content" colspan="3">${rq.trTitle }</td>
					</tr>
					<tr>
						<td class="tm">작성자</td>
						<td class="writer">${rq.writer}</td>

						<td class="tm">담당자</td>
						<td class="manager">${rq.manager }<c:if
								test="${rq.manager eq null }">
								<c:url var="getManager" value="getRequestManager.do">
									<c:param name="pId" value="${pId}" />
									<c:param name="trId" value="${rq.trId}" />
								</c:url>

								<button id="getManager" onclick="location.href='${getManager}'">가져오기</button>
							</c:if></td>
					</tr>
					<tr>
						<td class="tm">파일</td>
						<td class="content" colspan="3"><c:if
								test="${f.original_FileName eq null}">
						없음
						</c:if> <c:if test="${f.original_FileName ne null}">
								<a
									href="${ contextPath }/resources/TaskUpload/${ f.reName_FileName }"
									download="${ f.original_FileName }">${ f.original_FileName }</a>
							</c:if></td>
					</tr>
					<tr>
						<td class="tc">내용</td>
						<td class="content" colspan="3">${rq.trContent}</td>
					</tr>
					<input type="hidden" id="htrId" value="${rq.trId}">
				</table>
				<c:url var="getfileList" value="taskClick.do">
					<c:param name="twId" value="${t.twId }" />
				</c:url>
			</div>
			<div id="task_info">

				<form id="uploadrr" method="POST" action="rrInsert.do">
					<table id="rr_table">

						<tr>
							<td class="task_in" colspan="2">변경사항</td>
						</tr>
						<tr>
							<td class="rrTitle">제목</td>
							<td class="rr"><input type="text" name="rrTitle" size="40"></td>
						</tr>
						<tr>
							<td class="rrContent">변경 내용</td>
							<td class="rr"><textarea name="rrContent" cols="38" rows="6"></textarea></td>
						</tr>
						<input type="hidden" value=${trId } name="trId">
						<input type="hidden" id="pId" value=${pId } name="pId">

					</table>
					<input type="submit" id="rrbtn" value="등록">
				</form>



			</div>
		</div>

		<br>
		<br>
		<br>
		<br>
		<br> <br>
		<br>
		<br>
		<br>
		<br> <br>
		<br>
		<br>
		<hr>
		<h1 class="memo_font">업무메모</h1>
		<hr>
		<div class="task_memo">
			<div class="memo"></div>
		</div>
		<div id="mm">
			<tr>
				<td colspan="3"><textarea cols="80" rows="3" id="rContent"></textarea>
				</td>
				<td><button id="rSubmit">등록하기</button></td>
			</tr>
			<script>
	
		$(function() {
			getReplyList();
			setInterval(function(){
				getReplyList();
			},20000); 
	
		function getReplyList(){
				var trId=$("#htrId").val();
				$.ajax({
					url:"rrList.do",
					data:{trId:trId},
					dataType : "json",
					success:function(data){
						console.log(data);
						
						$tm = $(".task_memo");
					 	$tm.html("");
						if(data.length ==0){
							var $memo = $("<div class='memo'>");
							var $ul = $("<ul>");
							var $li = $("<li>등록된 댓글이 없습니다.</li>");
							
							$ul.append($li);
							
							$memo.append($ul);
							
							$tm.append($memo);
						}else{
							//<h3 class="memo_writer">작성자</h3> <h3 class="memo_date">2020-10-05</h3></li>
							for(var i in data){
								var trId = $("#htrId").val();
								var pId = $("#pId").val();
								var $memo = $("<div class='memo'>");
								var $ul = $("<ul>");
								var $mw = $("<h3 class='memo_writer'>").text(data[i].mName);
								var $md = $("<h3 class='memo_date'>").text(data[i].rrDate);
								var $mName = $("<li class='memo_wd'>").append($mw);
								$mName.append($md);
								var $rrContent = $("<li class='memo_content'>").text(data[i].rrContent);
								var $delete = $("<a href='deleteRReply.do?rrId="+data[i].rrId+"&trId="+trId+"&pId="+pId+"'>삭제</a>");
								var $rrDate = $("<li class='memo_delete'>").append($delete);
								
								$ul.append($mName);
								$ul.append($rrContent);
								$ul.append($rrDate);
								
								$memo.append($ul);
								$tm.append($memo);
							} 
							
						}
						
						
					},
					error:function(e){
						console.log(e);
					}
				});
			} 
		});
	</script>
		</div>

	</div>
</body>
</html>