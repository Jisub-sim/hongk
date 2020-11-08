<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<!-- pdf 변환 관련 -->
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js"></script>

<style>
/* 상단 메뉴 버튼 */
.btdiv {
	margin-bottom: 10px;
	height: 30px;
	width:90%;
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

#eat {
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
		<!-- 결재 현황 -->
		<c:url var="approvalLog" value="approvalLog.do">
			<c:param name="ea_no" value="${ ea.ea_no }"/>
		</c:url>
		<!-- 수정 -->
		<c:url var="updateEAPage" value="updateEAPage.do">
			<c:param name="ea_no" value="${ ea.ea_no }"/>
		</c:url>
		<!-- 회수 -->
		<c:url var="takeBack" value="takeBack.do">
			  <c:param name="ea_no" value="${ ea.ea_no }"/>
		 </c:url>
		 <!-- 임시 삭제, 수정 -->
		 <c:url var="teadelete" value="teadelete.do">
				<c:param name="ea_no" value="${ ea.ea_no }"/>
		</c:url>
		<c:url var="teaupdate" value="teaupdate.do">
				<c:param name="ea_no" value="${ ea.ea_no }"/>
		</c:url>
		 <!-- 재기안 -->
		<c:url var="retryEA" value="retryEA.do">
			<c:param name="ea_no" value="${ ea.ea_no }"/>
		</c:url>
		<!-- 삭제 -->
		 <c:url var="deleteEA" value="deleteEA.do">
			<c:param name="ea_no" value="${ ea.ea_no }"/>
		</c:url>
		
		<c:url var="TBackEAList" value="TBackEAList.do"/>
		<c:url var="referEAList" value="referEAList.do"/>
		<c:url var="wEAList" value="wEAList.do"/>	
		<c:url var="completeEAList" value="completeEAList.do"/>	
		<c:url var="earequest" value="earequest.do"/>	
		<c:url var="temporEAList" value="temporEAList.do"/>				
		<c:url var="progressEAList" value="progressEAList.do"/>		
		 
		 
		<c:set var = "status" value="${ea.ea_status }" />
		<c:set var ="drafter" value="${ea.drafter}"/>
		<c:set var="Status" value="${Status}"/>
		
		<c:choose>
			<c:when test="${status eq 'W'}">
			<!-- 결재 요청함 디테일 -->
					<c:if test="${ CurPage eq 'RequestL' }">
						<div class="btdiv">
							
				            <button type="button" class="ea_bt" onclick="location.href='${takeBack}'">결재회수</button>
				            <button type="button" class="ea_bt" onclick="applog();">진행현황</button>
				            <button type="button" class="ea_bt"  onclick="fnSaveAsPdf();">PDF변환</button>
				            <button type="button" class="ea_bt"  onclick="location.href='${earequest}'">목록</button>
		       			</div>
	       			</c:if>
	       	<!-- 참조함 -->
	       			<c:if test="${ CurPage eq 'refer' }">
						<div class="btdiv">
				            <button type="button" class="ea_bt" onclick="applog();">진행현황</button>
				            <button type="button" class="ea_bt"  onclick="fnSaveAsPdf();">PDF변환</button>
				            <button type="button" class="ea_bt"  onclick="location.href='${referEAList}'">목록</button>
		       			</div>
	       			</c:if>
       		<!-- 결재 대기함  -->
       			<c:if test="${drafter != loginUser.mNo}">
       				<c:if test="${ CurPage eq 'Wait' }">
		       		<div class="btdiv">
			            <a href="#approvaldiv" ><button type="button" class="ea_bt" id="goapproval">결재</button></a>
			            <button type="button" class="ea_bt"  onclick="location.href='${updateEAPage}'">수정</button>
			            <button type="button" class="ea_bt"  onclick="applog();">진행현황</button>
			            <button type="button" class="ea_bt"  onclick="fnSaveAsPdf();">PDF변환</button>
			            <button type="button" class="ea_bt"  onclick="location.href='${wEAList}'">목록</button>
			        </div>
			       </c:if>
			  <!--  결재 진행함 -->
			       <c:if test="${ CurPage eq 'Progress' }">
			       <div class="btdiv">
			       		<button type="button" class="ea_bt"  onclick="applog();">진행현황</button>
			            <button type="button" class="ea_bt"  onclick="fnSaveAsPdf();">PDF변환</button>
			            <button type="button" class="ea_bt"  onclick="location.href='${progressEAList}'">목록</button>
			        </div>
			       </c:if>
       			</c:if>
			</c:when>
			<c:when test="${status eq 'T'}">
			 <!-- 임시 저장함 디테일  -->
	        <div class="btdiv">
	                <button type="button" class="ea_bt" onclick="location.href='${teaupdate}'">완료</button>
	                <button type="button" class="ea_bt" onclick="location.href='${updateEAPage}'">수정</button>
	                <button type="button" class="ea_bt" onclick="location.href='${teadelete}'">삭제</button>
	                <button type="button" class="ea_bt" onclick="fnSaveAsPdf();">PDF변환</button>
	                <button type="button" class="ea_bt" onclick="location.href='${temporEAList}'">목록</button>
	            </div>
			</c:when>
			<c:when test="${status eq 'C'}">
			 <!-- 결재 완료함 디테일  -->
	        <div class="btdiv">
	                <button type="button" class="ea_bt" onclick="applog();">진행현황</button>
	                <button type="button" class="ea_bt" onclick="fnSaveAsPdf();">PDF변환</button>
	                <button type="button" class="ea_bt" onclick="location.href='${completeEAList}'">목록</button>
	            </div>
			</c:when>
			<c:when test="${status eq 'B'}">
			 <!-- 반려 디테일  -->
			  <c:if test="${drafter == loginUser.mNo}">
	        	<div class="btdiv">
 					<button type="button" class="ea_bt"  onclick="location.href='${updateEAPage}'">수정</button>
	                <button type="button" class="ea_bt" onclick="retryEA();">재기안</button>
	                <button type="button" class="ea_bt" onclick="applog();">진행현황</button>
	                <button type="button" class="ea_bt" onclick="location.href='${earequest}'">목록</button>
	            </div>
	             </c:if>
	            <c:if test="${ CurPage eq 'TBack'  && drafter != loginUser.mNo}">
		          <div class="btdiv">
		               <button type="button" class="ea_bt" onclick="applog();">진행현황</button>
		                <button type="button" class="ea_bt" onclick="location.href='${TBackEAList}'">목록</button>
		            </div>
		          </c:if>
			</c:when>
			<c:when test="${status eq 'R'}">
				 <!-- 결재 회수 디테일  -->
		        	<div class="btdiv">
						<button type="button" class="ea_bt" onclick="retryEA();">재기안</button>
		                <button type="button" class="ea_bt" onclick="location.href='${updateEAPage}'">수정</button>
		                <button type="button" class="ea_bt" onclick="deleteEA();">삭제</button>
		                <button type="button" class="ea_bt" onclick="location.href='${earequest}'">목록</button>
		            </div>
		         
			</c:when>
		</c:choose>
		<script>
			function retryEA(){
				var result = confirm("재기안 하시겠습니까?"); 
				if(result){ 
					location.href='${retryEA}';
				}else{ 
					return; 
				} 
			}
			
			function deleteEA(){
				var result = confirm("삭제 하시겠습니까?"); 
				if(result){ 
					location.href='${deleteEA}';
				}else{ 
					return; 
				} 
			}
		</script>
  		
		<div id="ea_content">
			<span id="eat">기안서 작성</span>
			
			<table id="approver_table" border="1">
				<tr>
					<td rowspan="2" width="10%">결<br>재
					</td>
					<c:forEach var ="app" items="${ ap }">
						<td width="30%">${ app.job_Title }</td>
<!-- 					<td width="30%">대리</td> -->
<!-- 					<td width="30%">팀장</td> -->
<!-- 					<td width="30%">oo</td> -->
						
					</c:forEach>
				</tr>
				<tr style="height:90px;">
				<c:forEach var ="app1" items="${ ap }">
					<c:set var="status" value="${app1.approval_status}"/>
					<c:set var="approver_no" value="${app1.approver_no}"/>
					<c:set var="i" value="tr"/>
						<td >
						<c:if test="${ status ne 'W' }">
							${app1.mName }
							<br>
							<!-- 전자 서명이 존재 하지 않는다면 -->
							<c:forEach var="sig" items="${ sig }"> 
							<script>
								console.log("approver_no : " + approver_no)
								console.log("sig.mno : " + sig.mno)
							</script>
								<!-- 서명 존재 한다면 -->
								<c:if test="${ approver_no == sig.mno }">		
									<img src="${pageContext.request.contextPath}/resources/SigFileUpload/${ sig.reName_FileName }" class="sig_img">
									<c:set var="i" value="fl"/>
								</c:if>
<%-- 								<c:if test="${ approver_no ne sig.mno }">		 --%>
										
<%-- 								</c:if>	 --%>
							</c:forEach>
									<c:if test="${ i eq 'tr' }">
										<c:if test="${ status eq 'Y' }">
											승인
										</c:if>
										<c:if test="${ status eq 'N' }">
											<label style="color:red;">반려</label>
										</c:if>
									</c:if>
									<br><fmt:formatDate var="approval_date" type="date" value="${app1.approval_date }" pattern="yyyy-MM-dd HH:mm"/>
											${approval_date }
						</c:if>	
							<!--  결재 전  -->				
							<c:if test="${ status eq  'W'}">
								${app1.mName }
								<br>
								미결
								<br>
							</c:if>
						
						</td>
				</c:forEach>
				</tr>
			</table>
			
			<table class="ea_table" border="1" id="form_content_table">
				<tr></tr>
				<tr></tr>
				<tr>
					<td width=>기안자</td>
					<td width="35%">${ ea.mName }</td>
					<td width="15%">기안일자</td>
					<td width="35%"><fmt:formatDate var="draftng_date" type="date" value="${ea.draftng_date }" pattern="yyyy-MM-dd"/>
					${draftng_date }</td>
				</tr>
				<tr>
					<td>결재자</td>
					<td > 
						<c:forEach var="a" items="${ ap }">
							${ a.mName } &nbsp;
						</c:forEach>
					</td>
					<td>기안부서</td>
					<td>${ ea.deptTitle }</td>
				</tr>
				<tr>
					<td>참조자</td>
					<td >
						<c:forEach var="r" items="${ ref }">
							${ r.mName } &nbsp;
						</c:forEach>
					</td>
					<td style="border-bottom: 1px solid gray;">결재 번호</td>
					<td>${ ea.ea_no }</td>
				</tr>
				<tr>
					<td style="border-bottom: 1px solid gray;">제목</td>
					<td colspan="3" style="border-bottom: 1px solid gray;">${ ea.ea_title }</td>
				</tr>
				<tr>

				</tr>
				<tr>
					<td colspan="4"
						style="background: white; border-bottom: 1px solid gray;">
						<div id="form_content_div">
							<pre style="text-align: left; width: 90%; margin: auto;">${ ea.ea_content }</pre>
						</div>
					</td>
				</tr>
				<tr></tr>
				<tr>
				<td>첨부파일</td>
					<td colspan="3">
						<c:if test="${ !empty f.original_FileName }">
							<a href="${ contextPath }/resources/EAFileUpload/${ f.reName_FileName }" download="${ f.original_FileName }">${ f.original_FileName }</a>
						</c:if>
					</td>
				</tr>
			</table>
			<br>
		</div>

		<!-- 결재 대기함 디테일에서 결재 버튼 클릭 시 -->
		<br> <br>
		<br>
		
		<div id="approvaldiv" style="display:none">
		<hr width="90%">
		<br>
		<form action="apInsert.do" method="post" enctype="multipart/form-data">
			<input type="hidden" value="${ ea.ea_no }" name="ea_no">
			<table id="appro_comment_table">
				<tr>
					<td>결재처리</td>
					<td><input type="radio" id="app_radio" name="approval_status" value="Y">
						<label for="app_radio" class="ap_radion_label">승인</label>
						&nbsp;&nbsp; 
						<input type="radio" id="return_radio" name="approval_status" value="N">  
						<label for="return_radio" class="ap_radion_label">반려</label></td>
				</tr>
				<tr>
					<td width="10%"><label>결재의견 </label></td>
					<td width="70%"><textarea id="ap_comment_textarea" name="approval_comment"></textarea></td>
				</tr>
				<tr>
					<td>파일</td>
					<td><input type="file" name="uploadFile"></td>
				</tr>
				<tr>
					<td colspan="2">
						<button class="ea_bt" type="submit">결재</button>&nbsp;
						<button class="ea_bt" id="cancelap" type="button">취소</button>
					</td>
				</tr>
			</table>
		</form>	
			<!-- 결재 완료 된 결재의견 확인 테이블-->
			<br> <br>
			<hr>
			<br>
			<table class="ea_table" id="aptalbe">
				<thead>
					<th width="10%">결재</th>
					<th width="10%">결재가</th>
					<th width="15%">부서</th>
					<th width="15%">결재일시</th>
					<th width="50%">의견</th>
				</thead>
				<c:forEach var ="ap" items="${ ap }">
				<tr>
					<c:set var="status" value="${ ap.approval_status }"/>
					<td>
						<c:if test="${ status eq 'Y' }">
							승인
						</c:if>
						<c:if test="${ status eq 'N' }">
							반려
						</c:if>
					</td>
					
					<td>${ap.mName }</td>
					<td>${ap.deptTitle }</td>
					<td><fmt:formatDate var="approval_date" type="date" value="${ap.approval_date }" pattern="yyyy-MM-dd HH:mm:ss"/>${approval_date }</td>
					<td>${ap.approval_comment }</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<!--  결재 div 끝 -->
		<br> <br>
		<br>
	</div>
	<script>
	$(function(){
		$("#goapproval").on("click",function(){
			$("#approvaldiv").show();
			
		});
		
		$("#cancelap").on("click",function(){
			$("#approvaldiv").hide();
		});
	})
	
////// 피디에프 변환
      function fnSaveAsPdf() {
        html2canvas(document.querySelector("#ea_content")).then(function(canvas) {
//           var imgData = canvas.toDataURL('image/png');
//           var imgWidth = 210;
//           var pageHeight = imgWidth * 1.414;
//           var imgHeight = canvas.height * imgWidth / canvas.width;

//           var doc = new jsPDF({
//             'orientation': 'p',
//             'unit': 'mm',
//             'format': 'a4'
//           });

//           doc.addImage(imgData, 'PNG', 0, 0, imgWidth, imgHeight);
//           doc.save('${ ea.ea_title }'+'.pdf');
//           console.log('Reached here?');
        	 // 캔버스를 이미지로 변환
    	    var imgData = canvas.toDataURL('image/png');
    		     
    	    var imgWidth = 170; // 이미지 가로 길이(mm) / A4 기준 210mm
    	    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
    	    var imgHeight = canvas.height * imgWidth / canvas.width;
    	    var heightLeft = imgHeight;
    	    var margin = 18; // 출력 페이지 여백설정
    	    var doc = new jsPDF('p', 'mm');
    	    var position = 20;
    	       
    	    // 첫 페이지 출력
    	    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
    	    heightLeft -= pageHeight;
    	         
    	    // 한 페이지 이상일 경우 루프 돌면서 출력
    	    while (heightLeft >= 20) {
    	        position = heightLeft - imgHeight;
    	        doc.addPage();
    	        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
    	        heightLeft -= pageHeight;
    	    }
    	 
    	    // 파일 저장
    	    doc.save('${ ea.ea_title }'+'.pdf');
        });
      }

	  function applog(){
      		window.open('${approvalLog}','window_name','width=700,height=250,left=300,top=250,location=no,toolbar=no,menubar=no,status=no,scrollbars=yes');
      };
      
	</script>
</body>
</html>