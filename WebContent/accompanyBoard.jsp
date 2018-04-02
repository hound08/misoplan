<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
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
	height: 1000px;
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
	display: flex;
	justify-content: space-between;
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
	padding-top: 20px; margin-left : auto;
	margin-right: auto;
	margin-left: auto;
}
.container{
	padding: 15px;
}

.card {
	height: 400px;
	width: 350px;
	border: solid 2px;
	border-radius: 10px;
	border-color: #F6F6F6;
	position: relative;
	overflow: hidden;
}

.card:hover{
	border-color: #A6A6A6
}

.card p{
	color:#747474;
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

.card-image {
	width: 300px;
	height: 250px;
}

.search {
 	display: flex;
    justify-content: center;
	width :500px;
}

.search-bar{
	font-size: 15px;
	width: 100%;
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
			<div class="card">
				<img src="images/plan.jpg"  class="card-image" alt="1"
					style="width: 100%">
				<div class="container">
					<h3>
						<b>동행 구합니다.</b>
					</h3>
					<p>동행당구합니다구합니다구합니다구합니다구합니다구합니다구합니다구합니다구합니다구합니다구합니다구합니다구합니다구합니다구합니다구합니다구합니다구합니다구합니다구합니다구합니다구합니다.</p>
				</div>
			</div>
			<div class="card">
				<img src="images/search.jpg" class="card-image" alt="2"
					style="width: 100%">
				</figure>
				<div class="container">
					<h3>
						<b>동행 구합니다.</b>
					</h3>
					<p>동행구합니당.</p>
				</div>
			</div>
			<div class="card">
				<img src="images/accompany.jpg" class="card-image" alt="3"
					style="width: 100%">
				<div class="container">
					<h3>
						<b>동행 구합니다.</b>
					</h3>
					<p>동행구합니당.</p>
				</div>
			</div>
		</div>
		<!--section card -->
		<div class="section-card">
			<div class="card">
				<img src="images/accompany.jpg" class="card-image" alt="4"
					style="width: 100%">
				<div class="container">
					<h3>
						<b>동행 구합니다.</b>
					</h3>
					<p>동행구합니당.</p>
				</div>
			</div>
			<div class="card">
				<img src="images/accompany.jpg" class="card-image" alt="5"
					style="width: 100%">
				<div class="container">
					<h3>
						<b>동행 구합니다.</b>
					</h3>
					<p>동행구합니당.</p>
				</div>
			</div>
			<div class="card">
				<img src="images/accompany.jpg" class="card-image" alt="6"
					style="width: 100%">
				<div class="container">
					<h3>
						<b>동행 구합니다.</b>
					</h3>
					<p>동행구합니당.</p>
				</div>
			</div>
		</div>
<!--section card -->
		<div>
			<a href="writeFormAB.jsp"><button class="write-button">글쓰기</button></a>
		</div>
		<div class="pagination">
			<a href="#">&laquo;</a> 
			<a href="#" class="active">1</a> 
			<a href="#">2</a> 
			<a href="#">3</a> 
			<a href="#" >4</a> 
			<a href="#">5</a> 
			<a href="#">&raquo;</a>
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