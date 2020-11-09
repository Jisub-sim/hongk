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
	margin-top: 70px;
}

#team_create table {
	margin-left: -5px;
	text-align: left;
}
#m{
	width:100px;
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
	margin-left: 50px;
	margin-top: 15px;
	font-size: 20px;
}

.mem {
	margin-left: 87px;
	height: 250px;
	width: 350px;
	float: left;
	overflow: scroll;
}

.choose {
	height: 250px;
	width: 350px;
	margin-left: 490px;
}

.plus {
	width: 20px;
	height: 20px;
	position: absolute;
	text-align: center;
	padding-bottom: 5px;
	margin-left: 455px;
	margin-top: 80px;
	
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
	margin-left: 455px;
	margin-top: 130px;
}

textarea:focus, input:focus {
	outline: 0;
}

#main div {
	border: 2px solid skyblue;
}

.hide {
	display: none;
}
li {
	cursor : pointer;
	padding-bottom:0;
	margin-bottom:5px;
}
.selected{
	background-color:lightgrey;
	color:white;
}
#pbtn{
	background-color:white;
	border : 0;
	outline:0;
	color:skyblue;
}
#button {
	height: 20px;
}
</style>
</head>
<body>
	<jsp:include page="../common/include.jsp" />

	<div id="main">
		<form action="proUpdate.do" method="post">
		<input type="hidden" value="${pId}" name="pId">

		<ul>
			<li><a href="project.do" id="back">뒤로가기</a> 
			<input type="submit" id="save" value="등록하기">
		</li></ul>

		
		
		<ul id="team_create">
			<li>프로젝트명 <input type="text" size="100" id="tn" name="pTitle"
				style="border: 2px solid skyblue;" value="${p.pTitle}"></li>
			<table>
				<th id="m">인원구성</th>
				<th id="m1">대상자</th>
				<th id="m2">선택목록</th>
			</table>
			<div class="mem">
				<li class="menu"><input type="checkbox" name="check" class="check" id="D1" value="D1"><a>인사관리부</a>
					<ul class="hide">
				<c:forEach var="i" begin="0" end="${fn:length(m)-1}">
					<c:if test="${m[i].deptCode eq 'D1' }">
					<li value="${m[i].mNo }" class="D1">
						<c:if test='${m[i].jobCode eq "J1"}'>
						대표
						</c:if>
						<c:if test='${m[i].jobCode eq "J2"}'>
						부사장
						</c:if>
						<c:if test='${m[i].jobCode eq "J3"}'>
						부장
						</c:if>
						<c:if test='${m[i].jobCode eq "J4"}'>
						차장
						</c:if>
						<c:if test='${m[i].jobCode eq "J5"}'>
						과장
						</c:if>
						<c:if test='${m[i].jobCode eq "J6"}'>
						대리
						</c:if>
						<c:if test='${m[i].jobCode eq "J7"}'>
						사원
						</c:if>
					   ${m[i].mName}</li>
					</c:if>
				</c:forEach>
				</ul></li>
				
				<li class="menu"><input type="checkbox" name="check" class="check" id="D2" value="D2"><a>회계관리부</a>
					<ul class="hide">
				<c:forEach var="i" begin="0" end="${fn:length(m)-1}">
					<c:if test="${m[i].deptCode eq 'D2' }">
					<li value="${m[i].mNo }" class="D2">
						<c:if test='${m[i].jobCode eq "J1"}'>
						대표
						</c:if>
						<c:if test='${m[i].jobCode eq "J2"}'>
						부사장
						</c:if>
						<c:if test='${m[i].jobCode eq "J3"}'>
						부장
						</c:if>
						<c:if test='${m[i].jobCode eq "J4"}'>
						차장
						</c:if>
						<c:if test='${m[i].jobCode eq "J5"}'>
						과장
						</c:if>
						<c:if test='${m[i].jobCode eq "J6"}'>
						대리
						</c:if>
						<c:if test='${m[i].jobCode eq "J7"}'>
						사원
						</c:if>
					 ${m[i].mName}</li>
					</c:if>
				</c:forEach>
				</ul></li>
					<li class="menu"><input type="checkbox" name="check" class="check" id="D3" value="D3"><a>마케팅부</a>
					<ul class="hide">
				<c:forEach var="i" begin="0" end="${fn:length(m)-1}">
					<c:if test="${m[i].deptCode eq 'D3' }">
					<li value="${m[i].mNo }" class="D3">	<c:if test='${m[i].jobCode eq "J1"}'>
						대표
						</c:if>
						<c:if test='${m[i].jobCode eq "J2"}'>
						부사장
						</c:if>
						<c:if test='${m[i].jobCode eq "J3"}'>
						부장
						</c:if>
						<c:if test='${m[i].jobCode eq "J4"}'>
						차장
						</c:if>
						<c:if test='${m[i].jobCode eq "J5"}'>
						과장
						</c:if>
						<c:if test='${m[i].jobCode eq "J6"}'>
						대리
						</c:if>
						<c:if test='${m[i].jobCode eq "J7"}'>
						사원
						</c:if>
						${m[i].mName}</li>
					</c:if>
				</c:forEach>
				</ul></li>
				
				<li class="menu"><input type="checkbox" name="check" class="check" id="D4" value="D4"><a>국내영업부</a>
					<ul class="hide">
				<c:forEach var="i" begin="0" end="${fn:length(m)-1}">
					<c:if test="${m[i].deptCode eq 'D4' }">
					<li value="${m[i].mNo }" class="D4">	<c:if test='${m[i].jobCode eq "J1"}'>
						대표
						</c:if>
						<c:if test='${m[i].jobCode eq "J2"}'>
						부사장
						</c:if>
						<c:if test='${m[i].jobCode eq "J3"}'>
						부장
						</c:if>
						<c:if test='${m[i].jobCode eq "J4"}'>
						차장
						</c:if>
						<c:if test='${m[i].jobCode eq "J5"}'>
						과장
						</c:if>
						<c:if test='${m[i].jobCode eq "J6"}'>
						대리
						</c:if>
						<c:if test='${m[i].jobCode eq "J7"}'>
						사원
						</c:if>
						${m[i].mName}</li>
					</c:if>
				</c:forEach>
				</ul></li>
				
					<li class="menu"><input type="checkbox" name="check" class="check" id="D5" value="D5"><a>해외영업부</a>
					<ul class="hide">
				<c:forEach var="i" begin="0" end="${fn:length(m)-1}">
					<c:if test="${m[i].deptCode eq 'D5' }">
					<li value="${m[i].mNo }" class="D5">	<c:if test='${m[i].jobCode eq "J1"}'>
						대표
						</c:if>
						<c:if test='${m[i].jobCode eq "J2"}'>
						부사장
						</c:if>
						<c:if test='${m[i].jobCode eq "J3"}'>
						부장
						</c:if>
						<c:if test='${m[i].jobCode eq "J4"}'>
						차장
						</c:if>
						<c:if test='${m[i].jobCode eq "J5"}'>
						과장
						</c:if>
						<c:if test='${m[i].jobCode eq "J6"}'>
						대리
						</c:if>
						<c:if test='${m[i].jobCode eq "J7"}'>
						사원
						</c:if>
						${m[i].mName}</li>
					</c:if>
				</c:forEach>
				</ul></li>
					<li class="menu"><input type="checkbox" name="check" class="check" id="D6" value="D6"><a>기술지원부</a>
					<ul class="hide">
				<c:forEach var="i" begin="0" end="${fn:length(m)-1}">
					<c:if test="${m[i].deptCode eq 'D6' }">
					<li value="${m[i].mNo }" class="D6">	<c:if test='${m[i].jobCode eq "J1"}'>
						대표
						</c:if>
						<c:if test='${m[i].jobCode eq "J2"}'>
						부사장
						</c:if>
						<c:if test='${m[i].jobCode eq "J3"}'>
						부장
						</c:if>
						<c:if test='${m[i].jobCode eq "J4"}'>
						차장
						</c:if>
						<c:if test='${m[i].jobCode eq "J5"}'>
						과장
						</c:if>
						<c:if test='${m[i].jobCode eq "J6"}'>
						대리
						</c:if>
						<c:if test='${m[i].jobCode eq "J7"}'>
						사원
						</c:if>
						${m[i].mName}</li>
					</c:if>
				</c:forEach>
				</ul></li>
				
					<li class="menu"><input type="checkbox" name="check" class="check" id="D7" value="D7"><a>총무부</a>
					<ul class="hide">
				<c:forEach var="i" begin="0" end="${fn:length(m)-1}">
					<c:if test="${m[i].deptCode eq 'D7' }">
					<li value="${m[i].mNo }" class="D7">	<c:if test='${m[i].jobCode eq "J1"}'>
						대표
						</c:if>
						<c:if test='${m[i].jobCode eq "J2"}'>
						부사장
						</c:if>
						<c:if test='${m[i].jobCode eq "J3"}'>
						부장
						</c:if>
						<c:if test='${m[i].jobCode eq "J4"}'>
						차장
						</c:if>
						<c:if test='${m[i].jobCode eq "J5"}'>
						과장
						</c:if>
						<c:if test='${m[i].jobCode eq "J6"}'>
						대리
						</c:if>
						<c:if test='${m[i].jobCode eq "J7"}'>
						사원
						</c:if>
						${m[i].mName}</li>
					</c:if>
				</c:forEach>
				</ul></li>
				
					<li class="menu"><input type="checkbox" name="check" class="check" id="D8" value="D8"><a>디자인부</a>
					<ul class="hide">
				<c:forEach var="i" begin="0" end="${fn:length(m)-1}">
					<c:if test="${m[i].deptCode eq 'D8' }">
					<li value="${m[i].mNo }" class="D8">	<c:if test='${m[i].jobCode eq "J1"}'>
						대표
						</c:if>
						<c:if test='${m[i].jobCode eq "J2"}'>
						부사장
						</c:if>
						<c:if test='${m[i].jobCode eq "J3"}'>
						부장
						</c:if>
						<c:if test='${m[i].jobCode eq "J4"}'>
						차장
						</c:if>
						<c:if test='${m[i].jobCode eq "J5"}'>
						과장
						</c:if>
						<c:if test='${m[i].jobCode eq "J6"}'>
						대리
						</c:if>
						<c:if test='${m[i].jobCode eq "J7"}'>
						사원
						</c:if>
						${m[i].mName}</li>
					</c:if>
				</c:forEach>
				</ul></li>
				
					<li class="menu"><input type="checkbox" name="check" class="check" id="D9" value="D9"><a>연구개발팀</a>
					<ul class="hide">
				<c:forEach var="i" begin="0" end="${fn:length(m)-1}">
					<c:if test="${m[i].deptCode eq 'D9' }">
					<li value="${m[i].mNo }" class="D9">	<c:if test='${m[i].jobCode eq "J1"}'>
						대표
						</c:if>
						<c:if test='${m[i].jobCode eq "J2"}'>
						부사장
						</c:if>
						<c:if test='${m[i].jobCode eq "J3"}'>
						부장
						</c:if>
						<c:if test='${m[i].jobCode eq "J4"}'>
						차장
						</c:if>
						<c:if test='${m[i].jobCode eq "J5"}'>
						과장
						</c:if>
						<c:if test='${m[i].jobCode eq "J6"}'>
						대리
						</c:if>
						<c:if test='${m[i].jobCode eq "J7"}'>
						사원
						</c:if>
						${m[i].mName}</li>
					</c:if>
				</c:forEach>
				</ul></li>
				
				
				
			</div>
			<script>
				$(function(){
					$("#D1").click(function(){
						$("li").removeClass("selected");
						$("#D2").prop("checked", false);
						$("#D3").prop("checked", false);
						$("#D4").prop("checked", false);
						$("#D5").prop("checked", false);
						$("#D6").prop("checked", false);
						$("#D7").prop("checked", false);
						$("#D8").prop("checked", false);
						$("#D9").prop("checked", false);
					});
					$("#D2").click(function(){
						$("li").removeClass("selected");
						$("#D1").prop("checked", false);
						$("#D3").prop("checked", false);
						$("#D4").prop("checked", false);
						$("#D5").prop("checked", false);
						$("#D6").prop("checked", false);
						$("#D7").prop("checked", false);
						$("#D8").prop("checked", false);
						$("#D9").prop("checked", false);
					});
					$("#D3").click(function(){
						$("li").removeClass("selected");
						$("#D1").prop("checked", false);
						$("#D2").prop("checked", false);
						$("#D4").prop("checked", false);
						$("#D5").prop("checked", false);
						$("#D6").prop("checked", false);
						$("#D7").prop("checked", false);
						$("#D8").prop("checked", false);
						$("#D9").prop("checked", false);
					});
					$("#D4").click(function(){
						$("li").removeClass("selected");
						$("#D1").prop("checked", false);
						$("#D2").prop("checked", false);
						$("#D3").prop("checked", false);
						$("#D5").prop("checked", false);
						$("#D6").prop("checked", false);
						$("#D7").prop("checked", false);
						$("#D8").prop("checked", false);
						$("#D9").prop("checked", false);
					});
					$("#D5").click(function(){
						$("li").removeClass("selected");
						$("#D1").prop("checked", false);
						$("#D2").prop("checked", false);
						$("#D3").prop("checked", false);
						$("#D4").prop("checked", false);
						$("#D6").prop("checked", false);
						$("#D7").prop("checked", false);
						$("#D8").prop("checked", false);
						$("#D9").prop("checked", false);
					});
					$("#D6").click(function(){
						$("li").removeClass("selected");
						$("#D1").prop("checked", false);
						$("#D2").prop("checked", false);
						$("#D3").prop("checked", false);
						$("#D4").prop("checked", false);
						$("#D5").prop("checked", false);
						$("#D7").prop("checked", false);
						$("#D8").prop("checked", false);
						$("#D9").prop("checked", false);
					});
					$("#D7").click(function(){
						$("li").removeClass("selected");
						$("#D1").prop("checked", false);
						$("#D2").prop("checked", false);
						$("#D3").prop("checked", false);
						$("#D4").prop("checked", false);
						$("#D5").prop("checked", false);
						$("#D6").prop("checked", false);
						$("#D8").prop("checked", false);
						$("#D9").prop("checked", false);
					});
					$("#D8").click(function(){
						$("li").removeClass("selected");
						$("#D1").prop("checked", false);
						$("#D2").prop("checked", false);
						$("#D3").prop("checked", false);
						$("#D4").prop("checked", false);
						$("#D5").prop("checked", false);
						$("#D7").prop("checked", false);
						$("#D6").prop("checked", false);
						$("#D9").prop("checked", false);
					});
					$("#D9").click(function(){
						$("li").removeClass("selected");
						$("#D1").prop("checked", false);
						$("#D2").prop("checked", false);
						$("#D3").prop("checked", false);
						$("#D4").prop("checked", false);
						$("#D5").prop("checked", false);
						$("#D7").prop("checked", false);
						$("#D8").prop("checked", false);
						$("#D6").prop("checked", false);
					});
					
					
				});
			</script>
		

			<div class="plus">
				<button type="button" id="pbtn">+</button>
			</div>
			<div class="minus">
				<button type="button" id="pbtn">-</button>
			</div>
			
		
			<div class="choose">
				<c:if test="${!empty pm}">
				<c:forEach var="i" begin="0" end="${fn:length(pm)-1}">					
					<li value="${pm[i].mNo }">	<c:if test='${pmList[i].jobCode eq "J1"}'>
						대표
						</c:if>
						<c:if test='${pmList[i].jobCode eq "J2"}'>
						부사장
						</c:if>
						<c:if test='${pmList[i].jobCode eq "J3"}'>
						부장
						</c:if>
						<c:if test='${pmList[i].jobCode eq "J4"}'>
						차장
						</c:if>
						<c:if test='${pmList[i].jobCode eq "J5"}'>
						과장
						</c:if>
						<c:if test='${pmList[i].jobCode eq "J6"}'>
						대리
						</c:if>
						<c:if test='${pmList[i].jobCode eq "J7"}'>
						사원
						</c:if>  ${pm[i].mName}</li>
				</c:forEach>
				</c:if>

			</div>
			<input type="hidden" id="mList" name="memberList">
		
			<table>
				<tr>
					<td>내용</td>
					<td><textarea id="content" name="ptContent" cols="71" rows="10"
							style="border: 2px solid skyblue;">${p.pContent}</textarea></td>
				</tr>
			</table>

		</ul>
		</form>


	</div>
		<script>
				// html dom 이 다 로딩된 후 실행된다.
				$(document).ready(function() {
					// memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
					$(".menu>a").click(function() {
						// 현재 클릭한 태그가 a 이기 때문에
						// a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
						$(this).next("ul").toggleClass("hide");
					});
					$(".hide>li").click(function(){
						/* $(this).siblings().removeClass("selected"); */
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
					if($(".selected").html() ==="D1 테스트 그룹"){
						$(".D1").on('click',function(event){
							$("li").removeClass("selected");
							$(this).addClass("selected");
						});
					}
					if($(".selected").html() ==="D2 테스트 그룹"){
						$(".D2").on('click',function(event){
							$("li").removeClass("selected");
							$(this).addClass("selected");
						});
					}
					
						
					if($(".selected").html() ==="D3 테스트 그룹"){						
						$(".D3").on('click',function(event){
							$("li").removeClass("selected");
							$(this).addClass("selected");
						});
					}
					$(".selected").remove();
					var li =$(".choose li");
					var choosedivitems="";
					if(li.length>1){
						for(var i=0; i<li.length; i++){
				        	console.log(li[i]);
				        	choosedivitems +=li[i].value + ",";	
						}
						$("#mList").val(choosedivitems);
					}
					console.log($("#mList").val());
				});

				$(".plus").click(function(){				    
				    var plusitem = "value='"+mNo+"'";
				    var choosedivitems="";
					console.log($(".choose li").length);				
				    var li = $(".choose li"); 
					console.log($("input:checkbox[name='check']:checked").val());
					
					var how = 0;
					
					if($(".choose li").length <1){
						/* choosedivitems+= li.value;  */
						console.log("길이 0 통과");
						how = 0;
					}else{				     
				    	for(var i=0; i<li.length; i++){
				        	console.log(li[i]);
				        	choosedivitems +=li[i].value + ",";	
						}
						console.log("츄즈아이템"+choosedivitems);
				  	}
				
				   // console.log($(".selected").val());
				  if($(".selected").val() != null){
					  var list = choosedivitems.split(",");
					  for(var i in list){
						  if(list[i] == $(".selected").val()){
					  		how = 1;
					  		break;
						  }
					  }
				  }
				  
				  
					  // 체크 박스 
					  if(how == 0){
					  if($("#D1").is(':checked')){
						  var val =$("#D1").val();
						  $(".choose").append("<li value='"+999+"'>"+val+"</li>");
						  $(".D1").off('click');
						  $(".check").prop("checked",false);
						  console.log($("#D1").val());
					  }
					  else if($("#D2").is(':checked')){
						  var val =$("#D2").val();
						  $(".choose").append("<li value='"+998+"'>"+val+"</li>");
						  $(".D2").off('click');
						  $(".check").prop("checked",false);
					  }
					  else if($("#D3").is(':checked')){
						  var val =$("#D3").val();
						  $(".choose").append("<li value='"+997+"'>"+val+"</li>");
						  $(".D3").off('click');
						  $(".check").prop("checked",false);
					  }else{
						  if($(".D1").is(":selected"))
							  $("#D1").attr("disabled",true);
						  if($(".D2").is(":selected"))
							  $("#D2").off('click');
						  if($(".D2").is(":selected"))
							  $("#D1").off('click');
						 
					//console.log($(".selected").val());
					var mNo = $(".selected").val();
					//console.log($(".selected").html());
					var mName =$(".selected").html();
					var html = "<li value='" + mNo + "'>"+mName+"</li>";
					$(".choose").append(html);
					/* console.log("mlist"+choosedivitems); */
					$("#mList").attr('value','');
					$("#mList").val(choosedivitems+mNo);
					
				}
			}else{
				alert("이미 존재하는 인원입니다.");
			}
				  
				
			});
				
			
			</script>
	

</body>
</html>