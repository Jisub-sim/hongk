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
    .wk-bt {
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

	<form action="wkList.do" method="post" enctype="multipart/form-data">
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
                <th scope="row">�ٹ�Ÿ��</th>
                <td>
                    <c:if test="${work.work_type eq '1'  }">�ܱ�</c:if>
                    <c:if test="${work.work_type eq '2' }">����</c:if>
                </td>
            </tr>
           <%--  </c:forEach> --%>
            <tr>
                <th scope="row">��û��¥</th>
                <td>
                  <fmt:formatDate var="work_date" type="date" value="${ work.work_date }" pattern="yyyy-MM-dd"/>
                   ${work_date } 
                   
                </td>
            </tr>
            <tr>
                <th scope="row">��û�ð�</th>
                <td>
                <fmt:formatDate var="start_time" type="date" value="${ work.start_time }" pattern="HH:mm"/>
                <fmt:formatDate var="end_time" type="date" value="${ work.end_time }" pattern="HH:mm"/>
                   ${ start_time } - ${end_time }
                    
                </td>
            </tr>
           <tr>
                <th scope="row">��û����</th>
                <td><textarea name="work_content" style="width:300px; height:200px;">${work.work_content}</textarea>
                <input type="hidden" value="${ work.work_no }" name="work_no">
                </td>
            </tr>
        </tbody>
    </table>
   
    <br><br>
    <c:url var="wkList" value="wkList.do">
					<c:param name="page" value="${ currentPage }"/>
				</c:url>
					<button class="wk-bt" onclick="location.href='${ wkList }'">���</button>
    
    <%-- 
				<c:url var="anndelete" value="anndelete.do">
					<c:param name="annual_no" value="${ ann.annual_no }"/>
				</c:url>
				<c:url var="annList" value="annList.do">
					<c:param name="page" value="${ currentPage }"/>
				</c:url>
					<button class="ann-bt" onclick="location.href='${ annList }'">���</button>
					<button type="submit" class="ann-bt" >�����ϱ�</button> 
					<button class="ann-bt" onclick="location.href='${ anndelete }'">�����ϱ�</button>  --%>
				
</form>
</body>
</html>