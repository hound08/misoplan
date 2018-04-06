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
	padding:0px;
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

.container{
	padding: 15px;
	height: 100%;
}

.card {
	height: 400px;
	width: 350px;
	border: solid;
	border-radius: 10px;
	border-color: #F6F6F6;
	display: inline-block;
	margin-left: 30px;
	margin-bottom: 30px
}

.card:hover{
	border-color: #A6A6A6
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

.pagination a:hover:not {
    background-color: #ddd;
    border-radius: 5px;
}

.card-image {
	width: 300px;
	height: 250px;
}

.search {
	display: inline-flex;
}

.search-bar{
	font-size: 15px;
	width: 400px;
	height: 30px;
}

.search-submit{
	font-size: 15px;
	width : 70px;
	background-color: #AA1212;
	color: white;
}

.search-select{
	font-size: 15px;
	margin-right: 5px;
}

.align{
	margin-top:30px;
	width:100%;
	margin-left: auto;
	margin-right: auto;
}
.align button{
	width: 100px;
	height: 30px;
}
.center-label{
	position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 30px
}

.write-button{
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
			<div class="center-label"><!-- 텍스트 ! --></div>
		</div>
		<div class="align">
			<button>조회순</button>
			<button>인기순</button>
			<button>최신순</button>
		</div>
		<div class="section-card">
			<c:forEach var="board" items="${list}">
				<div class="card">
				<c:if test="${board.image_url == '/J20180403/upload/null'}">
					<img src="images/plan.jpg" class="card-image" style="width: 100%">
				</c:if>
				<c:if test="${board.image_url != '/J20180403/upload/null'}">
					<img src="${board.image_url }" class="card-image" alt="image" style="width: 100%">
				</c:if>
					<div class="container">
						<div style="float: right; color:#2478FF ">${board.tag }</div>
						<div style="font-size: 20px;">제목:${board.title }</div>
						<div style="float: right;">${board.current_number }/${board.minimum_number }</div>
						<div>닉네임:${board.nickname }</div>
						<div style="float: right;">마감:${board.is_closed }</div>
						<div>내용:${board.content }</div>
						<div style="vertical-align: baseline;">조회수:${board.view_count } 추천수:${board.vote_count }</div>
						<div>등록일:${board.reg_date }</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!--section card -->
		<div>
			<a href="writeFormAB.jsp"><button class="write-button">글쓰기</button></a>
		</div>
		<div class="pagination">
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
			<a href='listAction.do?pageNum=${startPage }'>${startPage }</a> 
			<a href='listAction.do?pageNum=${startPage+1 }'>${startPage+1 }</a> 
			<a href='listAction.do?pageNum=${startPage+2 }'>${startPage+2 }</a> 
			<a href='listAction.do?pageNum=${startPage+3 }'>${startPage+3 }</a> 
			<a href='listAction.do?pageNum=${startPage+4 }'>${startPage+4 }</a> 
			
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
		</div>
		<div class="search">
			<select class="search-select">
				<option>제목</option>
				<option>지역명</option>
				<option>닉네임</option>
				<option>날짜</option>
			</select>
			<input type="text" class="search-bar" placeholder="지금 바로 동행을 검색해보세요!">
			<button type="submit" class="search-submit">검색</button>
		</div>
	</div>
	<div class="footer_wrap">
		<%@ include file="footer.jsp"%>
	</div>
	<script type="text/javascript">
		var image = document.getElementById("center-image");
		var current = 0;
		var images = [ "images/korea2.jpg", "images/korea3.jpg","images/korea4.jpg","images/korea5.jpg","images/korea1.jpg"]

		function replacePhoto() {
			++current;
			if (current >= images.length)
				current = 0;
			image.src = images[current];
		}

		setInterval(replacePhoto, 3000);
		
	</script>
</body>
</html>