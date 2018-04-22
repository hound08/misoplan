<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   <%@ include file="header.jsp" %>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>내 일정 리스트</title>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<link rel="stylesheet" type="text/css" hrefs="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
		<style type="text/css">
			*{
				font-family: 'NanumSquareRound', sans-serif;
			}
			
			/* width */
::-webkit-scrollbar {
    width: 3px;
    height: 5px;
}

/* Track */
::-webkit-scrollbar-track {
    box-shadow: inset 0 0 5px grey; 
    border-radius: 10px;
}
 
/* Handle */
::-webkit-scrollbar-thumb {
    background: #39A2D8; 
    border-radius: 10px;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
    background: #39A2D8; 
}
			#center {
				margin: 0px auto;
				width: 1200px;
			}
			
			#main {
				width: 930px;
				text-align: center;
				float: left;
				margin-top: 20px;
				border: 1px solid gray;
				height: 651.2px;
				overflow: scroll;
					
			}
			#myinfo{
			}
			.mylist{
				margin-top: 20px;
			}
			.center-second { /* center 의 세부 내용 쭉쭉~~*/
				border: 0.5px solid gray;
				width: 350px;
				height: 410px;
				display: inline-block; /* 가로형 정렬 */
				margin: 30px 22.5px;
				border-radius: 10px;
				vertical-align: middle; /* 텍스트 라인 높이 맞춤 */
				box-shadow: 3px 3px 7px 0px rgba(0,0,0,0.7);
				
			}
			
			.second-box { /* center-second 이미지 삽입 div */
				border-radius: 10px;
				width: 350px;
				height: 250px;
				overflow: hidden;
				background: url("images/1.jpg");
				background-size: 100% 100%;
			}
			
			.second-text { /* center-second 텍스트 삽입 */
				width: 350px;
				height: 35px;
				text-align: left;
				font-size: 30px;
				font-weight: bold;
				line-height: 35px;
				margin-top: 10px;
			}

			.card-title{
				text-align: center;
				line-height: 30px;
			}
			.tour-name{
				text-align: center;
				line-height: 25px;
			}
			.tour-date{
				text-align: center;
				line-height: 25px;
			}
			.tour-regi{
				text-align: center;
				line-height: 25px;
			}
			.btnwrapper{
				margin: 5px 0 0 0;
				height: 30px;
			}
			.updatePlan{
				width : 45%;
				height: 30px;
				border-radius: 5px;
			}
			.updatePlan:hover{
				background-color: #43484f;
				color: white;
			}
			.deletePlan{
				width : 45%;
				height: 30px;
				border-radius: 5px;
			}
			.deletePlan:hover{
				background-color: #43484f;
				color: white;
			}
		</style>
		
		<script type="text/javascript">
		
			
		
			$(document).on('click', '.updatePlan', function(){
					//console.log("clicked");
				var $this = $(this);
				var updateId = $this.attr('id'); // update1
					//console.log('sl_code : ' + sl_code);
				updateId = updateId.substr(6, updateId.length);
					//console.log("updateId : " + updateId);
				var form = $("#form");
				form.append("<input type='hidden' name='sl_code' value="+updateId+">");
				form.submit();
			});
			
			
			$(document).on('click', '.deletePlan', function(){
				$this = $(this);
				var deleteId = $this.attr('id');
					//console.log(deleteId);
				var deleteId = deleteId.substr(6, deleteId.length);
					//console.log(deleteId);
				$('#form').append("<input type='hidden' name='deleteId' value="+deleteId+">");
				form.submit();
				
			});
		</script>
	</head>
	<body>
		<%
			String email = (String)session.getAttribute("email");
		%>
		<form id="form" action="loadPlan.do">
			<input type="hidden" name="email" value="<%=email%>">
			
		</form>
		<div id="center">
			<%@ include file="sidemenu.jsp" %>
			<div id="main">
				<h1 class="mylist">나의 일정 리스트</h1>
				<div id="myinfo">
					<div id="info">
		
						<c:forEach var="list" items="${showList }">
							<c:if test="${list.is_deleted eq 0 }">
							<div class="center-second">
								<div class="second-box">
								</div>
								<div class="second-text" >
									<div class="card-title">${list.s_name }</div>
								</div>
								<div class="tour-name" id='tour-name'>${list.area_name }</div>
								<div class="tour-date">${list.tour_date_start } ~ ${list.tour_date_end }</div>
								<div class="tour-regi">등록 : ${list.regi_date }</div>
								<div class="btnwrapper">
									<button class='updatePlan' id='update${list.sl_code}'>수정</button>
									<button class='deletePlan' id='delete${list.sl_code}'>삭제</button>
								</div>
							</div>
							</c:if>
						
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>