<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <title>noticeboard</title>
    <script
      src="https://kit.fontawesome.com/5218f6fd6d.js"
      crossorigin="anonymous"
    ></script>
    <!--아이콘 참조 사이트 font awesome-->
  </head>

  <style>

/* 게시판 타이틀 */
.noticeTitle {
  font-size: 25px;

}

#searchArea {
 
}


#searchArea > input {
  width: 200px;
}
#searchimg {
  width: 50px;
  background-color: white;
  border: none;
}

.noticewrap {
  width: 90%;
  margin: auto;
  
}

#boardTable {
  width: 100%;
  border-collapse: collapse;
}

#boardTable th {
  background-color: rgb(217, 241, 255);
}
#boardTable td {
  text-align: center;
  font-size: 14pt;
  border-bottom: 0.5px solid gray;
}

/* 글쓰기 버튼///////////////////////////////////////////////////// */
.newcontent {
  background-color: green;
  color: white;
  border-radius: 5px;
  width: 80px;
  height: 30px;
  float: right;
  margin-right: 110px;
}
/*////////////////////// 페이징 처리 //////////////////////// */
.page_wrap {
  text-align: center;
  font-size: 0;
}
.page_nation {
  display: inline-block;
}
.page_nation .none {
  display: none;
}
.page_nation a {
  display: block;
  margin: 0 3px;
  float: left;
  border: 1px solid #e6e6e6;
  width: 28px;
  height: 28px;
  line-height: 28px;
  text-align: center;
  background-color: #fff;
  font-size: 13px;
  color: #999999;
  text-decoration: none;
}
.page_nation .arrow {
  border: 1px solid #ccc;
}
.page_nation .pprev {
  background: #f8f8f8 url("/img/page_pprev.png") no-repeat center center;
  margin-left: 0;
}
.page_nation .prev {
  background: #f8f8f8 url("/img/page_prev.png") no-repeat center center;
  margin-right: 7px;
}
.page_nation .next {
  background: #f8f8f8 url("/img/page_next.png") no-repeat center center;
  margin-left: 7px;
}
.page_nation .nnext {
  background: #f8f8f8 url("/img/page_nnext.png") no-repeat center center;
  margin-right: 0;
}
.page_nation a.active {
  background-color: #42454c;
  color: #fff;
  border: 1px solid #375bad;
}

  </style>



  <body>
   <c:import url="../common/include.jsp"/>
    <section id="main">
        <div class="section">
            <h1 class="noticeTitle">&emsp;&emsp;&emsp;&emsp;제안게시판</h1>    
            <br /><br />
            <!-- 검색 에리어 /////////////////////////////////// -->
            <div id="searchArea" align="center">
              <select id="searchCondition" name="searchCondition">
                <option>전체</option>
                <option>제목</option>
                <option>내용</option>
              </select>
              <input type="search" placeholder="검색" />
              <button id="searchimg"><img src="/img/loupe.png" /></button><br />
            </div>
            <br /><br />
            <!-- 게시글 리스트 /////////////////////////////////////// -->
            <div class="noticewrap">
              <table id="boardTable">
                <tr>
                  <th>번호</th>
		          <th>제목</th>
		          <th>작성자</th>
		          <th>작성일</th>
		          <th>조회수</th>
                </tr>
        		<c:forEach var="f" items="${ list }">
                <tr>
                  <td>${ f.bId }</td>
                  
	                  <%-- <c:url var="bdetail" value="bdetail.do">
	                  	<c:param name="bId" value="${ n.bId }"/>
	                  </c:url> --%>
	                  
                  <%-- <td><a href="${ bdetail }">${ n.bTitle }</a></td> --%>
                  
	              
					<td>${ f.bTitle }</td>
					<td>${ f.bWriter }</td>  
                  <td>${ f.createDate }</td>
                  <td>${ f.bCount }</td>
                </tr>
                </c:forEach>
              </table>
            </div>
            
            <br />
            <!--  글 쓰기 버튼   -->
            <c:if test="${ loginUser.id eq 'admin' }">
            <button class="newcontent" onclick="location.href='nWriterView.do'">글쓰기</button>
            </c:if>
            <br /><br />
      
            <!-- 페이징 처리  -->
      
            <!-- <div class="page_wrap">
              <div class="page_nation">
                <a class="arrow pprev" href="#"></a>
                <a class="arrow prev" href="#"></a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#">6</a>
                <a href="#">7</a>
                <a href="#">8</a>
                <a href="#">9</a>
                <a href="#">10</a>
                <a class="arrow next" href="#"></a>
                <a class="arrow nnext" href="#"></a>
              </div>
            </div> -->
           

    </section>
  </body>
</html>