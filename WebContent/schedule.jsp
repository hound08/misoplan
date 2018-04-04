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
		<style type="text/css">
			#center {
				border: 1px solid red;
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
							<tr><th>번호</th><th id="planname">일정 제목 </th> <th id="region">중분류 지역명 </th><th>여행기간</th><th>등록일</th></tr>
								<c:if test="${totCnt > 0 }">
									<c:forEach var="bsdto" items="${schedule }">
							<tr>
								<td>	
								
								
									</c:forEach>
								</c:if>
							</tr>
						
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