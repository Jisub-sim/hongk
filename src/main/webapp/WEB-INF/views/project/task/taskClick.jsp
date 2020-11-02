<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul, li {
	list-style-type: none;
}

#back {
	float: left;
	padding-left: 20px;
}

#save {
	float: right;
	margin-right: 180px;
}

hr {
	border: 1px solid skyblue;
}

#button {
	height: 20px;
}

#ptn {
	color: gray;
	margin-left: 50px;
	margin-bottom: 10px;
	margin-top: 10px;
}

#list {
	margin-left: 50px;
	margin-top: 40px;
}

#task_name {
	width: 500px;
	height: 250px;
	border: 2px solid skyblue;
	padding-right: 0;
	float: left;
}

#task_info {
	width: 500px;
	height: 250px;
	border: 2px solid skyblue;
	padding-right: 0;
	float: left;
	margin-left: 20px;
	padding-right: 0;
	text-align: center;
}

#task_table tr {
	margin: 0 auto;
}

#task_table tr td {
	border-bottom: 1px solid skyblue;
	border-right: 1px solid skyblue;
}

#task_table tbody>tr:last-child>td {
	border-bottom: 0;
}

.tn, .tm, .tc {
	width: 60px;
	text-align: center;
}

.tn, .tm {
	height: 30px;
}

.tc {
	height: 175px;
}

.task_in {
	padding-left: 10px;
	padding-top: 5px;
	text-align: left;
	color: gray;
	font-weight: 600;
}

.write {
	padding-top: 5px;
	float: right;
}

.title {
	align:left;
	width: 280px;
}

.writer {
	width: 80px;
}

.date {
	width: 140px;
}

th {
	font-weight: 400;
	border-top: 1px solid skyblue;
	border-bottom: 1px solid skyblue;
}

#task_memo {
	height: 350px;
}

.memo {
	border-top: 1px solid skyblue;
	border-bottom: 1px solid skyblue;
	height: 100px;
	width: 80%;
	margin: 0 auto;
	margin-bottom: 10px;
}

.memo_font {
	color: gray;
	font-weight: 600;
	font-size: 15px;
	margin-left: 50px;
}

.memo_writer {
	float: left;
	font-size: 13px;
	font-weight: 400;
}

.memo_date {
	float: right;
	margin-right: 50px;
	font-size: 13px;
	font-weight: 400;
}

.memo_content {
	margin-left: -20px;
	padding-top: 50px;
}

.memo_wd {
	margin-top: -20px;
}

.memo_delete {
	font-size: 12px;
	float: right;
	margin-top: 10px;
	margin-right: 10px;
}
</style>
</head>
<body>
	<jsp:include page="../../common/include.jsp" />

	<div id="main">
		<div id="button">
			<ul>
				<li><a href="project.do" id="back">뒤로가기</a> <a href=""
					id="save">저장</a></li>

			</ul>
		</div>
		<hr>
		<div id="list">


			<div id="task_name">
				<table id="task_table">
					<tr>
						<td class="tn">업무명</td>
						<td>파이널 프로젝트 업무</td>
					</tr>
					<tr>
						<td class="tm">담당자</td>
						<td>심지섭</td>
					</tr>
					<tr>
						<td class="tc">내용</td>
						<td>파이널 프로젝트 업무 중 내용 / UI 설계하기 파이널 프로젝트 업무 중 내용 / UI 설계하기 파이널
							프로젝트 업무 중 내용 / UI 설계하기파이널 프로젝트 업무 중 내용 / UI 설계하기 파이널 프로젝트 업무 중 내용
							/ UI 설계하기 파이널 프로젝트 업무 중 내용 / UI 설계하기</td>
					</tr>
				</table>

			</div>
			<div id="task_info">
				<table>
					<tr>
						<td class="task_in" colspan="2">업무자료</td>
						<td class="write"><a href="">작성</a></td>
					</tr>
					<th class="title">제목</th>
					<th class="writer">작성자</th>
					<th calss="date">등록일</th>

					<tr>
						<td>업무 첨부자료.hwp</td>
						<td>심지섭</td>
						<td>2020-10-04</td>
					</tr>
					<tr>
						<td>업무 첨부자료2.hwp</td>
						<td>심지섭</td>
						<td>2020-10-04</td>
					</tr>
				</table>
			</div>
		</div>
		 <br><br><br><br><br>
                <br><br><br><br><br>
                <br><br><br>
                <hr>
                <h1 class="memo_font">업무메모</h1>
                <hr>
            
                <div class="task_memo">
                    <div class="memo">
                        <ul>
                            <li class="memo_wd"><h3 class="memo_writer">작성자</h3> <h3 class="memo_date">2020-10-05</h3></li>
                            <li class="memo_content">업무 상태 변경하였습니다.</li>
                            <li class="memo_delete"><a href="">삭제</a></li>
                        </ul>
                        
                    </div>
                    <div class="memo">
                            <ul>
                                <li class="memo_wd"><h3 class="memo_writer">작성자</h3> <h3 class="memo_date">2020-10-05</h3></li>
                                <li class="memo_content">업무 상태 변경하였습니다.</li>
                                <li class="memo_delete"><a href="">삭제</a></li>
                            </ul>
                            
                        </div>
                        

                </div>



	</div>
</body>
</html>