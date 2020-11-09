<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
	

}
.btn{
margin-top:30px;
}

#save {
	float: right;
	cursor: pointer;
	margin-right: 70px;
	border: none;
	background-color: white;
	font-weight: 800;
	
}

#team_create {
	margin-left: 100px;
	margin-top: 50px;
}

#team_create table {
	margin-left: 10px;
	text-align: left;
}

#m1 {
	padding-left: 40px;
	width: 400px;
}

#m2 {
	width: 350px;
}

#team_create th {
	font-weight: 500;
}

#tn {
	margin-left: 50px;
}

#content {
	margin-left: 38px;
	margin-top: 15px;
	font-size: 20px;
}

.mem {
	margin-left: 105px;
	height: 150px;
	width: 350px;
	float: left;
	overflow: scroll;
}

.choose {
	height: 150px;
	width: 350px;
	margin-left: 500px;
}

.plus {
	width: 20px;
	height: 20px;
	position: absolute;
	text-align: center;
	padding-bottom: 5px;
	margin-left: 470px;
	margin-top: 45px;
}

.plus a, .minus a {
	color: skyblue;
	font-weight: 800;
}

.minus {
	width: 20px;
	height: 20px;
	position: absolute;
	text-align: center;
	padding-bottom: 5px;
	margin-left: 470px;
	margin-top: 95px;
}

textarea:focus, input:focus {
	outline: 0;
}

#main div {
	border: 2px solid skyblue;
}

.menu {
	cursor: pointer;
	padding-bottom: 0;
	margin-bottom: 5px;
}

.selected {
	background-color: lightgrey;
	color: white;
}

#pbtn {
	background-color: white;
	border: 0;
	outline: 0;
	color: skyblue;
}
hr {
	border: 1px solid skyblue;
}

#deadLine{
	margin-top:10px;
	margin-left:50px;
}
#taskT{
	margin-left:15px;
}
.margin{
	padding-left:40px;
	padding-top:10px;
}
</style>
</head>
<body>
	<jsp:include page="../../common/include.jsp" />

	<div id="main">

		<form action="askadd.do" method="post"  enctype="multipart/form-data">
			<c:url var="project" value="project.do">
				<c:param name="pId" value="${pId}"/>
			</c:url>
			<ul>
				<li><a href="${ project }" id="back">뒤로가기</a> <input type="submit" id="save" value="등록하기">
				</li>

			</ul>
	
			<hr>
			<ul id="team_create">
				<li id="taskT">요청명 <input type="text" size="110" id="tn" name="trTitle"
					style="border: 2px solid skyblue;"></li>	
				<table>
					<tr>
						<td>유형</td>
						<td class="margin">
							<select name="trType">
							    <option value="">개선/요청/협조/의견</option>
							    <option value="개선">개선</option>
							    <option value="요청">요청</option>
							    <option value="협조">협조</option>
							    <option value="의견">의견</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>우선순위</td>
						<td class="margin">
							<select name=priority>
								<option value="">상/중/하</option>
								<option value="1">상</option>
								<option value="2">중</option>
								<option value="3">하</option>
							</select>						
						</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td class="margin"><input type="file" id="file" name="file"></td>
					</tr>
					
					<tr>
						<td>내용</td>
						<td><textarea id="content" name="trContent" cols="69"
								rows="5" style="border: 2px solid skyblue;"></textarea></td>
					</tr>
				</table>
				<table>
					<th id="m">담당팀</th>
					<th id="m1">팀</th>
					<th id="m2">선택목록</th>
				</table>
			<div class="mem">
					<c:forEach var="i" begin="0" end="${fn:length(pt)-1}">
						<li value="${pt[i].ptId }" class="menu">${pt[i].ptTitle}</li>
					</c:forEach>
			</div>
				
				<%-- <input type="hidden" value="${ptId}" name="ptId"> --%>
				<input type="hidden" value="${pId}" name="pId">



				<div class="plus">
					<button type="button" id="pbtn">+</button>
				</div>
				<div class="minus">
					<button type="button" id="pbtn">-</button>
				</div>


				<div class="choose"></div>
				<input type="hidden" id="mList" name="ptId" value="0">



			</ul>
		</form>


	</div>
	<script>
				// html dom 이 다 로딩된 후 실행된다.
				$(document).ready(function() {
					// memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
					$(".menu").click(function(){
						if($(this).hasClass("selected")){
							$(this).removeClass("selected");
						}else{
						$("li").removeClass("selected");
						$(this).addClass("selected");
						$(".check").prop("checked",false);
						}
					});
					$(".choose").on('click','li',function(event){
						$("li").removeClass("selected");
						$(this).addClass("selected");
					});
				});
			</script>

	<script>				
				$(".minus").on("click",function(){
					console.log($(".selected").html());	
					$(".selected").remove();
				});

				$(".plus").click(function(){
					if($(".choose li").length < 1){
						console.log($(".choose li").length);				
					    var li = $(".choose li"); 					
						
						var mNo = $(".selected").val();
						//console.log($(".selected").html());
						var mName =$(".selected").html();
						var html = "<li value='" + mNo + "'>"+mName+"</li>";
						
						console.log("츄즈아이템"+html);
	
							 
						$(".choose").append(html);
						/* console.log("mlist"+choosedivitems); */
						$("#mList").attr('value','');
						$("#mList").val(mNo);
						
				}else{
				alert("담당팀은 한 팀만 가능합니다.");
				}
				  
				
				});
				
			
			</script>


</body>
</html>