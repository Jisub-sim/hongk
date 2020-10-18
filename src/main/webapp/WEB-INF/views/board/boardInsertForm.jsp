<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrap {
		width:50%;
		margin:auto;
	}
	
	#boardTable {
		margin:auto;
		border:solid 1px white;
	}
	
	#boardTable th, #boardTable td {
		border:solid 1px white;
		text-align:center;
	}
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<h1 align="center">게시글 작성하기</h1>
	<br>
	
	<form action="binsert.do" method="post" enctype="multipart/form-data">
	<div class="wrap">
		<table id="boardTable">
			<tr>
				<td>제목</td>
				<td><input type="text" name="bTitle" size="50"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" readonly name="bWriter" value="${ loginUser.id }" size="50"></td>
			</tr>		
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="bContent"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="uploadFile"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록하기"> &nbsp;
					<a href="blist.do">목록으로</a>
				</td>
			</tr>
		</table>
	</div>
	</form>
</body>
</html>