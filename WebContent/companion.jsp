<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	color: black;
	padding: 8px 16px;
	font-size: 20px;
	text-decoration: none;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
}

.pagination a:hover:not (.active ) {
	background-color: #ddd;
	border-radius: 5px;
}

.companions h1 {
	margin-bottom: 40px;
}
</style>

</head>
<body>

	<div id="center">
		<%@ include file="sidemenu.jsp"%>
		<div id="main">
			<h1>동행 구하기</h1>
			<div id="myinfo">
				<div id="info">
					<b id="all" onclick="all_click()">전체보기</b> |
					<table border="1" id="mytable">
						<tr>
							<th id="aa">제목</th>
							<th class="bb">닉네임</th>
							<th class="bb">동행</th>
							<th class="bb">등록일자</th>
						</tr>
						<c:forEach var="list" items="${list }">
							<tr>
								<td><a id='btn-title' onclick = "test(applist)"> ${list.title} </a>
								</td>
								
								<td>${list.nickname }</td>
								<td>${list.current_number } / ${list.minimum_number } </td>
								<td>${list.reg_date }</td>
							</tr>
							<tbody></tbody>
						</c:forEach>
					</table>
					<button id='btn-delete-row'>행 삭제하기</button>


<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$(document).on('click','#btn-title', function(){
    $('#mytable > tbody:last').append('<tr>${applist.message}<td> </td><td></td><td></td><td></td></tr>');
  });
  $('#btn-delete-row').click(function() {
    $('#mytable > tbody:last > tr:last').remove();
  });
</script>
				</div>
			</div>
		</div>
	</div>
</body>