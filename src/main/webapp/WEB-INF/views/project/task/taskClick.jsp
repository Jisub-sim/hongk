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

#save {
	float: right;
	margin-right: 80px;
	cursor : pointer;
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
	position:relative;
}
#task_info table{
	width:100%;
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

.tn, .tm {
	height: 30px;
}

.tc {
	height: 175px;
	
}

.task_in {
	padding-left: 10px;
	padding-top: 5px;
	text-align: left;
	color: gray;
	font-weight: 600;
}

.write {
	padding-top: 5px;
	float: right;
}

.title {
	align:left;
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
#getManager{
	float:right;
}

.content{
	width:90%;
}
#file{
	display:none;
}
#page{
	position:absolute;
	bottom:0;
	width:100%;
	text-align:center;
}
#mm{
	width:100%;
	margin-top:20px;
	text-align:center;
	position:relative;
}
#rSubmit{
	position:absolute;
	margin-top:20px;
	margin-left:5px;
}
</style>
</head>
<body>
	<jsp:include page="../../common/include.jsp" />

	<div id="main">
		<c:url var="twStatusUp" value="twStatusUp.do">
			<c:param name="twId" value="${t.twId}"/>
		</c:url>
		
		<div id="button">
			<ul>
			<c:url var="project" value="project.do">
				<c:param name="pId" value="${pId}"/>
			</c:url>
				<li><a href="${ project }" id="back">뒤로가기</a> 
				<c:if test="${t.twStatus eq 'Y' }">
					<a	id="save">상태 변경</a></li>				
				</c:if>

			</ul>
		</div>
		<script>
			$("#save").on("click",function(){
				if(confirm("업무 상태를 '완료'로 변경하시겠습니까?\n(한번 완료하면 돌릴 수 없습니다.)")){
					location.href="${twStatusUp}";
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
						<td class="tn">업무명</td>
						<td class="content">${t.twTitle }</td>
					</tr>
					<tr>
						<td class="tm">담당자</td>
						<td class="content">${t.manager }
						<%-- <c:if test="${t.manager eq null }"> --%>
						<c:url var="getManager" value="getManager.do">
							<c:param name="twId" value="${t.twId}"/>
						</c:url>
						<button id="getManager" onclick="location.href='${getManager}'">가져오기</button>
						<%-- </c:if></td> --%>
					</tr>
					<tr>
						<td class="tc">내용</td>
						<td class="content">${t.twContent}</td>
					</tr>
					<input type="hidden" id="htwId" value="${t.twId}">
				</table>
			<c:url var="getfileList" value="taskClick.do">
				<c:param name="twId" value="${t.twId }"/>
			</c:url>
			</div>
			<div id="task_info">
				<script>
				$(function () {
					$('#btn-upload').click(function (e) {
						e.preventDefault();
						$('#file').click();
					});
				});
				$(document).ready(function() {
				    $("#file").on("change", addFiles);
				});
				function addFiles(e){
					var data = new FormData();
					data.append('file',$('#file')[0].files[0]);
					var twId = $("#htwId").val();
					console.log(twId);
					data.append('twId',twId);
					$.ajax({
						url : "taskfileUpload.do",
						type:"post",
						data : data,
						processData: false,
						contentType: false,
						success : function(data){
							if(data=="success"){
							 alert("파일 등록 성공");
							 getFileList();
							}
							else{
								alert("파일 등록 실패");
							}
						},
						err: function(err){
							alert(err.status);
						}
					});
				}

				// 파일 리스트 불러오는 함수
				function getFileList(){
					location.href="${getfileList}";	
				}
				</script>
			
				<table>
				
					<tr>
						<td class="task_in" colspan="2">업무자료</td>
						<form id="uploadForm" enctype="multipart/form-data" method="POST" action="taskfileUpload.do">
						<td class="write"><input type="button" id="btn-upload" value="등록">
						<input type="file" id="file"name="file"></td>
						</form>
					</tr>
					<th class="title">제목</th>
					<th class="writer">작성자</th>
					<th calss="date">등록일</th>
					<c:forEach var="f" items="${flist}">
					<tr>
						<td>
						<a href="${ contextPath }/resources/TaskUpload/${ f.reName_FileName }" download="${ f.original_FileName }">${ f.original_FileName }</a>
						</td>
						<td>${f.mName }</td>
						<td>${f.save_Date }</td>
					</tr>
					</c:forEach>
				</table>
										<!-- 페이지 숫자 -->
							<div id="page">
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<font color="red">${ p }</font>
								</c:if>
								<c:if test="${ p ne pi.currentPage }">
									<c:url var="pagination" value="taskClick.do">
										<c:param name="page" value="${ p }" />
										<c:param name="twId" value="${t.twId}"/>
									</c:url>
									<a href="${ pagination }">${ p }</a> &nbsp;
								</c:if>
							</c:forEach>
							
		
		</div>
			</div>
		
		 <br><br><br><br><br>
                <br><br><br><br><br>
                <br><br><br>
                <hr>
                <h1 class="memo_font">업무메모</h1>
                <hr>
				<div class="task_memo">
                    <div class="memo">
           				  <ul>
                            <li class="memo_wd"><h3 class="memo_writer">작성자</h3> <h3 class="memo_date">2020-10-05</h3></li>
                            <li class="memo_content">업무 상태 변경하였습니다.</li>
                            <li class="memo_delete"><a href="">삭제</a></li>
                        </ul>
                    </div>
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
			/* setInterval(function(){
				getReplyList();
			},10000); */
			
			$("#rSubmit").on("click", function() {
				var rContent = $("#rContent").val();
				var twId = $("#htwId").val();
				console.log(twId);
				$.ajax({
					url : "addReply.do",
					data : {
						rContent : rContent,
						twId : twId
					},
					type : "post",
					success : function(data) {
						console.log(data);
						if (data == "success") {
							getReplyList();
							$("#rContent").val("");
						}
					},
					error : function(e) {
						console.log(e);
					}
				});
			});
			
			function getReplyList(){
				var twId=$("#htwId").val();
				$.ajax({
					url:"wrList.do",
					data:{twId:twId},
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
								var twId = $("#htwId").val();
								var $memo = $("<div class='memo'>");
								var $ul = $("<ul>");
								var $mw = $("<h3 class='memo_writer'>").text(data[i].mName);
								var $md = $("<h3 class='memo_date'>").text(data[i].wrDate);
								var $mName = $("<li class='memo_wd'>").append($mw);
								$mName.append($md);
								var $wrContent = $("<li class='memo_content'>").text(data[i].wrContent);
								var $delete = $("<a href='deleteReply.do?wrId="+data[i].wrId+"&twId="+twId+"'>삭제</a>");
								var $wrDate = $("<li class='memo_delete'>").append($delete);
								
								$ul.append($mName);
								$ul.append($wrContent);
								$ul.append($wrDate);
								
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