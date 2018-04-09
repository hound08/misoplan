<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="header.jsp" %>
   <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>동행 구하기</title>
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
			.companions table {
				margin: 0 auto;
			}
			
			.companions table td { 
				text-align: left; 
				padding: 10px;
			}
			#aa {
				width: 500px;
			}
			.bb {
				width: 120px;
			}
						
			.pagination {
			    display: flex;
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
			.companions h1 {
				margin-bottom: 40px;
			}
		</style>
		<script src="jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
	
		</script>
	</head>
	<body>
		
		<div id="center">
			<%@ include file="sidemenu.jsp" %>
			<div id="main">
				<h1>동행 구하기</h1>
				<div id="myinfo">
					<div id="info">
					<b id="all" onclick="all_click()">전체보기</b> |
						
						<table border="1">
								<tr>
									<th id="aa">제목 </th> <th class="bb">닉네임</th><th class="bb">동행</th><th class="bb">등록일자</th>
								 </tr>
								 <c:forEach var="mylist" items="">
								 	<tr>
								 		<td>${title}</td><td>${nickname }</td>
								 		<td>${current_num } / ${minumum_num }</td>
								 		<td>${post_date }</td>
								 	</tr>
								</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>