<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul, li{
    list-style-type:none;
}

#ask_list{
    margin:30px 23%;
}
#ask_list td{
    padding-bottom:10px;
}
#back{
    float:left;
    padding-left : 20px;
    
}
#save{
    float:right;    
    margin-right:80px;
}
hr{
    border: 1px solid skyblue;
}
#button{
    height:20px;
}
#ptn{
    color:gray;
    margin-left:50px;
    margin-bottom:10px;
    margin-top:10px;
    
}
</style>
</head>
<body>
	<jsp:include page="../../common/include.jsp" />

 <div id="main">
            <div id="button">
                    <ul>
                        <li>
                                <a href="project.do" id="back">뒤로가기</a> <a href="" id="save">저장</a>
                            </li>
                      
                    </ul>
                </div>
                <hr>
                  <h3 id="ptn">요청 등록</h3>
                <div id="ask_list">
                    <table>
                        <tr>
                            <td>요청명&nbsp;&nbsp;</td>
                            <td>
                                <input type="text" size=50>
                            </td>
                        </tr>
                        <tr>
                            <td>유형</td>
                            <td><select>
                                <option>요청/개선/협조/의견</option>
                                <option>요청</option>
                                <option>개선</option>
                                <option>협조</option>
                                <option>의견</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td>우선순위</td>
                            <td><select>
                                <option>상 / 중 / 하</option>
                                <option>상</option>
                            <option>중</option>
                            <option>하</option>
                        </select></td>
                        </tr>
                        <tr>
                            <td>담당팀</td>
                            <td>
                                <select>
                                    <option>프로젝트 내 팀</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                첨부파일
                            </td>
                            <td>
                                <input type="file">

                            </td>


                        </tr>
                        <tr><td colspan="2">
                            <textarea cols="80" rows="20"></textarea>
                        </td></tr>
                    </table>

                </div>

        </div>


</body>
</html>