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
<!-- 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


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
            padding: 24px;
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
            font-family: 'Sunflower', sans-serif;


        }

        #date {
            float: left;
            /* margin-left: 10px; */
            margin-top: 30px;
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




</style>
</head>
<body>

   <jsp:include page="../common/include.jsp" />

   <div id="main">
      <br>
   <section class="workmain">

        <h1>&nbsp;&nbsp;&nbsp;출퇴근 Summary</h1>
        <br>
        <div id="allwork">
            <h2>전체</h2>
        </div>
        <div id="getwork">
            <h2>정상근로일</h2>
            <a>17건</a>
        </div>
        <div id="tardy">
            <h2>지각</h2>
            <a>6건</a>
        </div>
        <div id="untreated">
            <h2>미처리</h2>
            <a>2건</a>
        </div>


    </section>

    <select style="font-family: 'Sunflower', sans-serif;">
        <option selected>----</option>
        <option>출근</option>
        <option>퇴근</option>
        <option>미처리</option>
    </select>


    <div id="date">
        <input type="date" id="datecalnder"> &nbsp; - &nbsp;<input type="date" id="datecalnder">


    </div>
    &nbsp;&nbsp;<button type="button" class="btn btn-info btclick">검색</button>
    <br><br>


    <table>
        <thead>


            <tr>
                <td>출퇴근 체크 구분</td>
                <td style="width: 400px;">시각</td>
                <td>출퇴근 체크방법</td>
                <td>근로상태</td>
                <td>
                    처리상태
                </td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>출근</td>
                <td>2020/08/09-AM09:00</td>
                <td>PC 출근</td>
                <td>지각</td>
                <td>
                    <p id="normalcy">정상처리</p>
                </td>

            </tr>
            <tr>
                <td>퇴근</td>
                <td>2020/08/09-PM18:00</td>
                <td>PC 퇴근</td>
                <td></td>
                <td>
                    <p id="untreated_st">미처리</p>
                </td>
            </tr>
            <tr>
                <td>출근</td>
                <td>2020/08/10-AM09:04</td>
                <td>PC 출근</td>
                <td></td>
                <td>
                    <p id="normalcy">정상처리</p>
                </td>
            </tr>
            <td>퇴근</td>
            <td>2020/08/12-PM18:30</td>
            <td>PC 퇴근</td>
            <td></td>
            <td>
                <p id="normalcy">정상처리</p>
            </td>
            </tr>
        </tbody>
    </table>
    <br><br>
    <div class="paging">
    	<a href="#">&laquo;</a>
        <a href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">&raquo;</a>
    </div>

   </div>

</body>
</html>