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

    /* 타이틀 */
    #form_title{
        font-size: 20px;
        margin: 0;
    }

    /* 1 결재자 지정 */
     #des_approver{
        margin: 1em;
        border: 1px solid rgb(167, 155, 155);
        width: 40%;
        float: left;
        height: 70vh;
        text-align: center;
    }
  
    #app_team_div{
        height: 60%;
    }
    #app_seach_div{
        height: 33%;
    }
    #des_approver table{
        width: 100%;
    }
    #app_team_div dt{
        font-size: 15px;
        font-weight: bold;
    }
    /**/
    
    /**/
   
    
    /*2 결재 버튼 */
    #appbt_div{
        width: 10%;
        float: left;
        height: 70vh;
    }

    #appbt_div button{
        width: 100%;
        vertical-align: middle;
        background: none;
        border: 2px solid gray;
        color: rgb(81, 80, 80);
        border-radius: 5px;
        font-size: 15px;
        margin-top: 200%;

    }
  
    /* 3 지정된 결재자 */
    #des_approver1{
        border: 1px solid rgb(167, 155, 155);
        width: 40%;
        display: inline-block;
        height: 70vh;
        margin: 1em;
    }
     #ea_create_table{
         border-color:  rgba(183, 209, 241, 0.313);
         width: 100%;
     }

    #ea_create_table th, #des_approver table th {
        background: rgba(183, 209, 241, 0.313);
     }

    /* 완료 취소 버튼 */ 
    #ea_control_bt_div {
        margin: auto;
        vertical-align: middle;
        text-align: center;
    }
    #ea_control_bt_div button{
       margin-left: 1em;
    }
    /* wrap div*/
    #wrap_approver_div{
        width: 90%;
        margin: auto;
        padding: 1em;
    }
    
#app_team_div ul{
	 list-style: none;
    padding-left: 0px;
}
#lidept{
	font-weight : bold;
	font-size:18px;
	margin-bottom:0.5em;}
</style>
</head>
<body>
<%--    <jsp:include page="../common/include.jsp" /> --%>

   <div id="main">
      <br>
     <br>
    <p id="form_title">&nbsp;&nbsp;관리자 지정</p>
    <hr>
    <br>
    <!-- 조직도 -->
    <form id="appForm" action="" method="post">
    <div id="wrap_approver_div">
        <br>
        <div id="des_approver">
            <div id="app_team_div" style="overflow-y:scroll;">
          		<ul>
          		<c:forEach var="a" items="${ dept }">	
          				<li id="lidept">[${a.deptTitle }]
          					<ul class="lang_list">
          						<c:forEach var="b" items="${ list }">	
          							<c:if test="${a.deptCode eq b.deptCode}">
          								<c:if test="${ b.mNo ne loginUser.mNo  }">
	          								<li id="m${b.mNo }">${ b.mName }&nbsp;${ b.jobTitle }
	          									<input type="hidden" value="${ b.mNo }">
	          								</li>
	          							</c:if>
          							</c:if>
          						</c:forEach>
          					</ul>
          				</li>
          				<br>
          		</c:forEach>
          		
          		  <script>
          		  var ap= null;
          		  
					$('.lang_list li').mouseenter(function(){
						 $(this).css({"cursor":"pointer"});
						 $(this).css({"background":"lightgray", "font-weight":"bold"});
					}).mouseleave(function(){
				      	$(this).css({"background":"white", "font-weight":"normal"});
				    }).click(function(){
				    	$('.lang_list li').css({"border":"none"});
				    	$('#searchMemberTable_EA tr').css({"border":"none"});
				    	$(this).css({"border":"3px solid gray"});
				    	var mno = $(this).children().val();
				    	ap = mno;
				    	console.log(mno);
				    	console.log(ap);
					 });
					</script>
          		</ul>
            </div>
            <script>
           
            </script>
               <table class="ea_table">
                   <tr>
                       <td colspan="2"> <input type="text" id="searchName"  placeholder="사원명을 검색하시오" style="width:100%;height: 100%;"></td>
                       <td> <button style="width: 100%; height: 100%;" id="APPsearchBt" type="button">검색</button> </td>
                   </tr>
               </table> 
               <div id="app_seach_div" style="overflow-y:scroll;">
               <table class="ea_table sea" style="border-top: none;" id="searchMemberTable_EA">
                   <tr>
                       <th width="10%">no</th>
                       <th width="30%">부서</th>
                       <th width="30%">사원명</th>
                   </tr>
               </table>
               
            </div>
        </div>
         <!-- 결재 > 버튼 -->
        <div id="appbt_div">
            <button id="apselectbt" type="button">결 재 ></button>
        </div>
            <!--적용대상-->
        <div id="des_approver1">
            <p style="font-size: 15px; margin-left: 5%;">결재자</p>
            
            <table class="ea_table" border="1" id="ea_create_table" >
            <tr>
                <th>이름</th>
                <th>부서</th>
                <th>직책</th>
                <th>x<th>
            </tr>
              	<tbody>
                   
                </tbody>
            </table>
           
            <br>
        </div>
    </div>
	<input type="hidden" id="tm2" value="0"><input type="hidden" id="tm3" value="0">
	<input type="hidden" id="tl2" value="0"><input type="hidden" id="tl3" value="0">
	
    <div id="ea_control_bt_div">
        <button type="button" class="ea_bt" id="cancelSelectBt">취소</button> 
        <button type="submit" class="ea_bt" id="comSelectBt">완료</button>
    </div>
     </form>
    <!-- 사원 선택 후 결재 버튼 클릭  -->
		<script>
		var i = 1;
		
		$(function(){
			$("#apselectbt").on("click",function(){
				var ap_no = ap;
				console.log(ap_no);
				
				$.ajax({
					url:"addapprover.do",
					data: {ap_no:ap_no},
					type: "post",
					dataType: "json",
					success : function(data){
						if(i<=1){
							$tableBody = $("#ea_create_table");
							
							var $tr = $("<tr>");
// 							var $n = $("<td class='level'>" ).text(i);
							//id=lev"+i+"  name=lev"+i+">"
// 							 	$n.attr('value',i);
							var $aname = $("<td>").text(data.mName);
							var $Haname = $("<input type='hidden' name='mname' class='mname' value="+data.mName+">");

							var $dept = $("<td>").text(data.deptTitle);
							var $job = $("<td>").text(data.jobTitle);
							var $bttd = $("<td>");
							var $cancelBt = $("<button type='button'>").text("X");
								$cancelBt.attr('class','cBt');
							var $mn = $("<input type='hidden' name='mnoMHidden' class='mnoMHidden' value="+data.mNo+">");
							
// 							$tr.append($n);
							$tr.append($aname);
							$tr.append($Haname);
							$tr.append($dept);
							$tr.append($job);
							$bttd.append($mn);
							$bttd.append($cancelBt);
							$tr.append($bttd);
							$tableBody.append($tr);
							
							var mno = 'm'  + data.mNo ;
							var trid = 'tr'  + data.mNo ;
							console.log(mno);
							$('#'+ mno).attr('style', "display:none;");  //숨기기
							$('#'+ trid).attr('style', "display:none;");
							$('#'+ mno).css({"border":"none"});
							
							i++
							
						}else{
							alert("한명만 선택해 주세요.");
						}
					},
					error : function(e){
						console.log("error");
					}
				});
				
			});
		});
		
		// 선택 취소
		$(function(){
			$(document).on('click','.cBt', function(){
				var mn = $(this).prev().val();
				var mid = 'm'  + mn ; // li의 id
				var trid = 'tr'  + mn ; // tr의 id
				console.log("선택 취소할 mn : " + mn);
				
				$('#'+ mid).attr('style', "display:'';");
				$('#'+ trid).attr('style', "display:'';");
				$(this).parent().parent().remove();
				
				var select = $(this).parent().parent();
				var index = select.rowIndex;
				$('#lev'+i-1).text(index);
				
				i --;
				
			});
		});
				// 사원명 검색
			$(function() { 
			$("#APPsearchBt").click(function() { 
				//document.getElementById("appForm").setAttribute('action','searchMname.do' );
				var searchName = document.getElementById("searchName").value;
				
				
				$.ajax({
					url:"searchMname.do",
					data: {searchName:searchName},
					type: "post",
					dataType: "json",
					success : function(data){
							console.log(data);
							$tableBody = $("#searchMemberTable_EA ");
							
							if(data.length > 0){	
								for(var i in data){
									var $tr = $("<tr id=tr"+data[i].mNo+">");
									var $aMno = $("<td>").text(data[i].mNo);
									var $dept = $("<td>").text(data[i].deptTitle);
									var $aname = $("<td>").text(data[i].mName);
									var $mn = $("<input type='hidden' name='mnoHidden' class='mnoHidden' value="+data[i].mNo+">");
									
									$tr.append($aMno);
									$tr.append($dept);
									$tr.append($aname);
									$tr.append($mn);
									$tableBody.append($tr);
									
								}
								
// 								 <!-- 검색 창에서 사원 선택 -->
// 				          		  var ap= null;
									$('.sea td').mouseenter(function(){
										 $(this).parent().css({"cursor":"pointer"});
										 $(this).parent().css({"background":"lightgray", "font-weight":"bold"});
									}).mouseleave(function(){
								      	$(this).parent().css({"background":"white", "font-weight":"normal"});
								    }).click(function(){
								    	$('.lang_list li').css({"border":"none"});
								    	$('.sea td').parent().css({"border":"none"});
								    	$(this).parent().css({"border":"3px solid gray"});
								    	var mno = $(this).parent().children(":last").val();
								    	ap = mno;
								    	console.log('ap : ' + ap);
									 });
							}else{
								var $tr = $("<tr>");
								var $rContent = $("<td colspan='3'>").text("검색 결과가 없습니다.");
								
								$tr.append($rContent);
								$tableBody.append($tr);
							}
					},
					error : function(e){
						console.log("error");
					}
				});
				
				})
			})
        
		// 최종 획인
		
		$(function() { 
			$("#comSelectBt").click(function() { 
				var array = [];
				
				
					var parent = window.opener;
					 
			        var answer = '결재라인';//document.getElementsByClassName('mname').value;
			        
			        var mlist = new Array();
					   $("input[name=mname]").each(function(index, item){
						   mlist.push($(item).val());
					   });
					   
					
					 parent.document.getElementById("managerBt").value = mlist ;
					
					  var list = new Array();
					   $("input[name=mnoMHidden]").each(function(index, item){
						   list.push($(item).val());
					   });
					 
					 parent.document.getElementById("mid").value = list ;
					
				window.close();
			}); 
		})
		
		$(function() { 
			$("#cancelSelectBt").click(function() { 
				window.close();
			}); 
		})

		</script>

   </div>

</body>
</html>