<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/approvalcss.css">
    
    
<title>Insert title here</title>
</head>
<style>
 table.type09 {
        border-collapse: collapse;
        text-align: left;
        line-height: 1.5;
        margin-left:300px;
        width: 40%;
        

    }

    table.type09 thead th {
        padding: 10px;
        font-weight: bold;
        vertical-align: top;
        color: #369;
        border-bottom: 3px solid #036;
    }

    table.type09 tbody th {
        width: 35%;
        padding: 10px;
        font-weight: bold;
        vertical-align: top;
        border-bottom: 1px solid #ccc;
        background: #f3f6f7;
    }

    table.type09 td {
        width: 70%;
        padding: 10px;
        vertical-align: top;
        border-bottom: 1px solid #ccc;
    }



    .wrap {
        position: absolute;
        top: 50%;
        left: 50%;

        text-align: center;
    }
    .ann-bt {
        background-color: #369;
        border: 1px solid white;
        border-radius: 10px;
        color: white;
        width: 70px;
        height: 30px;
        margin-left: 80px;
       


    }
    .annAllbt{
    	margin-left: 300px;
    }
    
    #smartEditor{
    width:100%;
    	height:35vh;
    	resize: none;
    }
</style>
<body>

	<form action="annupdate.do" method="post" enctype="multipart/form-data">
 <table class="type09">
        <thead>
            <tr>
                <th scope="cols">신청내역</th>
                <th scope="cols"></th>
            </tr>
        </thead>
        <tbody>
            <tr>
            <%-- <c:forEach> --%>
     <%--        <td>
            	글번호
            </td>
            <td>
            ${ann.annual_no }
            </td> --%>
                <th scope="row">휴가종류</th>
                <c:set var="ann_type" value="${ann.annual_type }"/>
                <td>
                    <c:if test="${ ann_type eq '0'}">연차유급휴가</c:if>
                    <c:if test="${ ann_type eq '1'}">병가</c:if>
                    <c:if test="${ ann_type eq '2'}">경조</c:if>
                    <c:if test="${ ann_type eq '3'}">월차</c:if>
                    <c:if test="${ ann_type eq '4'}">반차</c:if>
                </td>
            </tr>
           <%--  </c:forEach> --%>
            <tr>
                <th scope="row">신청 기간</th>
                <td>${ ann.annual_start } - ${ ann.annual_end }
                    <p>사용일수 : ${ann.annual_day_use }</p>
                </td>
            </tr>
            <tr>
                <th scope="row">반차 여부</th>
                <td>
                <c:if test="${ann.annual_halftime != null }">
                	<p>
                	<c:if test="${ann.annual_halftime eq 'am'}">오전반차</c:if>
                	<c:if test="${ann.annual_halftime eq 'pm'}">오후반차</c:if>
                	<c:if test="${ann.annual_halftime eq 'none'}">없음</c:if>
                	</p>
                </c:if>
                <p>
               <%--  <c:if test="${ann.annual_halftime == none }">
               			 없음
                </c:if> --%>
                </p>
                </td>
            </tr>
            <tr>
                <th scope="row">휴가사유</th>
                <td><textarea name="annual_content" id="smartEditor" style="width:400px; height:200px;">${ ann.annual_content }</textarea>
                <input type="hidden" value="${ ann.annual_no }" name="annual_no">
                </td>
            </tr>
        </tbody>
    </table>
   
    <br><br>
    
    
				<c:if test="${ann.ann_status eq 'W'}">
				<c:url var="anndelete" value="anndelete.do">
					<c:param name="annual_no" value="${ ann.annual_no }"/>
				</c:url>
				<c:url var="annList" value="annList.do">
					<c:param name="page" value="${ currentPage }"/>
				</c:url>
				<div class="annAllbt">
					<button class="ann-bt" onclick="location.href='${ annList }'">목록</button>
					<button type="submit" class="ann-bt" >수정하기</button> 
					<button class="ann-bt" onclick="location.href='${ anndelete }'">삭제하기</button> 
				</div>
				</c:if>
				
				
				
				<c:if test="${ann.ann_status eq 'Y'}">
				 <c:url var="annUseList" value="annUseList.do">
					<c:param name="page" value="${ currentPage }"/>
				</c:url>
				
				<div class="annAllbt">
					<button class="ann-bt" onclick="location.href='${ annUseList }'">목록</button>
				</div>
				
				</c:if>
</form>

  <script type="text/javascript">
    var oEditors = [];
    nhn.husky.EZCreator.createInIFrame({ 
    	oAppRef : oEditors,
    	elPlaceHolder : "smartEditor", 
    	sSkinURI : "${pageContext.request.contextPath}/resources/se2/SmartEditor2Skin.html", //경로를 꼭 맞춰주세요! 
    	fCreator : "createSEditor2", htParams : { 
    	// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
    	bUseToolbar : true, 
    	// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
    	bUseVerticalResizer : false, 
    	// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
    	bUseModeChanger : false
    	} 
    }); 
    
    $(function() { 
		$("#savebutton").click(function() { 
			oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []); 
			var content = document.getElementById("smartEditor").value;
			document.getElementById("smartEditor").setAttribute('name','annual_content' );

			var result = confirm("등록 하시겠습니까?"); 
			if(result){ 
				
			}else{ 
				return; 
			} 
		}); 
	})
	
	</script>
</body>
</html>