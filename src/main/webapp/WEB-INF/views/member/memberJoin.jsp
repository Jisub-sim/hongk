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
      <form action="minsert.do" method="post" id="joinForm" onsubmit="return validate()">
    <table class="ea_table" id="minserttable" style="width:70%">
            <thead>
                <th colspan="3">
                    회원 가입 

                </th>
            </thead>
            <tr></tr>
            <tr>
					<td width="15%"> 아이디</td>
					<td width="30%">
                        <input type="text" name="mId" id="userId">
                    </td>
                    <td>   
						<!-- ajax 후에 적용 -->
						<span class="guide ok">이 아이디는 사용 가능합니다.</span>
						<span class="guide error">이 아이디는 사용할 수 없습니다.</span>
						<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck"
						value="0">
						<!-- ---------- -->
					</td> 
				</tr>
				<tr>
					<td> 이름</td>
                    <td><input type="text" name="mName"></td>
                    <td></td>
				</tr>
				<tr>
					<td> 비밀번호</td>
                    <td><input type="text" name="mPwd"></td>
                    <td></td>
				</tr>
<!-- 				<tr> -->
<!-- 					<td>* 비밀번호확인</td> -->
<!--                     <td><input type="password" name="mPwd2"></td> -->
<!--                     <td></td> -->
<!--                 </tr> -->
                <tr>
                        <td> 권한</td>
                        <td><input type="text" name="mLevel"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td> 부서</td>
                        <td>
                            <select name="deptCode" style="width:100%; height:100%;">
                           		<option>부서</option>
                                <c:forEach var="d" items="${dept}">
                                    <option value="${d.deptCode}">${d.deptTitle}</option>
                                </c:forEach>
                            </select>

                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td> 직급</td>
                        <td>
                               <select name="jobCode" style="width:100%; height:100%;">
                               <option>직급</option>
                                    <c:forEach var="j" items="${job}">
                                        <option value="${j.jobCode}">${j.jobTitle}</option>
                                    </c:forEach>
                                </select>
                           </td>
                        <td></td>
                    </tr>
				<tr>
					<td>성별</td>
                    <td><input type="radio" style="width: 10%; height:auto" name="gender" value="M">남 
                        <input type="radio" style="width: 10%; height:auto" name="gender" value="F">여</td>
                        <td></td>
				</tr>
				<tr>
					<td>나이</td>
                    <td><input type="number" min="20" max="100" name="age"></td>
                    <td></td>
				</tr>
				<tr>
					<td>이메일</td>
                    <td><input type="email" name="email"></td>
                    <td></td>
				</tr>
				<tr>
					<td>전화번호</td>
                    <td><input type="tel" name="phone"></td>
                    <td></td>
				</tr>
				<tr>
					<td>내선번호</td>
                    <td><input type="text" name="exNumber"></td>
                    <td></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td colspan="">
						<input type="text" name="post" class="postcodify_postcode5" size="6"/>
                    </td>
                    <td><button id="postcodify_search_button" class="ea_bt" type="button" style="float: left; margin-left: 2em; height: 80%;">검색</button>
						<!-- form 태그 안의 button은 default로 submit 속성을 가져
						 우편번호 관련 팝업이 뜨지 않고 form이 submit이 되어 minsert.do라는 요청이 가는 현상
						 button 태그에 type="button" 기재하기 --></td>
				</tr>
				<tr>
					<td>도로명 주소</td>
					<td colspan="2">
						<input type="text" name="address1" style="width:100%;"class="postcodify_address"/>
                    </td>
				</tr>
				<tr>
					<td>상세 주소</td>
					<td>
						<input type="text" name="address2" class="postcodify_details"/>
                    </td>
                    <td></td>
                </tr>
                <tr></tr>
				<tr>
					<td colspan="3" align="center">
						<button class="ea_bt" style="height:80%;">가입하기</button>&nbsp;
						<input type="reset" value="취소하기" style="width:10%; height:80%" class="ea_bt">
					</td> 
				</tr>
                
    </table>
    </form>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	
	<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
	
    <script>
            $(function(){
                $("#userId").on("keyup", function(){
                    var userId = $(this).val().trim();
                    
                    if(userId.length < 4){
                        $(".guide").hide(); // 작성했다가 다시 지우는 경우 span 문구를 숨김
                        $("#idDuplicateCheck").val(0);	// 0 -> 회원 가입 불가   1 -> 회원 가입 가능 
                        
                        return;	// 아이디 중복 여부 확인할 필요 없으니 아래의 ajax 호출하지 않고 종료
                    }
                    
                    $.ajax({
                        url : "dupid.do",	// MemberController에 아이디 중복확인용 메소드 추가
                        data : {id:userId},
                        success : function(data){
                            console.log(data);
                            if(data == "true"){
                                $(".guide.error").hide();
                                $(".guide.ok").show();
                                $("#idDuplicateCheck").val(1);
                            }else{
                                $(".guide.error").show();
                                $(".guide.ok").hide();
                                $("#idDuplicateCheck").val(0);
                            }
                        },
                        error : function(e){
                            console.log(e);
                        }
                    });
                });
            });
            
            function validate(){
                // form 제출 전에 아이디 중복 여부를 체크함
                if($("#idDuplicateCheck").val() == 0){
                    alert("사용 가능한 아이디를 입력해주세요.");
                    $("#userId").focus();
                    return false;
                }
                return true;
            }
            
        </script>
   </div>

</body>
</html>