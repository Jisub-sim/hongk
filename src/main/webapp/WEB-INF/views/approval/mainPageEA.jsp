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
    .ea_subtitle {
            width: 90%;
            margin: auto;
            padding: 0.5em;
        }

       .ea_mainP_t1 {
            width: 93%;
            border: 1px solid rgb(118, 123, 132);
            text-align: center;
            height: 110px;
        }

       .ea_mainP_t1 th {
            background: rgba(183, 209, 241, 0.313);
            color: rgb(90, 90, 90);
        }
</style>
</head>
<body>
   <jsp:include page="../common/include.jsp" />

   <div id="main">
   <br>
      <br>
      <br>
    <div style="width: 90%; margin: auto; ">
        <!-- 결재 진행 div-->
        <div style="width:35%; float: left">
            <p class="ea_subtitle" style="width: 100%;">* 결재 진행 </p>
            <table class="ea_mainP_t1">
                <tr>
                    <th width="60%;">미결재 문서</th>
                    <td> ${eaC.countWp }건</td>
                </tr>
                <tr>
                    <th>결재 완료문서</th>
                    <td>${eaC.countCp } 건</td>
                </tr>
                <tr>
                    <th>반려 문서</th>
                    <td> ${eaC.countBp }건</td>
                </tr>
            </table>
        </div>
        <!-- 개인문서함 div-->
        <div style="width: 64%; display: inline-block;">
            <p class="ea_subtitle" style="width: 100%;">* 개인 문서함 </p>
            <table class="ea_mainP_t1">
                <tr>
                    <th width="28%;">상신 문서</th>
                    <td width="20%;"> ${eaC.countR }건</td>
                    <th width="28%;">결재완료 문서</th>
                    <td width="20%;"> ${eaC.countC }건</td>
                </tr>
                <tr>
                    <th width="28%;">임시 보관</th>
                    <td  width="20%;"> ${eaC.countT }건</td>
                    <th width="28%;">반려 문서</th>
                    <td  width="20%;"> ${eaC.countB }건</td>
                </tr>
               
            </table>
        </div>
    </div>
    <br><br>
    <div>
        <p class="ea_subtitle">* 결재 진행 > 미결재 문서 </p>
        <table class="ea_table">
            <thead>
                <th width="5%">NO</th>
                <th width="7%">문서분류</th>
                <th width="36%">문서제목</th>
                <th width="10%">기안자</th>
                <th width="10%">기안일</th>
                <th width="10%">상태</th>
            </thead>
            <c:forEach var ="listWp" items="${ listWp }">
            <c:set var="status1" value="${listWp.ea_status }"/>
            <tr>
                <td>${listWp.ea_no }</td>
                <td>${listWp.ea_type }</td>
                <td>${listWp.ea_title }</td>
                <td>${listWp.mName }</td>
                <td><fmt:formatDate var="draftng_date" type="date" value="${listWp.draftng_date }" pattern="yyyy-MM-dd"/>
					${draftng_date }</td>
			<c:if test="${ status1 eq 'W' } ">
			  <td>진행</td>
			</c:if>	
			<c:if test="${ status1 eq 'C' }">
			  <td>완료</td>
			</c:if>
			<c:if test="${ status1 eq 'B' }">
			  	<td>반려</td>
			</c:if>
			<c:if test="${ status1 eq 'R' }">
			  	<td>회수</td>
			</c:if>	
            </tr>
			</c:forEach>
        </table>

    </div>
    <br><br>
    <div>
        <p class="ea_subtitle">* 수신참조함 </p>
        <table class="ea_table">
            <thead>
                <th width="5%">NO</th>
                <th width="7%">문서분류</th>
                <th width="36%">문서제목</th>
                <th width="10%">기안자</th>
                <th width="10%">기안일</th>
                <th width="10%">상태</th>
            </thead>
              <c:forEach var ="listref" items="${ listref }">
              <c:set var="status2" value="${listref.ea_status }"/>
            <tr>
                <td>${listref.ea_no }</td>
                <td>${listref.ea_type }</td>
                <td>${listref.ea_title }</td>
                <td>${listref.mName }</td>
                <td><fmt:formatDate var="draftng_date" type="date" value="${listref.draftng_date }" pattern="yyyy-MM-dd"/>
					${draftng_date }</td>
                <c:if test="${ status2 eq 'W' }">
			  		<td>진행</td>
				</c:if>	
				<c:if test="${ status2 eq 'C' }">
			  		<td>완료</td>
				</c:if>
				<c:if test="${ status2 eq 'B' }">
			  		<td>반려</td>
				</c:if>
				<c:if test="${ status2 eq 'R' }">
			  		<td>회수</td>
				</c:if>
            </tr>
			</c:forEach>

        </table>

    </div>
    <script>
        $(function () {
            $(".ea_table td").mouseenter(function () {
                $(this).parent().css({ "cursor": "pointer" });
                $(this).parent().css({ "background": "lightgray", "font-weight": "bold" });
            }).mouseleave(function () {
                $(this).parent().css({ "background": "white", "font-weight": "normal" });
            });
        });
    </script>
   </div>

</body>
</html>