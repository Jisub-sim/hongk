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
                <th scope="cols">��û����</th>
                <th scope="cols"></th>
            </tr>
        </thead>
        <tbody>
            <tr>
            <%-- <c:forEach> --%>
     <%--        <td>
            	�۹�ȣ
            </td>
            <td>
            ${ann.annual_no }
            </td> --%>
                <th scope="row">�ް�����</th>
                <c:set var="ann_type" value="${ann.annual_type }"/>
                <td>
                    <c:if test="${ ann_type eq '0'}">���������ް�</c:if>
                    <c:if test="${ ann_type eq '1'}">����</c:if>
                    <c:if test="${ ann_type eq '2'}">����</c:if>
                    <c:if test="${ ann_type eq '3'}">����</c:if>
                    <c:if test="${ ann_type eq '4'}">����</c:if>
                </td>
            </tr>
           <%--  </c:forEach> --%>
            <tr>
                <th scope="row">��û �Ⱓ</th>
                <td>${ ann.annual_start } - ${ ann.annual_end }
                    <p>����ϼ� : ${ann.annual_day_use }</p>
                </td>
            </tr>
            <tr>
                <th scope="row">���� ����</th>
                <td>
                <c:if test="${ann.annual_halftime != null }">
                	<p>
                	<c:if test="${ann.annual_halftime eq 'am'}">��������</c:if>
                	<c:if test="${ann.annual_halftime eq 'pm'}">���Ĺ���</c:if>
                	<c:if test="${ann.annual_halftime eq 'none'}">����</c:if>
                	</p>
                </c:if>
                <p>
               <%--  <c:if test="${ann.annual_halftime == none }">
               			 ����
                </c:if> --%>
                </p>
                </td>
            </tr>
            <tr>
                <th scope="row">�ް�����</th>
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
					<button class="ann-bt" onclick="location.href='${ annList }'">���</button>
					<button type="submit" class="ann-bt" >�����ϱ�</button> 
					<button class="ann-bt" onclick="location.href='${ anndelete }'">�����ϱ�</button> 
				</div>
				</c:if>
				
				
				
				<c:if test="${ann.ann_status eq 'Y'}">
				 <c:url var="annUseList" value="annUseList.do">
					<c:param name="page" value="${ currentPage }"/>
				</c:url>
				
				<div class="annAllbt">
					<button class="ann-bt" onclick="location.href='${ annUseList }'">���</button>
				</div>
				
				</c:if>
</form>

  <script type="text/javascript">
    var oEditors = [];
    nhn.husky.EZCreator.createInIFrame({ 
    	oAppRef : oEditors,
    	elPlaceHolder : "smartEditor", 
    	sSkinURI : "${pageContext.request.contextPath}/resources/se2/SmartEditor2Skin.html", //��θ� �� �����ּ���! 
    	fCreator : "createSEditor2", htParams : { 
    	// ���� ��� ���� (true:���/ false:������� ����) 
    	bUseToolbar : true, 
    	// �Է�â ũ�� ������ ��� ���� (true:���/ false:������� ����) 
    	bUseVerticalResizer : false, 
    	// ��� ��(Editor | HTML | TEXT) ��� ���� (true:���/ false:������� ����) 
    	bUseModeChanger : false
    	} 
    }); 
    
    $(function() { 
		$("#savebutton").click(function() { 
			oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []); 
			var content = document.getElementById("smartEditor").value;
			document.getElementById("smartEditor").setAttribute('name','annual_content' );

			var result = confirm("��� �Ͻðڽ��ϱ�?"); 
			if(result){ 
				
			}else{ 
				return; 
			} 
		}); 
	})
	
	</script>
</body>
</html>