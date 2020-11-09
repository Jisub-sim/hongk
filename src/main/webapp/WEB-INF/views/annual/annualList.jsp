<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
        text-align: left;
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
        vertical-align: top;
        border-bottom: 1px solid #ccc;
        background: #f3f6f7;
        border-top: 3px solid #036;
        text-align: center;
    }

    table.type1 td {
        width: 350px;
        padding: 10px;
        vertical-align: top;
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
            border: 3px solid #369;
            width: 200px;
            height: 120px;
            margin-left: 100px;
            margin-bottom: 20px;
            text-align: center;
            vertical-align: middle;
            float: left;

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
        
    </style>

<body>
<jsp:include page="../common/include.jsp" />
<div id="main">
<section class="annualmain">

        <h2 style="text-align: center; vertical-align: middle;">&nbsp;&nbsp;&nbsp;연차신청내역</h2>
        <br>
        <div class="annualAll">
            <h2>전체</h2>
           ${ann.annual_day_count } 건
        </div>
        <div class="annualAll">
            <h2>잔여연차</h2>
          ${ann.annual_day_remain } 건
        </div>
        <div class="annualAll">
            <h2>사용연차</h2>
            <c:set var="ann_use" value="${ann.annual_day_count-ann.annual_day_remain}"/>
            	${ ann_use }건
        </div>


    </section>
    <br><br>
    <!-- <h2 style="margin-left:70px;">신청내역</h2> -->
<table class="type1">
        <thead>
            <tr>
                <th scope="cols"></th>
                <th scope="cols"></th>

            </tr>
        </thead>
        <tbody>
            <tr>

                <th scope="row">휴가구분</th>
                <th scope="row">시작일</th>
                <th scope="row">종료일</th>
                 <th scope="row">사용일</th>
                <th scope="row">제목</th>
                <th scope="row">신청날짜</th>
                <th scope="row">자세히보기</th>

            </tr>
          
			<c:forEach var="ann" items="${ list }">
			  <tr>
			<c:set var="ann_type" value="${ann.annual_type}"/>
                <td> 
                 <c:if test="${ann_type eq '0'}">연차휴가</c:if>
                 <c:if test="${ann_type eq '1'}">병가</c:if>
                 <c:if test="${ann_type eq '2'}">경조</c:if>
                 <c:if test="${ann_type eq '3'}">월차</c:if>
                 <c:if test="${ann_type eq '4'}">반차</c:if>
                 </td>
                 <td>
                <fmt:formatDate var="annual_start" type="date" value="${ ann.annual_start }" pattern="yyyy-MM-dd"/>
                    ${annual_start }</td>
               <td><fmt:formatDate var="annual_end" type="date" value="${ ann.annual_end }" pattern="yyyy-MM-dd"/>
                    ${ annual_end }</td>
               <%--  <td>${ann.annual_content }</td> --%>
                <td>${ann.annual_day_use }</td>
                <td>${ann.annual_title }</td>
                <td>${ann.annual_signupday }</td>
                <c:url var="annupView" value="annupView.do">
                	<c:param name="annual_no" value="${ ann.annual_no }"/>
					<c:param name="page" value="${ pi.currentPage }"/>
				</c:url>
                <td><a href="${ annupView }">클릭</a></td>
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
    		<c:url var="before" value="annList.do">
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
    			<c:url var="pagination" value="annList.do">
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
    		<c:url var="after" value="annList.do">
    			<c:param name="page" value="${pi.currentPage + 1 }"/>
    		</c:url>
    		<a href="${ after }">&raquo;</a>
    	</c:if>
    </div>
   
 <%-- <h2>내 연차 내역</h2>

    <table class="type1">
        <thead>
            <tr>
                <th scope="cols">사원명</th>
                <th scope="cols">사원 번호</th>
                <th scope="cols">직급</th>
                <th scope="cols">사용 연차</th>
                <th scope="cols">남은 연차</th>
                <th scope="cols" style="width: 3.5em;">총 연차</th>
            </tr>
        </thead>
        <tbody>
            <tr>
            <c:if test="${ !empty sessionScope.loginUser }">
                <td>${ loginUser.mName }</td>
                <td>${loginUser.jobCode }</td>
                <td>${loginUser.deptCode }</td>
                <td>1</td>
                <td>19</td>
                <td>20</td>
            </tr>
			</c:if>
        </tbody>
    </table>

    <br><br>

    <h2>사용 내역</h2>
    <table class="type1">
        <thead>
            <tr>
                <th scope="cols">이름</th>
                <th scope="cols" style="width:241px;">연차 사용 시작 날짜</th>
                <th scope="cols" style="width:241px;" >연차 사용 끝난 날짜</th>
                <th scope=" cols">사용 연차</th>
                <th scope="cols">사용 내용</th>

            </tr>
        </thead>
        <tbody>
        
            <tr>
                <td>김몰라</td>
                <td>2020.08.09</td>
                <td>2020.08.11</td>
                <td>3</td>
                <td>여름휴가사용</td>
            </tr>

        </tbody>
    </table>

    <h2>휴가신청내역</h2>
    <table class="type1">
        <thead>
            <tr>
                <th scope="cols">사원명</th>
                <th scope="cols">신청날짜</th>
                <th scope="cols">휴가구분</th>
                <th scope="cols">신청일수</th>
                <th scope="cols">전자결재상태</th>
                <th scope="cols" style="width:150px">신청내역</th>

            </tr>
        </thead>
        <tbody>
            <tr>
                <td>김몰라</td>
                <td>2020.08.09</td>
                <td>연차</td>
                <td>2</td>
                <td>진행중</td>
                <td><a href="annListDatail.do"
                 onclick="window.open(this.href, '_blank','width=500,height=500,toolbars=no,scrollbars=no'); return false;">자세히보기</a></td>
            </tr>

        </tbody>
        <button type="submit" class="ann-bt">추가</button>
    <button type="submit" class="ann-bt">목록</button>
        
    </table> --%>
</div>

</body>
</html>