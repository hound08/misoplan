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
			
			#center {
				margin: 0px auto;
				width: 1200px;
				height: 100%;
			}
			
			#main {
					width: 930px;
					border: 3px solid green;
					text-align: center;
					float: left;
					margin-top: 20px;
				}
			#main h1 {
					margin: 20px 0px;
			}
			.center-second { /* center 의 세부 내용 쭉쭉~~*/
				border: 0.5px solid gray;
				width: 350px;
				height: 420px;
				display: inline-block; /* 가로형 정렬 */
				margin: 30px 22.5px;
				border-radius: 10px;
				vertical-align: middle; /* 텍스트 라인 높이 맞춤 */
			}
			
			.second-box { /* center-second 이미지 삽입 div */
				border-radius: 10px;
				width: 350px;
				height: 250px;
				clear: both;
				overflow: hidden;
			}
			
			.second-text { /* center-second 텍스트 삽입 */
				width: 340px;
				height: 50px;
				text-align: left;
			}
			.text {
				text-align: left;
			`
			}
			.center-second:hover{
				cursor: pointer;
			}
		</style>
		
		<script type="text/javascript">
			$(document).on('click', '.second-text', function(){
				//console.log("clicked");
				var $this = $(this);
				var sl_code = $this.attr('id');
				//console.log('sl_code : ' + sl_code);
				
				var form = $("#form");
				form.append("<input type='hidden' name='sl_code' value="+sl_code+">");
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
				<h1>나의 일정 리스트</h1>
				<div id="myinfo">
					<div id="info">
						<c:forEach var="list" items="${showList }">
							<div class="center-second" >
								<div class="second-box">
									<img alt="image" src="images/1.jpg">
								</div>
								<div class="second-text" id=${list.sl_code }>
									<h1>제목 : ${list.s_name }</h1>
								</div>
								<div class="text">여행지 : ${list.area_name }</div>
								<div class="text">여행기간 : ${list.tour_date_start } ~ ${list.tour_date_end }</div>
								<div class="text">작성일 : ${list.regi_date }</div>
								<div class="text">
									<button class='deletePlan' id='delete${list.sl_code}'>삭제</button>
								</div>
							</div>
							
						
						</c:forEach>
						<div class="pagination">
							<a href="#">&laquo;</a> 
							<a href="#" class="active">1</a> 
							<a href="#">2</a> 
							<a href="#">3</a> 
							<a href="#">4</a> 
							<a href="#">5</a> 
							<a href="#">&raquo;</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>