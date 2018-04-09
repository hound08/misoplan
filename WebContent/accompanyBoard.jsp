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
* {
	font-family: 'NanumSquareRound', sans-serif;
}
html, body, div, span, applet, object, iframes, h1, h2, h3, h4, h5, h6,
	p, blockquote, pre, a, abbr, acronym, address, big, quotes, code, del,
	dfn, em, img, ins, kbd, q, s, samp, small, strike, sub, sup, tt, var, u,
	i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table,
	caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	do: inherit;
	vertical-align: baseline;
}

article, aside, details, figcaption, figure, footer, header, hgroup,
	menu, nav, section {
	display: block;
}

blockquote, q {
	quotes: none;
}

blockquote : before, blockquote : after, q : before, q : after {
	content: '';
	content: none;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}
/*css 초기화*/

.card {
	height: 400px;
	width: 350px;
	border-radius: 15px;
	display: inline-block;
	margin-top: 30px;
	margin-left: 30px;
	margin-bottom: 30px;
	position: relative;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	overflow: hidden;
}

.card-header {
	-webkit-transition: 0.5s; /*사파리 & 크롬*/
    -moz-transition: 0.5s;  /*파이어폭스*/
    -ms-transition: 0.5s;	/*인터넷 익스플로러*/
    -o-transition: 0.5s;  /*오페라*/
    transition: 0.5s;
	width: 100%;
	height: 270px;
	border-radius: 15px 15px 0 0;
	background-size: 100% 280px;
	background-repeat: no-repeat;	
}

.card:hover .card-header  {
	opacity: 0.8;
	height: 100px;
}

.card-header-is_closed{
    background-color: #EF5A31 ;
    color: #FFF ;
    font-weight: bold ;
    text-align: center ;
    float: right;
    margin: 15px 15px 0 0;
    border-radius: 50%;
    font-weight: bold;
    padding: 10px 10px;
    line-height: 20px;
}

h1 {
    font-size: 22px;
    font-weight: bold;
}

.card-body {
	
}

.card-body-header{
	line-height: 25px;
	margin: 10px 20px 0px 20px;
}

.card-body-description  {
    opacity: 0;
    color: #757B82;
    line-height: 25px;
    -webkit-transition: .2s ease-in-out; /*사파리&크롬*/
    -moz-transition: .2s ease-in-out; /*파이어폭스*/
    -ms-transition: .2s ease-in-out; /*익스플로러*/
    -o-transition: .2s ease-in-out; /*오페라*/
    transition : .2s ease-in-out;
    overflow: hidden;
	height: 180px;
	margin: 5px 20px;
}

.card:hover .card-body-description {
    opacity: 1;
    -webkit-transition: .5s ease-in-out;
    -moz-transition: .5s ease-in-out;
    -ms-transition: .5s ease-in-out;
    -o-transition: .5s ease-in-out;
    transition : .5s ease-in-out;
    overflow: scroll;
}

.card-body-hashtag {
	color: #2478FF;
	font-style: italic;
}

.card-body-footer {
  	position: absolute; 
  	margin-top: 15px;
  	margin-bottom: 6px;
    bottom: 0; 
    width: 314px;
    font-size: 14px;
    color: #9FA5A8;
    padding: 0 15px;
}

.icon {
    display: inline-block;
    vertical-align: middle;
    margin-right: 2px;
}

.icon-view_count {
    width: 25px;
    height: 17px;
	background: url("images/eye.jpg") no-repeat;
}

.icon-comments_count {
	margin-left: 5px;
	width: 25px;
    height: 17px;
	background: url("images/comment.jpg") no-repeat;	
}

.reg_date {
	float: right;
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

.footer_wrap {
	margin-top: 600px;
	padding-top: 20px;
	margin-left: auto;
	margin-right: auto;
	margin-left: auto;
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
		
		<!--section card -->
		<div class="section-card">
		
			<c:forEach var="board" items="${list }">
			<div class="card">
				<!-- 카드 헤더 -->
				<div class="card-header" style="background: url('${board.image_url}');">
					<div class="card-header-is_closed">
						<c:if test="${board.is_closed == 0 }">
							<div class="card-header-text">모집중</div>
							<div class="card-header-number">${board.current_num } / ${board.minimum_num }</div>
						</c:if>
						<c:if test="${board.is_closed == 1 }">
							<div class="card-header-text">마감</div>
							<div class="card-header-number">${board.current_num } / ${board.minimum_num }</div>
						</c:if>
					</div>
				</div>
				<!--  카드 바디 -->
				<div class="card-body">
					<!--  카드 바디 헤더 -->
					<div class="card-body-header">
						<h1>${board.title }</h1>
						<p class="card-body-hashtag">${board.tag }</p>
						<p class="card-body-nickname">작성자: ${board.nickname }</p>
					</div>
					<!--  카드 바디 본문 -->
					<p class="card-body-description">${board.content }</p>
					<!--  카드 바디 푸터 -->
					<div class="card-body-footer">
						<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
						<i class="icon icon-view_count"></i>조회 ${board.view_count }회 
						<i class="icon icon-comments_count"></i>댓글 4개 
						<i class="reg_date"></i>${board.reg_date }
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
		
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
			</div>

			<div class="search">
				<select class="search-select">
					<option>제목</option>
					<option>지역명</option>
					<option>닉네임</option>
					<option>날짜</option>
				</select> 
				<input type="text" class="search-bar" placeholder="지금 바로 동행을 검색해보세요!">
				<button type="submit" id="search-submit" class="search-submit"">검색</button>
			</div>
		</div>
		<div class="footer_wrap">
			<%@ include file="footer.jsp"%>
		</div>
		
		<script type="text/javascript">
			var image = document.getElementById("center-image");
			var current = 0;
			var images = [ "images/korea2.jpg", "images/korea3.jpg",
					"images/korea4.jpg", "images/korea5.jpg",
					"images/korea1.jpg" ]

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