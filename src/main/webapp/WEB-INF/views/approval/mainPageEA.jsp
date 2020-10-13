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
                    <td> 건</td>
                </tr>
                <tr>
                    <th>결재 완료문서</th>
                    <td> 건</td>
                </tr>
                <tr>
                    <th>반려 문서</th>
                    <td> 건</td>
                </tr>
            </table>
        </div>
        <!-- 개인문서함 div-->
        <div style="width: 64%; display: inline-block;">
            <p class="ea_subtitle" style="width: 100%;">* 개인 문서함 </p>
            <table class="ea_mainP_t1">
                <tr>
                    <th width="28%;">상신 문서</th>
                    <td width="20%;"> 건</td>
                    <th width="28%;">결재완료 문서</th>
                    <td width="20%;"> 건</td>
                </tr>
                <tr>
                    <th width="28%;">임시 보관</th>
                    <td  width="20%;"> 건</td>
                    <th width="28%;">반려 문서</th>
                    <td  width="20%;"> 건</td>
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
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

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
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

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