<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>동행 구하기</title>
<style type="text/css">
#center {
	margin: 0px auto;
	width: 1200px;
	height: 100%;
}

#main {
	width: 930px;
	text-align: center;
	float: left;
	margin-top: 20px;
}

#main h1 {
	margin: 20px 0px;
}
#mytable {
	margin: auto;
	background-color: #FFFFFF;
	border: 1px solid #1C6EA4;
	width: 90%;
	border-collapse: collapse;
}
#mytable .title {
	width: 60%;
}
#mytable .serve {
	width: 13%;  
}
#mytable th , #mytable td {
	  border: 1px solid #AAAAAA;
	  padding: 3px 2px;
}
#mytable td {
	font-size: 14px;
}
#mytable tr:nth-child(odd) {
	  background: #D0E4F5;
	}

#mytable th {
	  background: #1A7AD9;
	  border-bottom: 2px solid #444444;
	  font-size: 15px;
	  font-weight: bold;
	  color: #FFFFFF;
	  border-left: 2px solid #D0E4F5;
}
#mytable thead th:first-child {
	  border-left: none;
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
		<%@ include file="sidemenu.jsp"%>
		<a href="companionForm.do?email=${email }">동행 게시물 List</a> | <a href="companionForm2.do?email=${email }"> 동행 신청 List</a>
		<div id="main">
				<div id="mainsecond2">
					<h1>동행신청 List</h1>
					<div>
					<table id="mytable">
						<tr>
							<th class="title">메시지</th>
							<th class="serve">닉네임</th>
							<th class="serve">동행상태</th>
							<th class="serve">등록일자</th>
						</tr>
						<c:forEach var="myapplist" items="${myapplist }" >
							<tr> 
								<td><pre class="message">${myapplist.message}</pre></td>
								<td>${myapplist.nickname } </td>
								<td>
									<c:if test="${myapplist.status   == 0}">
										대기
									</c:if>
									<c:if test="${myapplist.status  == 1}">
										수락
									</c:if>
									<c:if test="${myapplist.status  == 2}">
										거절
									</c:if> 
								</td>
								<td>${myapplist.applicants_date }</td>
							</tr>
						</c:forEach>
					</table>
					</div>
					<div class="pagination">
						<c:if test="${startPage!=1 }">
							<a href='companionForm2.do?email=${email }&pageNum=${startPage-blockSize }'>&laquo;</a>
						</c:if>
						
						<c:if test="${startPage==1 }">
							<a href='companionForm2.do?email=${email }&pageNum=1'>&laquo;</a>
						</c:if>
						
						<c:if test="${currentPage!=1 }">
							<a href='companionForm2.do?email=${email }&pageNum=${currentPage-1}'>&#9665</a>
						</c:if>
						
						<c:if test="${currentPage==1 }">
							<a href='companionForm2.do?email=${email }&pageNum=1'>&#9665</a>
						</c:if>
						
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<a href='companionForm2.do?email=${email }&pageNum=${i }'>${i }</a>
						</c:forEach>
						
						<c:if test="${currentPage==totalPage }">
							<a href='companionForm2.do?email=${email }&pageNum=${totalPage }'>&#9655</a>
						</c:if>
						
						<c:if test="${currentPage!=totalPage }">
							<a href='companionForm2.do?email=${email }&pageNum=${currentPage+1 }'>&#9655</a>
						</c:if>
						
						<c:if test="${endPage>=totalPage }">
							<a href='companionForm2.do?email=${email }&pageNum=${totalPage}'>&raquo;</a>
						</c:if>
						
						<c:if test="${endPage<totalPage }">
							<a href='companionForm2.do?email=${email }&pageNum=${endPage+blockSize }'>&raquo;</a>
						</c:if>
					</div>
				</div>
		</div>
	</div>
</body>