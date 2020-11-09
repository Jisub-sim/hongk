<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<style>
.category{
	border: 1px solid black;
	font-size: 16px;	
}

.title_area{
margin-left: 120px;

}

#contenttitle { 
	width: 450px;
	margin:20px;	
	font-size: 18px;
	padding: 10px;
	border: 1px solid skyblue;
	border-radius: 10px;	
}
 .editor{
 	margin-left: 80px;
    width:900px;
    height:60vh;
    resize: none;
    }
 #smartEditor{
    width:850px;
    height:510px;
    resize: none;
    }
.button_area{
margin-left: -20px;
}

.button_area >button{
    width: 200px;
    height: 50px;
    border-radius: 10px;
    
}
.newcontent{
background-color: green;
color: white;
}
.backlist{
 	color:white;
 	background-color: red;
}

   
</style>
<body>
<script>
	function Back(){
		window.history.back();
	}
</script>
<c:import url="../common/include.jsp"/>
<div id="main">
	<div class="detailtitle">
		<h1 style="text-align: center;">게시글 수정</h1><hr>
	</div>
	<form action="bupdate.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="page" value="${ currentPage }">
	<input type="hidden" name="bId" value="${ board.bId }">
	
	<table id="boardTable">
			<tr>
				<td>
					<div class="title_area">
					<input type="checkbox" value="1" name="b_Level" >중요 
					    <select id="category"class="category" name="b_Type">
			                <option value="" >카테고리 선택</option>
			                <option value="공지" <c:if test="${ board.b_Type  =='공지' }">selected</c:if>>공지</option>
			                <option value="제안" <c:if test="${ board.b_Type  =='제안' }">selected</c:if>>제안</option>
			                <option value="부서" <c:if test="${ board.b_Type  =='부서' }">selected</c:if>>부서</option>
			                <option value="자유" <c:if test="${ board.b_Type  =='자유' }">selected</c:if>>자유</option>
                		</select>
						<input id="contenttitle" type="text" placeholder="제목을 입력하세요" name="bTitle" value="${ board.bTitle }">
						<input type="hidden" readonly name="bWriter" value="${ loginUser.mId }">
						<%-- <input type="text"  size="50"> --%>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="editor">
		  				 	<textarea  name="smartEditor" id="smartEditor"></textarea>
		  				 	<br><br>
						<div class="button_area" align="center">
							<button type="submit" class="newcontent" id="savebutton">수정하기</button>&nbsp;
							<c:url var="blist" value="blist.do">
								<c:param name="page" value="${ currentPage }"/>
							</c:url>
							<button id="cancelbtn" type="button" class="backlist"
								onclick="javascript:history.back();">취소하기</button>
						</div>
					</div>
				</td>
			</tr>		
		</table>
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
        	},
        	fOnAppLoad : function(){
                //textarea 내용을 에디터상에 바로 뿌려주고자 할때 사용
                oEditors.getById["smartEditor"].exec("PASTE_HTML", ["${board.bContent}"]);
            },
            fCreator: "createSEditor2"
        }); 
        
      

         	
        $(function() { 
			$("#savebutton").click(function() {   
				oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []); 
				//textarea의 id를 적어줍니다. 
 				var selcatd = $("#category > option:selected").val(); 
				var title = $("#contenttitle").val(); 
				var content = document.getElementById("smartEditor").value;
				document.getElementById("smartEditor").setAttribute('name','bContent' );
			


 				if (selcatd == "") { alert("카테고리를 선택해주세요.");
 					return false; 
 				} 
				
 				if (title == null || title == "") {
 					alert("제목을 입력해주세요."); $("#title").focus();
 					return false; 
 				} 
				
				if(content == "" || content == null || 
						content == '&nbsp;' || content == '<br>' || 
						content == '<br/>' || content == '<p>&nbsp;</p>'){ 
					alert("본문을 작성해주세요."); 
					
					oEditors.getById["smartEditor"].exec("FOCUS"); //포커싱 
					return; 
					} //이 부분은 스마트에디터 유효성 검사 부분이니 참고하시길 바랍니다. 
					var result = confirm("작성을 완료하시겠습니까?"); 
					if(result){ 
						alert("작성 완료!"); 
						//$("#noticeWriteForm").submit(); 
					}else{ 
						return false; 
						} 
					}); 
			})
        </script>
</div>
</body>
</html>