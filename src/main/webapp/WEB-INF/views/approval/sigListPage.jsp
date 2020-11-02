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
<style>
#ea_bt_div{
           width: 90%;
           margin: auto;
       }
        #sig_div1{
            border: solid rgba(89, 118, 223, 0.184) 1px;
            width: 85%;
            margin: auto;
        }

        #select_sig_table{
            border: solid rgba(89, 118, 223, 0.184) 1px;
            width: 85%;
            margin: auto;
            height: 60px;
            padding: 0;
        }
        
        #select_sig_table td{
            font-size: 15px;
            height: 60px;
          
        }

        #select_sig_table td:first-child{
            background: rgba(183, 209, 241, 0.313);
            text-align: center;
            vertical-align: middle;
        }
        

        #sig_table td{
            height: 50px;
        }
       
        #uploadBt{
            float: right;
        }
        
        .sig_img{
            width: 60px;
            height: 60px;
        }
</style>
</head>
<body>
   <jsp:include page="../common/include.jsp" />

   <div id="main">
      <br>
   <br>
    <div id="sig_div1">
        <ul>
            <li>이미지 권장 크기는 가로*세로=60*60픽셀, 용량 100kbyte 입니다.</li>
            <li>확장자는 jpg, gif, png 이미지를 등록 하셔야 합니다.</li>
            <li>이미지명은 영문, 숫자사용을 권장합니다.</li>
         </ul>
    </div>
    <br>
        <table id="select_sig_table">
            <tr>
            <td width="20%">서명이미지</td>
             <c:forEach var="list" items="${ list }">
              <c:set var="Status" value="${ list.sig_status }"/>
              	<c:if test="${Status eq 'Y' }" >	
            <td width="60%"><img src="${pageContext.request.contextPath}/resources/SigFileUpload/${ list.reName_FileName }" class="sig_img"></td>
            	</c:if>
            </c:forEach>
            </tr>
        </table>

    <br>

	<c:url var="siginsertPage" value="siginsertPage.do"/>
	<br>
	<form  id="sigForm" action="" method="post" enctype="multipart/form-data">
    <div id="ea_bt_div">
    	<div id="sig_upload_div" style=" width:40%;display:inline-block; margin-left:60%;" >
    		<input type="file" id="imagefileupload" name="uploadFile" required style="border:1px solid gray;">
    		<button class="ea_bt" onclick="SiguploadCancelFc();">취소</button>
    		&nbsp;<button type="submit" class="ea_bt" id="sigInsertBt">등록</button>
    	</div>
    	 <button class="ea_bt" id="uploadBt" type="button" 
    		onclick="siguploadFc();"> 업로드 </button>
   </div>
   </form>
 
  
<%--   window.open('${siginsertPage}','window_name','width=700,height=300,location=no,status=no,scrollbars=yes'); --%>
  
    <br><br>
    <table class="ea_table" id="sig_table">
    
        <thead>
            <th width="10%">NO</th>
            <th width="35%">서명이미지</th>
            <th width="25%">등록일</th>
            <th width="10%">기본사용</th>
            <th width="10%"></th>
             <th width="10%"></th>
        </thead>
        <c:forEach var="list" items="${ list }">
        <c:set var="Status" value="${ list.sig_status }"/>
        <tr>
            <td>${ list.sig_no }</td>
            <td><img src="${pageContext.request.contextPath}/resources/SigFileUpload/${ list.reName_FileName }" class="sig_img"></td>
            <td>
            <fmt:formatDate var="save_Date" type="date" value="${ list.save_Date }" pattern="yyyy-MM-dd"/>
							${save_Date }
			</td>
			<c:if test="${Status eq 'Y' }" >				
            <td>사용중</td>
            <td></td>
                <c:url var="delSig" value="delSig.do">
					<c:param name="sig_no" value="${ list.sig_no}"/>
				</c:url>
              <td>
              	<button class="ea_bt" onclick="location.href='${delSig}'">삭제</button>
              </td>
            </c:if>
            <c:if test="${Status ne 'Y' }" >				
            <td></td>
		            <c:url var="useSig" value="useSig.do">
							<c:param name="sig_no" value="${ list.sig_no}"/>
					</c:url>
             <td>
             	<button class="ea_bt" onclick="location.href='${useSig}'">사용</button>
             </td>
		             <c:url var="delSig" value="delSig.do">
						<c:param name="sig_no" value="${ list.sig_no}"/>
					</c:url>
              <td>
              	<button class="ea_bt" onclick="location.href='${delSig}'">삭제</button>
              </td>
            </c:if>
        </tr>
        </c:forEach>
    </table>
    <script>
    	$("#sig_upload_div").hide();
    
        $(function(){
            $(".ea_table td").mouseenter(function(){
                $(this).parent().css({"background":"lightgray", "font-weight":"bold"});
            }).mouseleave(function(){
                $(this).parent().css({"background":"white", "font-weight":"normal"});
            });
        });
        
      // 업로드
      function siguploadFc(){
    	  $("#sig_upload_div").show();
    	  $("#uploadBt").hide();
      }
      // 취소
      function SiguploadCancelFc(){
    	  $("#sig_upload_div").hide();
    	  $("#uploadBt").show();
      }

      // 등록
  	$(function() { 
		$("#sigInsertBt").click(function() { 
			document.getElementById("sigForm").setAttribute('action','siginsert.do' );
		}); 
	})
    </script>
   
   </div>

</body>
</html>