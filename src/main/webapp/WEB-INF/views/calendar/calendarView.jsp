<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
<style>
	#cal_header {
        text-align: center;
        font-size: 40px;
        margin: 5px 0 0 0;
    }

    #calendar {
        margin : 10px 0 0 10px;
        width: 98%;
        height:910px;
    }

    #calendar a {
        color: #8e352e;
        text-decoration: none;
    }

    #calendar ul {
        list-style: none;
        padding: 0;
        margin: 0;
        width: 100%;
    }

    #calendar li {
        display: block;
        float: left;
        width: 14.342%;
        padding: 5px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        margin-right: -1px;
        margin-bottom: -1px;
    }

    #calendar ul.weekdays {
        height: 40px;
        background: #2e738e;
    }

    #calendar ul.weekdays li {
        text-align: center;
        text-transform: uppercase;
        line-height: 20px;
        border: none !important;
        padding: 10px 6px;
        color: #fff;
        font-size: 13px;
    }

    #calendar .days li {
        height: 145px;
    }

    #calendar .days li:hover {
        background: #d3d3d3;
    }

    #calendar .date {
        text-align: center;
        margin-bottom: 5px;
        padding: 4px;
        background: #333;
        color: #fff;
        width: 20px;
        border-radius: 50%;
        float: right;
    }

    #calendar .event {
        clear: both;
        display: block;
        font-size: 13px;
        border-radius: 4px;
        padding: 5px;
        margin-top: 40px;
        margin-bottom: 5px;
        line-height: 14px;
        background: #e4f2f2;
        border: 1px solid #b5dbdc;
        color: #009aaf;
        text-decoration: none;
    }

    #calendar .event-desc {
        color: #666;
        margin: 3px 0 7px 0;
        text-decoration: none;
    }

    #calendar .other-month {
        background: #f5f5f5;
        color: #666;
    }
</style>
</head>
<body>

	<jsp:include page="../common/include.jsp"/>

	<div id="main">
        <header id="cal_header">
            <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
            <span id="cal_top_year"></span>
            <span id="cal_top_month"></span>
            <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
        </header>
        <div id="cal_wrap">
            <div id="cal_tab" class="cal"></div>
        </div>
    </div>
    
    <script>
        var today = null;
        var year = null;
        var month = null;
        var firstDay = null;
        var lastDay = null;
        var $tdDay = null;
        var $tdSche = null;
        var jsonData = null;
        $(document).ready(function () {
            drawCalendar();
            initDate();
            drawDays();
            drawSche();
            $("#movePrevMonth").on("click", function () { movePrevMonth(); });
            $("#moveNextMonth").on("click", function () { moveNextMonth(); });
        });


        //Calendar 그리기
        function drawCalendar() {
            var setTableHTML = "";
            setTableHTML += '<div id="calendar">';
            setTableHTML += ' <ul class="weekdays"><li>Sunday</li><li>Monday</li><li>Tuesday</li><li>Wednesday</li><li>Thursday</li><li>Friday</li><li>Saturday</li></ul>';
            for (var i = 0; i < 6; i++) {
                setTableHTML += '<ul class="days">';
                for (var j = 0; j < 7; j++) {
                    setTableHTML += '<li class="day">';
                    setTableHTML += '    <div class="cal-day" value="${ $tdDay }"></div>';
                    setTableHTML += '    <div class="cal-schedule"></div>';
                    setTableHTML += '</li>';
                }
                setTableHTML += '</tr>';
            }
            setTableHTML += '</table>';
            $("#cal_tab").html(setTableHTML);
        }

        //날짜 초기화
        function initDate() {
            $tdDay = $("li div.cal-day")
            $tdSche = $("li div.cal-schedule")
            dayCount = 0;
            today = new Date();
            year = today.getFullYear();
            month = today.getMonth() + 1;
            if (month < 10) { month = "0" + month; }
            firstDay = new Date(year, month - 1, 1);
            lastDay = new Date(year, month, 0);
        }

        //calendar 날짜표시
        function drawDays() {
            $("#cal_top_year").text(year);
            $("#cal_top_month").text(month);
            for (var i = firstDay.getDay(); i < firstDay.getDay() + lastDay.getDate(); i++) {
                $tdDay.eq(i).text(++dayCount);
            }
            for (var i = 0; i < 42; i += 7) {
                $tdDay.eq(i).css("color", "red");
            }
            for (var i = 6; i < 42; i += 7) {
                $tdDay.eq(i).css("color", "blue");
            }
        }

        //calendar 월 이동
        function movePrevMonth() {
            month--;
            if (month <= 0) {
                month = 12;
                year--;
            }
            if (month < 10) {
                month = String("0" + month);
            }
            getNewInfo();
        }

        function moveNextMonth() {
            month++;
            if (month > 12) {
                month = 1;
                year++;
            }
            if (month < 10) {
                month = String("0" + month);
            }
            getNewInfo();
        }

        //정보갱신
        function getNewInfo() {
            for (var i = 0; i < 42; i++) {
                $tdDay.eq(i).text("");
                $tdSche.eq(i).text("");
            }
            dayCount = 0;
            firstDay = new Date(year, month - 1, 1);
            lastDay = new Date(year, month, 0);
            drawDays();
            drawSche();
        }

        //2019-08-27 추가본

        //데이터 등록
        function setData() {
            jsonData =
                {
                    "2019": {
                        "07": {
                            "17": "제헌절"
                        }
                        , "08": {
                            "7": "칠석"
                            , "15": "광복절"
                            , "23": "처서"
                        }
                        , "09": {
                            "13": "추석"
                            , "23": "추분"
                        }
                    }
                }
        }

        //스케줄 그리기
        function drawSche() {
            setData();
            var dateMatch = null;
            for (var i = firstDay.getDay(); i < firstDay.getDay() + lastDay.getDate(); i++) {
                var txt = "";
                txt = jsonData[year];
                if (txt) {
                    txt = jsonData[year][month];
                    if (txt) {
                        txt = jsonData[year][month][i];
                        dateMatch = firstDay.getDay() + i - 1;
                        $tdSche.eq(dateMatch).text(txt);
                    }
                }
            }
        }
        
        
        $(".cal-day").click(function(){ 
        	var cDate = $(this).val();
        	location.href="<%= contextPath %>/detail.fu?textNo="+textNo;
		});

    </script>
    
</body>
</html>