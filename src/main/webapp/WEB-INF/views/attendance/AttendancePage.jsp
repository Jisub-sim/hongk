<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Page Title</title>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"
   integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
   crossorigin="anonymous"></script> -->
<%-- <link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/approvalcss.css"> --%>
<!-- 폰트 -->
    <!-- <link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet"> -->
    <!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->

<!--     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

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
            font-family: 'Lato', sans-serif;
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
            font-family: verdana;
            font-style: italic;
        }

        select {
            width: 200px;
            padding: .8em .5em;
            font-family: inherit;
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
            /* font-family: 'Sunflower', sans-serif; */


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
    
    .ui-datepicker table{
    display: none;
}

	#searchCondition{
	margin-left : 350px;
	}
    

</style>
</head>
<body>

   <jsp:include page="../common/include.jsp" />
   
   <!-- 달력jquery -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
   
   <div id="main">

   
      <br>
   <section class="workmain">
<br>
        <h1 style=" display:inline;">&nbsp;&nbsp;&nbsp;출퇴근 Summary</h1>&nbsp;&nbsp;&nbsp;<p style=" display:inline;">*지각한 날은 정상근로일에 포함되지 않음</p>
        <br>
        <br>
        <div id="allwork">
            <h2>전체</h2>
            ${ ac.listCount}건
        </div>
        <div id="getwork">
            <h2>정상근로일</h2>
            ${ ac.workCount }건
        </div>
        <div id="tardy">
            <h2>지각</h2>
            ${ ac.overtimeCount }건
        </div>
        <div id="untreated">
            <h2>미처리</h2>
            	${ wkoff }건
        </div>


    </section>
 <form action="wksearch.do" name="searchCondition" >
    <select id="searchCondition" name="searchCondition" style="font-family: 'Sunflower', sans-serif;">
        <option selected>----</option>
        <option value="3"
		<c:if test="${search.searchCondition == '3'}">selected
		</c:if>>출근</option>
        <option value="2"
		<c:if test="${search.searchCondition == '2'}">selected
		</c:if>>지각</option>
        <option value="10"
		<c:if test="${search.searchCondition == '10'}">selected
        </c:if>>전체</option>
    </select>
   &nbsp;&nbsp; <input type="date" id="monthDate" name="SearchValue" > &nbsp; 
        <button type="submit">검색</button>
	</form>  
    <br><br>
  <!-- 
    <div class="date">

        <input type="date" id="datecalnder">
        <button type="submit">검색</button>

    </div> -->
      

    <table>
        <thead>


            <tr>
                <td>출근 체크 구분</td>
                <td>퇴근 체크 구분</td>
                <td style="width: 300px;">출근시간</td>
                <td style="width: 300px;">퇴근시간</td>
                <td style="width: 100px;">근태</td>
                <td>처리상태</td>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="att" items="${ list }">
            <tr>
                <td><c:if test="${att.attendance_type eq '2' || att.work_on != null}">
                	출근
                </c:if>
                
                </td>
                
                 <td><c:if test="${att.attendance_type eq '3' || att.work_off != null}">
                	퇴근
                </c:if>
                <c:if test="${att.attendance_type eq '2' && att.work_off == null }">
                	미퇴근
                </c:if>
                
                 <%--  <c:if test="${att.work_off != null}"> 
                	퇴근
                </c:if> --%> 
                </td>
                
                
                
                <td>
                <fmt:formatDate var="work_on" type="date" value="${att.work_on }" pattern="yyyy-MM-dd-HH:mm"/>
                    ${work_on }</td>
                <td><fmt:formatDate var="work_off" type="date" value="${att.work_off }" pattern="yyyy-MM-dd-HH:mm"/>
                    ${work_off }</td></td>
                <td>
                <c:if test="${att.attendance_type eq '2' }">
                	지각
                </c:if>
                </td>
                <td>
                    <c:if test="${att.work_off == null}"> 
                    <a id="untreated_st">미처리 </a></c:if>
                    <c:if test="${att.work_off != null}">
                    <p id="normalcy">정상처리</p> 
                    </c:if>
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
    		<c:url var="before" value="attlist.do">
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
    			<c:url var="pagination" value="attlist.do">
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
    		<c:url var="after" value="attlist.do">
    			<c:param name="page" value="${pi.currentPage + 1 }"/>
    		</c:url>
    		<a href="${ after }">&raquo;</a>
    	</c:if>
    </div>

   
  </div>
  
<!--  <script type="text/javascript"> 
//  $.datepicker.setDefaults({
//      dateFormat: 'yy-mm-dd',
//      prevText: '이전 달',
//      nextText: '다음 달',
//      monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
//      monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
//      dayNames: ['일', '월', '화', '수', '목', '금', '토'],
//      dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
//      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
//      showMonthAfterYear: true,
//      yearSuffix: '년'
//  });
//  $(function () {
    
//      $("#monthDate").datepicker({
//          dateFormat: 'yy-MM', changeMonth: true,
//          changeYear: true, showButtonPanel: true,
//          onClose: function (dateText, inst) {
//              var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
//              var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val(); $(this).datepicker('setDate',
//                  new Date(year, month, 1)); $(".ui-datepicker-calendar").css("display", "none");
//          }
//      });

//      $("#monthDate").focus(function () {
//          $(".ui-datepicker-calendar").css("display", "none"); $("#ui-datepicker-div").position({ my: "center top", at: "center bottom", of: $(this) });
//      });
//  });


 </script> -->
</body>
</html>