<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
div {
	margin: 0px auto;
}

* {
	padding: 0px;
	margin: 0px;
	font-family: 'NanumSquareRound', sans-serif;
}

.section {
	width: 1200px;
}

.main-image {
	border-radius: 5px;
	margin-left: auto;
	margin-right: auto;
	width: 100%;
	height: 400px;
	overflow: hidden;
	position: relative;
}

.centerimage {
	min-height: 100%;
	min-width: 100%;
	width: 100%;
	height: auto;
}

.section-card {
	width: 100%;
	margin-top: 35px;
	margin-left: auto;
	margin-right: auto;
	display: inline-block;
	border: solid;
	border-color: #F6F6F6;
}

.pagenumber {
	width: 1080px;
	height: 100px;
}

.pagenumber {
	margin-top: 30px;
	text-align: center;
}

<<<<<<< HEAD
.footer_wrap {
	margin-top: 600px;
	padding-top: 20px; margin-left : auto;
	margin-right: auto;
	margin-left: auto;
=======
.container {
	padding: 15px;
	height: 150px;
	clear: both;
>>>>>>> 3c43caefdb37bcfbfb31904abd97ca3b420a0de9
}

.card {
	height: 400px;
	width: 350px;
	border: solid;
	border-radius: 10px;
	border-color: #F6F6F6;
	display: inline-block;
	margin-left: 30px;
	margin-bottom: 30px;
	position: relative;
}

.card:hover {
	border-color: #A6A6A6
}

.pagination {
	display: flex;
	justify-content: center;
	margin: 50px 0 35px 0;
	clear: both;
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

.pagination a:hover:not {
	background-color: #ddd;
	border-radius: 5px;
}

.card-image {
	width: 300px;
	height: 60%;
}

.container{
	padding: 15px;
	height: 40%;
	border: solid;
}

.search {
	display: inline-flex;
	clear: both;
}

.search-bar {
	font-size: 15px;
	width: 400px;
	height: 30px;
}

.search-submit {
	font-size: 15px;
	width: 70px;
	background-color: #AA1212;
	color: white;
}

.search-select {
	font-size: 15px;
	margin-right: 5px;
}

.align {
	margin-top: 30px;
	width: 100%;
	margin-left: auto;
	margin-right: auto;
}

.align button {
	width: 100px;
	height: 30px;
}

.center-label {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 30px
}

.write-button {
	width: 70px;
	height: 30px;
	display: flex;
	float: right;
	font-size: 15px;
	justify-content: center;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="section">
		<div class="main-image">
			<img id="center-image" alt="centerimage" src="images/korea1.jpg">
			<div class="center-label">
				<!-- 텍스트 ! -->
			</div>
		</div>
		<div class="align">
			<button>조회순</button>
			<button>인기순</button>
			<button>최신순</button>
		</div>
		<div class="section-card">
<<<<<<< HEAD
			<div class="card" onmouseout="cardChange()" >
				<img src="images/plan.jpg"  class="card-image" alt="1" style="width: 100%">
				<div class="container">
					<div style="float: right; color:#2478FF ">#1 #2 #3</div><div style="font-size: 20px;">제목</div>
					<div style="float: right;">현재인원/최소인원</div><div>닉네임</div>
					<div style="float: right;">마감?</div><div>내용</div>
					<div style="vertical-align: baseline;">조회수 추천수</div>
					<div>등록일</div>
=======
			<c:forEach var="board" items="${list}">
				<div class="card">
					<img src="${board.image_url}" class="card-image" alt="image"
						style="width: 100%">
					<div class="container">
						<div style="float: right; color: #2478FF">${board.tag }</div>
						<div style="font-size: 20px;">제목:${board.title }</div>
						<div style="float: right;">${board.current_number }/${board.minimum_number }</div>
						<div>닉네임:${board.nickname }</div>
						<div style="float: right;">마감:${board.is_closed }</div>
						<div>내용:${board.content }</div>
						<div>등록일:${board.reg_date }</div>
						<div style="position: absolute; bottom: 0; left: 1;">조회수:${board.view_count }
							추천수:${board.vote_count }</div>
					</div>
>>>>>>> 3c43caefdb37bcfbfb31904abd97ca3b420a0de9
				</div>
			</c:forEach>
		</div>
		<!--section card -->
		<div>
			<a href="writeFormAB.jsp"><button class="write-button">글쓰기</button></a>
		</div>
		<div class="pagination">
<<<<<<< HEAD
			<a href="list.do?pageNum=${currentPage-5}">&laquo;</a> 						
			<a href="list.do?pageNum">&#9665</a>
			<a href="#" class="active">1</a> 
			<a href="#">2</a> 
			<a href="#">3</a> 
			<a href="#" >4</a> 
			<a href="#">5</a> 
			<a href="#">&#9655</a>
			<a href="#">&raquo;</a>
=======
			<c:if test="${startPage!=1 }">
				<a href='listAction.do?pageNum=${startPage-blockSize }'>&laquo;</a>
			</c:if>
			<c:if test="${startPage==1 }">
				<a href='listAction.do?pageNum=1'>&laquo;</a>
			</c:if>
			<c:if test="${currentPage!=1 }">
				<a href='listAction.do?pageNum=${currentPage-1}'>&#9665</a>
			</c:if>
			<c:if test="${currentPage==1 }">
				<a href='listAction.do?pageNum=1'>&#9665</a>
			</c:if>

			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<a href='listAction.do?pageNum=${i }'>${i }</a>
			</c:forEach>

			<c:if test="${currentPage==totalPage }">
				<a href='listAction.do?pageNum=${totalPage }'>&#9655</a>
			</c:if>
			<c:if test="${currentPage!=totalPage }">
				<a href='listAction.do?pageNum=${currentPage+1 }'>&#9655</a>
			</c:if>
			<c:if test="${endPage>=totalPage }">
				<a href='listAction.do?pageNum=${totalPage}'>&raquo;</a>
			</c:if>
			<c:if test="${endPage<totalPage }">
				<a href='listAction.do?pageNum=${endPage+blockSize }'>&raquo;</a>
			</c:if>
>>>>>>> 3c43caefdb37bcfbfb31904abd97ca3b420a0de9
		</div>

		<div class="search">
			<select class="search-select">
				<option>제목</option>
				<option>지역명</option>
				<option>닉네임</option>
				<option>날짜</option>
<<<<<<< HEAD
			</select>
			<input type="text" class="search-bar" placeholder="지금 바로 동행을 검색해보세요!">
			<button type="submit" id="search-submit" class="search-submit" onmouseover="replaceCard()">검색</button>
=======
			</select> <input type="text" class="search-bar" placeholder="지금 바로 동행을 검색해보세요!">
			<button type="submit" class="search-submit">검색</button>
>>>>>>> 3c43caefdb37bcfbfb31904abd97ca3b420a0de9
		</div>
	</div>
	<div class="footer_wrap">
		<%@ include file="footer.jsp"%>
	</div>
<<<<<<< HEAD
	</div>
	<script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
=======
>>>>>>> 3c43caefdb37bcfbfb31904abd97ca3b420a0de9
	<script type="text/javascript">
		var image = document.getElementById("center-image");
		var current = 0;
		var images = [ "images/korea2.jpg", "images/korea3.jpg",
				"images/korea4.jpg", "images/korea5.jpg", "images/korea1.jpg" ]

		function replacePhoto() {
			++current;
			if (current >= images.length)
				current = 0;
			image.src = images[current];
		}
		setInterval(replacePhoto, 3000);
		
		var submit = document.getElementByClassName("search-submit");
		function replaceCard(){
			submit.style.color="Orange";
		}
		
	</script>
</body>
</html>