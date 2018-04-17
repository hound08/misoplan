<%@page import="java.util.ArrayList"%>
<%@page import="dao.mySchduleDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="pageLoginCheck.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 	절대위치(absolute)
	상대위치(relative) */
* {
	margin: 0px;
	padding: 0px;
}
div { /* 모두모두 가운데 정렬 !!!!! */
	margin: 0px auto; 
 	border: 1px solid black;
}
* {
	font-family: 'NanumSquareRound', sans-serif;
}
.main-title {
	width: 1000px;
	heidht: 100px;
	padding: 15px 20px 0 20px;
/* 	vertical-align: top; */
}
.main-top {
	width: 1200px;
	height: 450px;
	background-color: #F6F6F6;
	padding: 15px 0 0 0;
	border: 1px solid gray;
}

.main-top-second1 {
	width: 610px;
	height: 410px;
 	margin: 5px 0 0 20px; 
	border: 1px solid gray;
	display: inline-block;
 	vertical-align: top;
}
.image-size {
	width: 610px;
	height: 410px;
}
.card_image {
	width: 350px;
	height: 250px;
}
.main-top-second2 {
	padding: 60px 40px 10px 60px;
 	vertical-align: top; 
	width: 400px;
	height: 280px;
 	margin: 25px 0 0 40px; 
	border: 1px solid gray;
	display: inline-block;
	
}
.main-center {
	width: 1200px;
	height: 650px;
	background-color: #F6F6F6;
	padding: 15px 0 0 0;
	border: 1px solid gray;
}
.center-text {
	/* display: inline-block; */
	/* vertical-align: middle; /* 텍스트 라인 높이 맞춤 */ */
	margin: 0 0 0 20px;
	width: 1100px;
	height: 50px;
	font-size: 20pt;
}
.center-main-card{
	width: 1200px;
	height: 300px;
	overflow: auto;
	border: 1px solid gray;
}
.center-card-box{
	/* overflow: scroll; */
	width: 250px;
	height: 250px;
	margin: 25px 0 10px 35px;
	display: inline-block; /* 가로형 정렬 */
}
.card-box-title {
	vertical-align: top; /* 텍스트 라인 높이 맞춤 */
	width: 240px;
	height: 70px;
	overflow: hidden;
	overflow: auto;
	margin: 0 0 5px 2px;
	border: 1px solid gray;
	font-size: 10pt;
}
.card-box-title2 {
	width: 240px;
	height: 30px;
	margin: 3px 0 0 0;
	vertical-align: middle;
}
.card-box-bottom {
	width: 240px;
	height: 170px;
	overflow: auto;
	border: 1px solid gray;
}
.center-bottom-image {
	width: 1160px;
	height: 200px;
	margin: 20px 20px;
	font-size: 10pt;
	vertical-align: top;
}
.button-bottom {
	width: 1100px;
	height: 30px;
	magin : 0 30px;
}
.like-button {
	font-size: 10pt;
}


</style>

</head>
<body>

	<div class ="main-title">
		<h3>title</h3>
	</div>
	<div class="main-top">
		
		<div class="main-top-second1">
			<img alt="image" class="image-size" src="${dto.image_url }">		
		</div>
		<div class="main-top-second2">
		<input type="button" value="조아욤" class="like-button" style="width: 35pt; height: 15pt;" 
			onclick="location.href='planlike.do?vote_count=${dto.vote_count }'">
			<p>${dto.nickname }</p>
			<p>${dto.tag}</p>
 			<p>${dto.area_names }</p>
			<p>${dto.schedule_date }</p>
			<p>${dto.vote_count }</p>
			<p>${dto.view_count }</p> 
			<p>${dto.board_date }</p>
			<p>${dto.content }</p>
			
		</div>
	</div>
	<div class="main-center">
		<div class="center-text">
			My Plan List
		</div>
			<div class="center-main-card">
			<c:forEach var="dto" items="">
				<div class="center-card-box" align="center">
					<div class="card-box-title">
						
						<div> 
						
						
						</div>
						<div class ="card-box-title2"> <!-- 날짜 -->
							
						</div>
					</div>
					<div class="card-box-bottom">
						
					</div>
					
				</div>
			</c:forEach>
			</div>
		<div class="center-bottom-image">
			
		</div>
		<div class="button-bottom" align="right">
			<input type="button" value="수정" style="width: 40pt; height: 20pt"
			onclick="location.href='planupdate.do?bs_num=${dto.bs_num}'">
			<input type="button" value="삭제" style="width: 40pt; height: 20pt"
			onclick="location.href='plandelete.do?bs_num=${dto.bs_num}&email=${email }'">
			<input type="button" value="목록" style="width: 40pt; height: 20pt" 
			onclick="location.href='boardschedule.do'">
		</div>
	</div>
	
	
	<%@ include file="footer.jsp"%>

</body>
</html>