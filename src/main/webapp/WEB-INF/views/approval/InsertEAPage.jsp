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
        font-size: 25px;
        font-weight: 500;
    }

     #ea_create_table{
         border-color:  rgba(183, 209, 241, 0.313);
         width: 80%;
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
    .ea_line:hover{
        cursor: pointer;
        outline: 1px solid gray;
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
	<c:url var="approverList" value="approverList.do"/>
	<c:url var="referrerList" value="referrerList.do"/>
	<form id="insertEAForm" action=""  method="post" enctype="multipart/form-data">
		<br>
		   <p id="form_title">${form.form_name }</p>
    <br><Br>
    <table class="ea_table" border="1" id="ea_create_table" >
    <tr>
        <td width="15%">기안자</td>
        <td width="35%">${ member.mName }</td>
        <td width="15%">서식 번호</td>
        <td width="35%">${form.form_no}</td>
        <input type="hidden" name="form_no" value="${ form.form_no }">
        <input type="hidden" name="ea_type" value="${ form.form_type }">
   		<input type="hidden" name="drafter" value="${ loginUser.mNo }">
   		<input type="hidden" name="app" id="app" >
   		<input type="hidden" name="ref" id="ref" >

    </tr>
    <tr>
        <td>결재자</td>
        <td><input type="text" class="ea_line" id="approverbt" name="approverbt" required></td>
        <td>기안부서</td>
        <td>${ member.deptTitle }</td>
    </tr>
    <tr>
        <td>참조자</td>
        <td><input type="text" class="ea_line" id="referrerBt"></td>
        <td>구분</td>
        <td><label name="ea_type" value=" ${form.form_category}">${form.form_category}</label></td>
    </tr>
    <tr>
        <td>제목</td>
        <td colspan="3"><input type="text" name="ea_title" required ></td>
        
    </tr>
    <tr></tr>
    <tr>
        <td colspan="4" style="background: white">
            <div>
               <textarea name="smartEditor" id="smartEditor" rows="10" cols="100">${ form.form_content }</textarea>
			</div>

        </td>
    </tr>
    <tr></tr>
    <tr><td colspan="4" style="text-align: left;"> &nbsp; 파일 업로드 </td></tr>
    <tr><td colspan="4" style=" background: white"><input type="file" id="fileupload" name="uploadFile"></td></tr>
    </table>
    <br>
    
    <div id="ea_control_bt_div">
        <button type="submit" class="ea_bt" id="savebutton">저장/결재</button> 
        <button type="submit" class="ea_bt" id="tembutton">임시저장</button>
        <button type="button" class="ea_bt" onclick="history.go(-1)">취소</button>
    </div>
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
				document.getElementById("smartEditor").setAttribute('name','ea_content' );
				document.getElementById("insertEAForm").setAttribute('action','insertea.do' );

				var result = confirm("등록 하시겠습니까?"); 
				if(result){ 
					
				}else{ 
					return; 
				} 
			}); 
		})
		
		$(function() { 
			$("#tembutton").click(function() { 
				oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []); 
				var content = document.getElementById("smartEditor").value;
				document.getElementById("smartEditor").setAttribute('name','ea_content' );
				document.getElementById("insertEAForm").setAttribute('action','temeaform.do' );
			}); 
		})

        </script>
    <br>
    <br> <br>
    </form>
	</div>
	<script>
            $(function(){
                $(".ea_table td").mouseenter(function(){
                    $(this).parent().css({"cursor":"pointer"});
                    $(this).parent().css({"background":"lightgray", "font-weight":"bold"});
                }).mouseleave(function(){
                    $(this).parent().css({"background":"white", "font-weight":"normal"});
                });
            });
            
            //결재자 등록 클릭시
            $(function(){
            	$("#approverbt").click(function(){
						window.open('${approverList}','window_name','width=1000,height=700,left=130,top=250,location=no,status=no,scrollbars=yes');
            	});
            });
            // 참조자 선택
            $(function(){
            	$("#referrerBt").click(function(){
						window.open('${referrerList}','window_name','width=1000,height=700,left=130,top=250,location=no,status=no,scrollbars=yes');
            	});
            });
            

        </script>
</body>
</html>