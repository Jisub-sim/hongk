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
 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<style>
 #form_title{
        text-align: center;
        font-size: 20px;
        font-weight: 500;
    }

    #form_title input{
        font-size: 20px;
    }

     #ea_create_table{
         border-color:  rgba(183, 209, 241, 0.313);
         width: 80%;
         color: gray;
     }
     #ea_create_table input{
         width: 98%;
         border: none;
         height: 100%;
     }
     #ea_create_table td:nth-child(odd){
        background: rgb(241, 241, 241);
        font-weight: bold;
     }
    #ea_control_bt_div {
        margin: auto;
        width: 80%;
    }
    #ea_control_bt_div button{
      
       float: right;
       margin-left: 1em;
    }
    #smartEditor{
    width:100%;
    	height:50vh;
    	resize: none;
    }
</style>
</head>
<body>
   <jsp:include page="../common/include.jsp" />

   <div id="main">
      <br>
   <form action="forminsert.do" method="post">
    <div id="includedContent"></div>

    <br>
    <p id="form_title">전자결재 양식 등록</p>
    <br><Br>
    
    <table class="ea_table" border="1" id="ea_create_table" >
    <tr>
        <td width="15%">양식명</td>
        <td width="35%"><input type="text" name="form_name" required ></td>
        <td width="15%">서식함</td>
        <td width="35%"><input type="text" name="form_category" required ></td>
    </tr>
    <tr>
        <td>양식유형</td>
        <td><input type="text" name="form_type" required ></td>
		
    </tr>
    <tr></tr>
    <tr>
        <td colspan="4" style="background: white">
            <textarea name="smartEditor" id="smartEditor" rows="10" cols="100"></textarea>
        </td>
    </tr>
    <tr></tr>
    <tr><td colspan="4" style="text-align: left;"> &nbsp; 파일 업로드 </td></tr>
    <tr><td colspan="4" style=" background: white"></td></tr>
    </table>
    <br>
    <input type="hidden" name="mno" value="${ loginUser.mNo }">
   
    <div id="ea_control_bt_div">
        <button type="button" class="ea_bt">취소</button> 
        <button type="submit" class="ea_bt" id="savebutton">등록</button>
    </div>
    
<%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>

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
        
//         $("#submitModifyBoardBtn").click(function() {

//         	oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);

//         	});

		$(function() { 
			$("#savebutton").click(function() { 
				oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []); 
				//textarea의 id를 적어줍니다. 
// 				var selcatd = $("#selcatd > option:selected").val(); 
				var title = $("#title").val(); 
				var content = document.getElementById("smartEditor").value;
				document.getElementById("smartEditor").setAttribute('name','form_content' );
			


// 				if (selcatd == "") { alert("카테고리를 선택해주세요.");
// 					return; 
// 				} 
				
// 				if (title == null || title == "") {
// 					alert("제목을 입력해주세요."); $("#title").focus();
// 					return; 
// 				} 
				
				if(content == "" || content == null || 
						content == '&nbsp;' || content == '<br>' || 
						content == '<br/>' || content == '<p>&nbsp;</p>'){ 
					alert("본문을 작성해주세요."); 
					oEditors.getById["smartEditor"].exec("FOCUS"); //포커싱 
					return; 
					} //이 부분은 스마트에디터 유효성 검사 부분이니 참고하시길 바랍니다. 
					var result = confirm("발행 하시겠습니까?"); 
					if(result){ 
						alert("발행 완료!"); 
						//$("#noticeWriteForm").submit(); 
					}else{ 
						return; 
						} 
					}); 
			})


        	
        </script>
        </form>
   </div>

</body>
</html>

 <!-- SmartEditor2 -->
<!-- <script type="text/javascript" src = "resources/se2/js/notice-write.js"></script>  -->

