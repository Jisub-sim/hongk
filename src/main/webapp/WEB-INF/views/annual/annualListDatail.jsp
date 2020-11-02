<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
<title>Insert title here</title>
</head>
<style>
 table.type09 {
        border-collapse: collapse;
        text-align: left;
        line-height: 1.5;

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
        margin-left: 70px;


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
                <th scope="row">�ް�����</th>
                <td>
                    <p>����</p>
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
                	<c:if test="${annual_halftime eq 'am'}">��������</c:if>
                	<c:if test="${annual_halftime eq 'pm'}">���Ĺ���</c:if>
                	</p>
                </c:if>
                <c:if test="${ann.annual_halftime == none }">
               			 ����
                </c:if>
                </td>
            </tr>
            <tr>
                <th scope="row">�ް�����</th>
                <td><textarea name="annual_content" style="width:300px; height:200px";>${ann.annual_content}</textarea>
                <input type="hidden" value="${ ann.annual_no }" name="annual_no">
                </td>
            </tr>
        </tbody>
    </table>
   
    <br><br>
    
    
				<c:url var="anndelete" value="anndelete.do">
					<c:param name="annual_no" value="${ ann.annual_no }"/>
				</c:url>
				<c:url var="annList" value="annList.do">
					<c:param name="page" value="${ currentPage }"/>
				</c:url>
					<button class="ann-bt" onclick="location.href='${ annList }'">���</button>
					<button type="submit" class="ann-bt" >�����ϱ�</button> 
					<button class="ann-bt" onclick="location.href='${ anndelete }'">�����ϱ�</button> 
				
</form>
</body>
</html>