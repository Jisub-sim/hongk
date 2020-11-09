<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<!-- 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
   <!--  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->


<style>
 .workmain {
            border: 3px solid rgba(128, 128, 128, 0.363);
            width: 1000px;
            height: 200px;
            border-radius: 20px;
            margin-top: 10px;
            margin-left: 50px;
        }

        #allwork {
            border-radius: 20px;
            border: 3px solid #59d4d4e0;
            width: 200px;
            height: 100px;
            margin-left: 55px;
            margin-bottom: 20px;
            text-align: center;
            vertical-align: middle;
            float: left;

        }

        #getwork {
            border-radius: 20px;
            border: 3px solid #59d4d4e0;
            width: 200px;
            height: 100px;
            margin-left: 20px;
            text-align: center;
            vertical-align: middle;
            float: left;
        }

        #tardy {
            border-radius: 20px;
            border: 3px solid #59d4d4e0;
            width: 200px;
            height: 100px;
            margin-left: 20px;
            text-align: center;
            vertical-align: middle;
            float: left;
        }

        #untreated {
            border-radius: 20px;
            border: 3px solid #59d4d4e0;
            width: 200px;
            height: 100px;
            margin-left: 20px;
            text-align: center;
            vertical-align: middle;
            float: left;
        }

        body {
            /* font-family: 'Lato', sans-serif; */
            color: #333;
            font-weight: 400;
            font-size: 16px;
        }

        table {
            max-width: 960px;
            margin: auto;
        }

        caption {
            font-size: 18px;
            font-weight: 400;
            padding: 12px 0;
        }

        thead th {
            background: #2e738e;
            color: #fff;
            font-weight: initial;
        }

        tr {
            background: #f1f1f1;
        }



        th,
        td {
            text-align: center;
            padding: 3px;
        }

        tfoot tr {
            background: none;
        }

        tfoot td {
            padding: 12px 2px;
            font-style: italic;
            color: #8a97a0;
        }


        /* .working td {
            border: 1px solid red;
        } */



        /* 셀렉트 박스 스타일 */
        body {
            margin: 10px;
            font-size: 14px;
        }

        .where {
            display: block;
            margin: 25px 15px;
            font-size: 11px;
            color: #000;
            text-decoration: none;
            /* font-family: verdana; */
            font-style: italic;
        }

        select {
            width: 200px;
            padding: .8em .5em;
           /*  font-family: inherit; */
            border: 1px solid #999;
            border-radius: 0px;
            margin-left: 100px;
            margin-top: 20px;
        }

        select::-ms-expand {
            /* for IE 11 */
            display: none;
        }

        table {
           /*  font-family: 'Sunflower', sans-serif; */


        }

       


        #normalcy {
            border: 1px solid #59d4d4e0;
            border-radius: 20px;
            background-color: #59d4d4e0;
        }

        #untreated_st {
            border: 1px solid #e4baba;
            border-radius: 20px;
            background-color: #e4baba;

        }
        
         /* 페이징처리 */
       .paging {
        text-align: center;
    }
    .paging a {
        /*
        display: inline-block 인라인 요소의 특징과 블록 요소의 특징을 모두 갖는다
        크기를 가질 수 있으며 텍스트 정렬도 적용받는다
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

  
    .date {
        position: relative;
        width: 300px;
        margin: 0 auto;
        float: left;
        margin-top: 30px;
    }

   

    .date input {
        width: 100%;
        height: 42px;
        padding-left: 10px;
        border: 2px solid #7BA7AB;
        border-radius: 5px;
        outline: none;
        background: #F9F0DA;
        color: #9E9C9C;
    }

    .date button {
        position: absolute;
        top: 0;
        right: 0px;
        width: 42px;
        height: 42px;
        border: none;
        background: #7BA7AB;
        border-radius: 0 5px 5px 0;
        cursor: pointer;
    }

    .date button:before {
        content: "\f002";
        font-family: FontAwesome;
        font-size: 16px;
        color: #F9F0DA;
    }
    
         h2{
    text-align: center;
     vertical-align: middle;
     margin-top : 20px;
    }

</style>
</head>
<body>

   <jsp:include page="../common/include.jsp" />
   <div id="main">

   
      <br>
      
      <h2>근무신청리스트</h2>
      <br><br><br>

    <table>
        <thead>


            <tr>
            	<td style="width: 50px; background-color: #59d4d4e0;">글번호</td>
                <td style="width: 200px; height:50px; background-color: #59d4d4e0;">제목</td>
                <td style="width: 100px; height:50px;background-color: #59d4d4e0;">근무타입</td>
                <td style="width: 200px;background-color: #59d4d4e0;">신청날짜</td>
                <td style="width: 200px;background-color: #59d4d4e0;">시작시간</td>
                <td style="width: 200px;background-color: #59d4d4e0;">종료시간</td>
                <td style="width: 100px;background-color: #59d4d4e0;">승인</td>
            </tr>
        </thead>
        <tbody>
        	
        	<c:forEach var="wk" items="${ list }">
            <tr>
            	<td>${wk.work_no }
                <td>${wk.work_title } </td>
                
                <c:set var="wk_type" value="${wk.work_type}"/>
                <td>
                <c:if test="${wk_type eq '1' }">외근</c:if>
                <c:if test="${wk_type eq '2' }">조퇴</c:if>
                 </td>
                
                <td>
                <fmt:formatDate var="work_date" type="date" value="${wk.work_date }" pattern="yyyy-MM-dd"/>
                ${work_date }</td>
                
               <td> <fmt:formatDate var="start_time" type="time" value="${wk.start_time }" pattern="HH:mm"/>
                ${ start_time }</td>
                
                <td><fmt:formatDate var="end_time" type="time" value="${wk.end_time }" pattern="HH:mm"/>
                ${ end_time }</td>
                <c:url var="wkupView" value="wkupView.do">
                	<c:param name="work_no" value="${ wk.work_no }"/>
					<c:param name="page" value="${ pi.currentPage }"/>
				</c:url>
				<c:url var="wkdatail" value="wkdatail.do">
                	<c:param name="work_no" value="${ wk.work_no }"/>
                	<c:param name="page" value="${ pi.currentPage }"/> 
				</c:url>
				<c:set var="wk_status" value="${wk.wk_status}"/>
				
				<td>
				 <c:if test="${wk_status eq 'W'}"><a href="${ wkupView }">진행중</a></c:if>
                <c:if test="${wk_status eq 'Y'}"><a href="${ wkdatail }">승인완료</a></c:if>
                </td>
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
    		<c:url var="before" value="wkList.do">
    			<c:param name="page" value="${pi.currentPage - 1 }"/>
    		</c:url>
    		<a href="${ before }">&laquo;</a>
    	</c:if>
    	<!-- 페이지 숫자 -->
    	<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
    		<c:if test="${ p eq pi.currentPage }">
    		${ p }
    		</c:if>
    		<c:if test="${ p ne pi.currentPage }">
    			<c:url var="pagination" value="wkList.do">
    				<c:param name="page" value="${ p }"/>
    			</c:url>
    			<a href="${ pagination }">${ p }</a>
    		</c:if>
    	</c:forEach>
    	<!-- 다음 -->
    	<c:if test="${ pi.currentPage >= pi.maxPage }">
    		&raquo;
    	</c:if>
    	<c:if test="${pi. currentPage < pi.maxPage }">
    		<c:url var="after" value="wkList.do">
    			<c:param name="page" value="${pi.currentPage + 1 }"/>
    		</c:url>
    		<a href="${ after }">&raquo;</a>
    	</c:if>
    </div>


  </div>

</body>
</html>