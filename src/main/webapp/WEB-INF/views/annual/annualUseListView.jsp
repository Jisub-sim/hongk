<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
 <style>
  table.type1 {
        border-collapse: collapse;
        text-align: center;
        line-height: 1.5;
        width: 900px;
        margin-left:100px;

    }

    table.type1 thead th {
        padding: 10px;
        font-weight: bold;
        vertical-align: top;
        color: #369;
        /* border-bottom: 3px solid #036; */
        border-width: 3px solid #036;
        width: 400px;



    }

    table.type1 tbody th {
        width: 150px;
        padding: 10px;
        font-weight: bold;
        vertical-align: center;
        border-bottom: 1px solid #ccc;
        background: #f3f6f7;
        border-top: 3px solid #036;
        text-align: center;
    }

    table.type1 td {
        width: 350px;
        padding: 10px;
        vertical-align: center;
        border-bottom: 1px solid #ccc;
         text-align: center;
    }

    .ann-bt {
        background-color: #369;
        border: 1px solid white;
        border-radius: 10px;
        color: white;
        width: 70px;
        height: 30px;
        margin-left: 50px;


    }
    
    .annualmain {
            border: 3px solid rgba(128, 128, 128, 0.363);
            width: 1000px;
            height: 280px;
            border-radius: 20px;
            margin-top: 10px;
            margin-left: 50px;
        }
        
      .annualAll {
            border-radius: 20px;
            border: 3px solid #59d4d4e0;
            width: 200px;
            height: 120px;
            margin-left: 100px;
            margin-bottom: 20px;
            margin-top:-30px;
            text-align: center;
            vertical-align: middle;
            float: left;

        }  
        
               /* ����¡ó�� */
       .paging {
        text-align: center;
    }
    .paging a {
        /*
        display: inline-block �ζ��� ����� Ư¡�� ��� ����� Ư¡�� ��� ���´�
        ũ�⸦ ���� �� ������ �ؽ�Ʈ ���ĵ� ����޴´�
        */
        display: inline-block;
        
        font-weight: bold;
        text-decoration: none;
        padding: 5px 8px;
        border: 1px solid #ccc;
        color: #000;
       
    }
    
    .paging a:hover,
     .paging a:focus {
            color: #fff;
            border: 1px solid #59d4d4e0;
            background-color: #59d4d4e0;
        }


  * {
        box-sizing: border-box;
    }

    </style>

<body>
<jsp:include page="../common/include.jsp" />
<div id="main">
<section class="annualmain">

        <h2 style="text-align: center; vertical-align: middle;">&nbsp;&nbsp;&nbsp;������볻��</h2>
        <br>
        <br>
        <div class="annualAll">
            <h2>��ü</h2>
           ${ann.annual_day_count } ��
        </div>
       
        <div class="annualAll">
            <h2>�ܿ�����</h2>
          ${ann.annual_day_remain } ��
        </div>
        <div class="annualAll">
            <h2>��뿬��</h2>
           <c:set var="ann_use" value="${ann.annual_day_count-ann.annual_day_remain}"/>
            	${ ann_use }��
        </div>


    </section>
    <br><br>
<table class="type1">
        <thead>
            <tr>
                <th scope="cols"></th>
                <th scope="cols"></th>

            </tr>
        </thead>
        <tbody>
            <tr>

                <th scope="row">�ް�����</th>
                <th scope="row">������</th>
                <th scope="row">������</th>
                <th scope="row">����û��</th>
                <th scope="row">����</th>
                <th scope="row">��û��¥</th>
                <th scope="row">�ڼ�������</th>
                

            </tr>
          
			<c:forEach var="ann" items="${ list }">
			  <tr>
			<c:set var="ann_type" value="${ann.annual_type}"/>
                <td> 
                 <c:if test="${ann_type eq '0'}">�����ް�</c:if>
                 <c:if test="${ann_type eq '1'}">����</c:if>
                 <c:if test="${ann_type eq '2'}">����</c:if>
                 <c:if test="${ann_type eq '3'}">����</c:if>
                 <c:if test="${ann_type eq '4'}">����</c:if>
                 </td>
                 <td>
                <fmt:formatDate var="annual_start" type="date" value="${ ann.annual_start }" pattern="yyyy-MM-dd"/>
                    ${annual_start }</td>
               <td><fmt:formatDate var="annual_end" type="date" value="${ ann.annual_end }" pattern="yyyy-MM-dd"/>
                    ${ annual_end }</td>
                <td>${ann.annual_day_use }��</td>
               <%--  <td>${ann.annual_content }</td> --%>
                <td>${ann.annual_title }</td>
                <td>${ann.annual_signupday }</td>
                <c:url var="annupView" value="annupView.do">
                	<c:param name="annual_no" value="${ ann.annual_no }"/>
					<c:param name="page" value="${ pi.currentPage }"/>
				</c:url>
                <td><a href="${ annupView }">Ŭ��</a></td>
            </tr>
 </c:forEach>
        </tbody>
    </table>
    <br><br>
    
    <div class="paging">
    	<c:if test="${ pi.currentPage <= 1 }">
    	&laquo;
    	</c:if>
    	<c:if test="${pi.currentPage > 1 }">
    		<c:url var="before" value="annUseList.do">
    			<c:param name="page" value="${pi.currentPage - 1 }"/>
    		</c:url>
    		<a href="${ before }">&laquo;</a>
    	</c:if>
    	<!-- ������ ���� -->
    	<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
    		<c:if test="${ p eq pi.currentPage }">
    		${ p }
    		</c:if>
    		<c:if test="${ p ne pi.currentPage }">
    			<c:url var="pagination" value="annUseList.do">
    				<c:param name="page" value="${ p }"/>
    			</c:url>
    			<a href="${ pagination }">${ p }</a>
    		</c:if>
    	</c:forEach>
    	<!-- ���� -->
    	<c:if test="${ pi.currentPage >= pi.maxPage }">
    		&raquo;
    	</c:if>
    	<c:if test="${pi. currentPage < pi.maxPage }">
    		<c:url var="after" value="annUseList.do">
    			<c:param name="page" value="${pi.currentPage + 1 }"/>
    		</c:url>
    		<a href="${ after }">&raquo;</a>
    	</c:if>
    </div>
   

</div>

</body>
</html>