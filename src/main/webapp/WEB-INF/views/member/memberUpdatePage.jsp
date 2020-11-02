<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Page Title</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
   integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
   crossorigin="anonymous"></script>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/approvalcss.css">
<style>
	#minserttable input{
	    height: 80%; 
	    width: 100%;
	    border: 1px solid lightgray;
	    margin-left:1em;
	}
	
	span.guide {
	display:none;
	font-size:12px;
	top:12px;
	right:10px;
	}
	span.ok {
		color:green;
	}
	span.error {
		color:red;
	}
	
	#minserttable td:first-child {
	background: rgba(183, 209, 241, 0.313);
	color:rgb(90, 90, 90);
	}
	
	#minserttable select{
	margin-left:1em;
	}
	
</style>
</head>
<body>
   <jsp:include page="../common/include.jsp" />

   <div id="main">
      <br><br>
		<form action="mupdate.do" method="post" id="updateForm">
    <table class="ea_table" id="minserttable" style="width:70%">
            <thead>
                <th colspan="3">
          			${ loginUser.mName }님의 정보보기
                </th>
            </thead>
            <tr></tr>
            <tr>
				<td width="15%"> 아이디</td>
				<td width="30%">
                     <input type="text" name="mId" id="userId" value="${ loginUser.mId }" readonly>
                 </td>
                 <td></td> 
			</tr>
			<tr>
				<td> 이름</td>
                <td><input type="text" name="mName" value="${ loginUser.mName }" required ></td>
                <td></td>
				</tr>
				<tr id="curpwdTr">
					<td>현재 비밀번호</td>
                    <td><input type="password"  id="curPwdInput"></td>
                    <td><button type="button" id="curpwd" class="ea_bt" onclick="curPwdFunc();" style="float: left; margin-left: 2em; height: 80%;">확인</button></td>
				</tr>
				<tr class="mpwdTr" style="display:none">
					<td>새 비밀번호</td>
                    <td><input type="password" id="newP1"></td>
                    <td></td>
				</tr>
				<tr class="mpwdTr" style="display:none">
					<td>비밀번호 확인</td>
                    <td><input type="password" name="mPwd" id="newP2"></td>
                    <td></td>
				</tr>
				<tr>
					<td>성별</td>
                    <td><input type="radio"  style="width: 10%; height:auto" name="gender" value="M" <c:if test="${ loginUser.gender eq 'M' }">checked</c:if>>남 
						<input type="radio"  style="width: 10%; height:auto" name="gender" value="F" <c:if test="${ loginUser.gender eq 'F' }">checked</c:if>>여
						</td>
                        <td></td>
				</tr>
				<tr>
					<td>나이</td>
                    <td><input type="number" min="20" max="100" name="age" value="${ loginUser.age }"></td>
                    <td></td>
				</tr>
				<tr>
					<td>이메일</td>
                    <td><input type="email" name="email" value="${ loginUser.email }"></td>
                    <td></td>
				</tr>
				<tr>
					<td>전화번호</td>
                    <td><input type="tel" name="phone" value="${ loginUser.phone }"></td>
                    <td></td>
				</tr>
				<tr>
					<td>내선번호</td>
                    <td><input type="text" name="exNumber" value="${ loginUser.exNumber }"></td>
                    <td></td>
				</tr>
				<c:forTokens items="${ loginUser.address }" var="addr" delims=","
				varStatus="status">
					<c:if test="${ status.index eq 0 }">
						<c:set var="addr1" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 1 }">
						<c:set var="addr2" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 2 }">
						<c:set var="addr3" value="${ addr }"/>
					</c:if>
				</c:forTokens>
				<tr>
					<td>우편번호</td>
					<td colspan="">
						<input type="text" name="post" class="postcodify_postcode5" size="6" value="${ addr1 }"/>
                    </td>
                    <td><button id="postcodify_search_button" class="ea_bt" type="button" style="float: left; margin-left: 2em; height: 80%;">검색</button>
						<!-- form 태그 안의 button은 default로 submit 속성을 가져
						 우편번호 관련 팝업이 뜨지 않고 form이 submit이 되어 minsert.do라는 요청이 가는 현상
						 button 태그에 type="button" 기재하기 --></td>
                   
				</tr>
				<tr>
					<td>도로명 주소</td>
					<td colspan="2">
						<input type="text" name="address1" style="width:100%;"class="postcodify_address" value="${ addr2 }"/>
                    </td>
				</tr>
				<tr>
					<td>상세 주소</td>
					<td>
						<input type="text" name="address2" class="postcodify_details" value="${ addr3 }"/>
                    </td>
                    <td></td>
                </tr>
                <tr></tr>
				
				<tr>
				<td colspan="3" style="background:white"><input type="button"  id="upBt" class="ea_bt" style="width:15%;" value="수정하기">&nbsp;</td>
				<input type="hidden" id="logPwd" value="${ loginUser.mPwd }">
				</tr>
				
                
    </table>
    </form>
    
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	
	<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
	
    <script>
    function curPwdFunc(){
    	var curPwd = $("#curPwdInput").val();
    	var loginPwd =  $("#logPwd").val();
    	
    	console.log('curPwd : ' + curPwd);
    	console.log('loginPwd : ' + loginPwd);
    	if(curPwd== loginPwd){
    		$(".mpwdTr").show();
			$("#curpwdTr").hide();
    	}else{
    		alert("현재 비밀번호가 일치 하지 않습니다.")
    	}
    	
    	
    }
    
    
    $(function(){
		$("#upBt").on("click",function(){
			var newP1 = $("#newP1").val();
	    	var newP2 =  $("#newP2").val();
	    	
	    	if(newP1 == newP2){
				document.getElementById("upBt").setAttribute('type','submit' );
	    	}else{
	    		alert("비밀번호가 일치하지 않습니다.")
	    		var newP1 = document.getElementById("newP1"); newP1.value = null;
	    		var newP2 = document.getElementById("newP2"); newP2.value = null;
	    		$("#newP1").focus();
	    	}
			
			
		});
    })	
       </script>
   </div>

</body>
</html>