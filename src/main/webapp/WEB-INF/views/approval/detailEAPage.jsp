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
/* 상단 메뉴 버튼 */
.btdiv {
	margin-bottom: 10px;
	height: 30px;
}

.btdiv button {
	margin-left: 0.3em;
	float: right;
	background: white;
	color: rgb(37, 70, 135);
}

.btdiv button:hover {
	background: rgb(37, 70, 135);
	color: white;
}

/* 내용 */
#ea_content {
	margin: auto;
	width: 80%;
	height: auto;
}

#ea_content span {
	font-size: 30px;
	font-weight: 500;
	display: inline-block;
	width: 55%;
	text-align: right;
}

#form_content_div {
	height: auto;
}

/* 결재 서명 확인 테이블*/
#approver_table {
	margin-top: 2em;
	border-collapse: collapse;
	float: right;
	width: 350px;
	text-align: center;
	border-color: lightgray;
}

#approver_table tr:last-child {
	height: 50px;
}

#approver_table tr:first-child {
	background: rgb(241, 241, 241);
}

#approver_table td {
	border-bottom: gray;
}
/* 양식 내용 테이블*/
#form_content_table {
	width: 100%;
	margin-top: 30px;
}

#form_content_table input {
	width: 99%;
	border: none;
	height: 100%;
}

#form_content_table td:nth-child(odd) {
	background: rgb(241, 241, 241);
	font-weight: bold;
}

/* 결재 처리 */
#appro_comment_table {
	width: 90%;
	margin: auto;
}

#appro_comment_table tr:last-child {
	text-align: center;
}

#ap_comment_textarea {
	width: 100%;
	resize: none;
	height: 70px;
}
</style>
</head>
<body>
	<jsp:include page="../common/include.jsp" />

	<div id="main">
		<br>
		<div id="ea_content">
			<span>기안서 작성</span>

			<table id="approver_table" border="1">
				<tr>
					<td rowspan="2">결<br>재
					</td>
					<td width="30%">대리</td>
					<td width="30%">팀장</td>
					<td width="30%">oo</td>
				</tr>
				<tr>
					<td>홍길동<br>승인<br>01.01 14:17
					</td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<table class="ea_table" border="1" id="form_content_table">
				<tr></tr>
				<tr></tr>
				<tr>
					<td width=>기안자</td>
					<td width="35%"><input type="text"></td>
					<td width="15%">기안일자</td>
					<td width="35%"><input type="text"></td>
				</tr>
				<tr>
					<td>결재자</td>
					<td class="ea_line"></td>
					<td>기안부서</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>참조자</td>
					<td class="ea_line"></td>
					<td style="border-bottom: 1px solid gray;">구분</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td style="border-bottom: 1px solid gray;">제목</td>
					<td colspan="3" style="border-bottom: 1px solid gray;"><input
						type="text"></td>

				</tr>
				<tr>

				</tr>
				<tr>
					<td colspan="4"
						style="background: white; border-bottom: 1px solid gray;">
						<div id="form_content_div">
							<pre style="text-align: left; width: 90%; margin: auto;">
                    
                    
                    
                    
    사유
                    
    다음와 같이 품의를 올리오니, 검토 후 바랍니다.
                    
                                              - 다 음 -
                    
                                              
    1.1 첨부 문서 :
                    
                    
                    
    2. 위와 같은 내용을 품의 후 결정 동시에 시행 하겠습니다.
                    


                                                -끝-
                    
                            </pre>

						</div>
					</td>
				</tr>
			</table>
			<br>
		</div>



		<!-- 결재 대시함 디테일에서 결재 버튼 클릭 시 -->
		<br> <br>
		<br>
		<hr width="90%">
		<br>
		<div>
			<table id="appro_comment_table">
				<tr>
					<td>결재처리</td>
					<td><input type="radio" id="app_radio" name="approve">
						<label for="app_radio" class="ap_radion_label">승인</label>
						&nbsp;&nbsp; <input type="radio" id="return_radio" name="approve">
						<label for="return_radio" class="ap_radion_label">반려</label></td>
				</tr>
				<tr>
					<td width="10%"><label>결재의견 </label></td>
					<td width="70%"><textarea id="ap_comment_textarea"></textarea></td>
				</tr>
				<tr>
					<td>파일</td>
					<td><input type="file"></td>
				</tr>
				<tr>
					<td colspan="2">
						<button class="ea_bt">결재</button>&nbsp;
						<button class="ea_bt">취소</button>
					</td>
				</tr>

			</table>

			<!-- 결재 완료 된 결재의견 확인 테이블-->
			<br> <br>
			<hr>
			<br>
			<table class="ea_table">
				<thead>
					<th width="10%">결재</th>
					<th width="10%">결재가</th>
					<th width="15%">부서</th>
					<th width="15%">결재일시</th>
					<th width="50%">의견</th>
				</thead>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<br> <br>
		<br>
	</div>

</body>
</html>