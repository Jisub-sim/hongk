<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#button{
    height:20px;
}
ul,li{
    list-style-type: none;
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
#list{
    margin-left: 100px;
    margin-top: 40px;
}
#ptn{
    color:gray;
    margin-left:50px;
    margin-bottom:10px;
    margin-top:10px;
    
}
#tn{
    margin-left:30px;
}
#member{
    margin-left:27px;
    margin-top:15px;
    font-size : 20px;
}
#plus{
    width:20px;
    height:20px;
    border:2px solid skyblue;
    text-align: center;
    color:skyblue;
    font-weight:700;
    padding-bottom:5px;
    margin-bottom:5px;
}
#minus{
    width:20px;
    height:20px;
    border:2px solid skyblue;
    text-align: center;
    padding-bottom:5px;

}
#minus a,#plus a{
    color:skyblue;
    font-weight:700;
    
}
#content{
    margin-top:10px;
    margin-left:26px;
}
textarea:focus, input:focus{
    outline: 0;
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
                <h3 id="ptn">업무 등록</h3>
            
            
                <ul id="list">
                    
                        
                        <table>
                            <tr><td>업무명</td>
                                <td> <input type="text" size="100" id="tn" style="border:2px solid skyblue;"></td>
                            </tr>
                            
                            <tr><td>담당인원</td>
                            <td><textarea id="member" cols="50" rows="5" style="border:2px solid skyblue;"></textarea></td>
                        <td><div id="plus"><a href="">+</a></div><div id="minus"><a href="">-</a></div></td>
                    </tr>
                    <tr>
                        <td>업무 내용</td>
                        <td colspan="2"><textarea id="content" cols="100" rows="10" style="border:2px solid skyblue;"></textarea></td>
                    </tr>
                        </table>

                </ul>



        </div>

</body>
</html>