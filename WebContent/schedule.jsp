<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="header.jsp" %>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>내 일정 리스트</title>
		<style type="text/css">
			#center {
				border: 1px solid red;
				margin: 0px auto;
				width: 1000px;
				height: 100%;
			}
			
			#main {
					width: 730px;
					border: 3px solid green;
					text-align: center;
					float: left;
					margin-top: 20px;
				}
			#main h1 {
					margin: 20px 0px;
			}
			#info table {
			}
			#planname {
				width: 400px;
			}
			#region {
				width: 150px;
			}
			.pagination {
				clear: both;
			    justify-content: center;
			    margin: 50px 0 35px 0;
			}
						
			.pagination a {
				color:black;
			    padding: 8px 16px;
			    font-size:20px;
			    text-decoration: none;
			}
			
			.pagination a.active {
			    background-color: #4CAF50;
			    color: white;
			}
			
			.pagination a:hover:not(.active) {
			    background-color: #ddd;
			    border-radius: 5px;
			}
		</style>
	</head>
	<body>
		
		<div id="center">
			<%@ include file="sidemenu.jsp" %>
			<div id="main">
				<h1>나의 일정 리스트</h1>
				<div id="myinfo">
					<div id="info">
						<table border="1">
							<tr><th id="planname">일정 제목 </th> <th id="region">중분류 지역명 </th><th>여행기간</th><th>등록일</th></tr>
							<tr><td>신나는 전주로 가자 </td><td>전주,남원,여수,순천 </td><td>4.10~4.14</td><td>2018-03-30</td></tr>
							<tr><td>신나는 부산로 가자 </td><td>부산 </td><td>4.10~4.14</td><td>2018-03-30</td></tr>
							<tr><td>신나는 서울로 가자 </td><td>서울,수원,인천</td><td>4.10~4.14</td><td>2018-03-30</td></tr>
						</table>
						<div class="pagination">
										<a href="#">&laquo;</a> 
										<a href="#" class="active">1</a> 
										<a href="#">2</a> 
										<a href="#">3</a> 
										<a href="#" >4</a> 
										<a href="#">5</a> 
										<a href="#">&raquo;</a>
							</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>