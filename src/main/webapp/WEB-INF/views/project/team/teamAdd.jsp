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
	float: left;
	padding-left: 50px;
	padding-top: 20px;
}

#save {
	float: right;
	padding: 20px;
	margin-right: 80px;
}

#team_create {
	margin-left: 100px;
	margin-top: 70px;
}

#team_create table {
	margin-left: -5px;
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
</style>
</head>
<body>
	<jsp:include page="../../common/include.jsp" />

	<div id="main">
		<li><a href="teamcare.do" id="back">뒤로가기</a> <a href="" id="save">저장</a>
		</li>
		<ul id="team_create">
			<li>팀명 <input type="text" size="100" id="tn"
				style="border: 2px solid skyblue;"></li>
			<table>
				<th id="m">팀구성</th>
				<th id="m1">대상자</th>
				<th id="m2">선택목록</th>
			</table>
			<div class="mem">
				<li class="menu"><input type="checkbox" name="check" class="check" id="D1" value="D1 테스트 그룹"><a>D1 테스트 그룹</a>
					<ul class="hide">
				<c:forEach var="i" begin="0" end="${fn:length(m)-1}">
					<c:if test="${m[i].deptCode eq 'D1' }">
					<li value="${m[i].mNo }" class="D1">${m[i].jobCode}    ${m[i].mName}</li>
					</c:if>
				</c:forEach>
				</ul></li>
				
				<li class="menu"><input type="checkbox" name="check" class="check" id="D2" value="D2 테스트 그룹"><a>D2 테스트 그룹</a>
					<ul class="hide">
				<c:forEach var="i" begin="0" end="${fn:length(m)-1}">
					<c:if test="${m[i].deptCode eq 'D2' }">
					<li value="${m[i].mNo }" class="D2">${m[i].jobCode}    ${m[i].mName}</li>
					</c:if>
				</c:forEach>
				</ul></li>
				
				<li class="menu"><input type="checkbox" name="check" class="check" id="D3" value="D3 테스트 그룹"><a>D3 테스트 그룹</a>
					<ul class="hide">
				<c:forEach var="i" begin="0" end="${fn:length(m)-1}">
					<c:if test="${m[i].deptCode eq 'D3' }">
					<li value="${m[i].mNo }" class="D3">${m[i].jobCode}    ${m[i].mName}</li>
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
					});
					$("#D2").click(function(){
						$("li").removeClass("selected");
						$("#D1").prop("checked", false);
						$("#D3").prop("checked", false);
					});
					$("#D3").click(function(){
						$("li").removeClass("selected");
						$("#D1").prop("checked", false);
						$("#D2").prop("checked", false);
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

			</div>

			<table>
				<tr>
					<td>내용</td>
					<td><textarea id="content" cols="71" rows="10"
							style="border: 2px solid skyblue;"></textarea></td>
				</tr>
			</table>

		</ul>


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
						$(".D1").on('click',function(event){
							$("li").removeClass("selected");
							$(this).addClass("selected");
						});
					}
					
						
					if($(".selected").html() ==="D3 테스트 그룹"){						
						$(".D1").on('click',function(event){
							$("li").removeClass("selected");
							$(this).addClass("selected");
						});
					}
					$(".selected").remove();
				
				});

				$(".plus").click(function(){				    
				    var plusitem = "value='"+mNo+"'";
				    var choosedivitems="";
				    var choosedivhtml="";
					console.log($(".choose li").length);				
				    var li = $(".choose li"); 
					console.log($("input:checkbox[name='check']:checked").val());
					if($(".choose li").length = 0){
						choosedivitems+= li.value; 
						choosedivhtml += li.innerHTML;
					}else{				     
				    	for(var i=0; i<li.length; i++){
				        	console.log(li[i]);
				        	choosedivitems +=li[i].value + " ";	
				        	choosedivhtml +=li[i].innerHTML + " ";
						console.log("츄즈아이템"+choosedivitems);
						console.log("츄즈html"+choosedivhtml);
				  		}
					}
				
				   // console.log($(".selected").val());
				  if(choosedivitems.indexOf($(".selected").val())!= -1|| 
						  choosedivhtml.indexOf($("input:checkbox[name='check']:checked").val()) != -1){
					  alert('이미 존재하는 값 입니다.');
				  }else{
					  // 체크 박스 
					  if($("#D1").is(':checked')){
						  var val =$("#D1").val();
						  $(".choose").append("<li value='D1'>"+val+"</li>");
						  $(".D1").off('click');
						  $(".check").prop("checked",false);
					  }
					  else if($("#D2").is(':checked')){
						  var val =$("#D2").val();
						  $(".choose").append("<li value='D2'>"+val+"</li>");
						  $(".D2").off('click');
						  $(".check").prop("checked",false);
					  }
					  else if($("#D3").is(':checked')){
						  var val =$("#D3").val();
						  $(".choose").append("<li value='D3'>"+val+"</li>");
						  $(".D3").off('click');
						  $(".check").prop("checked",false);
					  }else{					  
					//console.log($(".selected").val());
					var mNo = $(".selected").val();
					//console.log($(".selected").html());
					var mName =$(".selected").html();
					var html = "<li value='" + mNo + "'>"+mName+"</li>";
					$(".choose").append(html);
				}
			}
				  
				
			});
				
			
			</script>
	

</body>
</html>