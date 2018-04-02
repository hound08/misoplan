<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
 	/* border: 1px solid black; */
}

.main-top {
	width: 1200px;
	height: 300px;
	background-color: #F6F6F6;
	padding: 15px 0 0 0;
	border: 1px solid gray;
	
}
.main-top-second1 {
	width: 400px;
	height: 250px;
 	margin: 25px 0 0 35px; 
	border: 1px solid gray;
	display: inline-block;
}
.main-top-second2 {
	vertical-align: top;
	width: 630px;
	height: 250px;
 	margin: 25px 0 0 40px; 
	border: 1px solid gray;
	display: inline-block;
}
.main-second-box1{
	width: 610px;
	height: 25px;
	margin: 15px 0 0 5px;
	font-size: 10pt;
}
.main-second-box2{
	width: 610px;
	height: 30px;
	margin: 15px 0 0 5px;
}
.main-center {
	width: 1200px;
	height: 800px;
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
	margin: 0 0 5px 4px;
	border: 1px solid gray;
}
.card-box-bottom {
	width: 240px;
	height: 170px;
	overflow: auto;
	border: 1px solid gray;
}
.center-bottom-image {
	width: 1160px;
	height: 400px;
	padding: 0 0 0 0px;
}
.bottom-image {
	width: 300px;
	height: 380px;
	margin: 10px 15px;
	display: inline-block;
	border: 1px solid gray;
}
.bottom-text {
	width: 790px;
	height: 380px;
	margin: 10px 15px;
	display: inline-block;
	border: 1px solid gray;
}
</style>
</head>
<body>
	<div class="main-top">
		<div class="main-top-second1" align="left">
			<img alt="IMG" src="images/k1.jpg">
		</div>
		<div class="main-top-second2">
		<div class="main-second-box1">
			2018.04.02
		</div>
		<div class="main-second-box2">
			title
		</div>
		<div class="main-second-box1">
			여행지
		</div>
		<div class="main-second-box1">
			기간
		</div>
		<div class="main-second-box1">
			작성자
		</div>
		</div>
	</div>
	<div class="main-center">
		<div class="center-text">
			세부 일정
		</div>
			<div class="center-main-card">
				<div class="center-card-box">
					<div class="card-box-title">
						title
					</div>
					<div class="card-box-bottom">
						내 용
					</div>
				</div>
				<div class="center-card-box">
					<div class="card-box-title">
						title
					</div>
					<div class="card-box-bottom">
						내 용
					</div>
				</div>
				<div class="center-card-box">
					<div class="card-box-title">
						title
					</div>
					<div class="card-box-bottom">
						내 용
					</div>
				</div>
				<div class="center-card-box">
					<div class="card-box-title">
						title
					</div>
					<div class="card-box-bottom">
						내 용
					</div>
				</div>
				<div class="center-card-box">
					<div class="card-box-title">
						title
					</div>
					<div class="card-box-bottom">
						내 용
					</div>
				</div>
			</div>
		<div class="center-bottom-image">
			<div class="bottom-image">
				MAIN-IMG
			</div>
			<div class="bottom-text">
				TEXT
			</div>
		</div>
	</div>
	
	<%@ include file="footer.jsp"%>

</body>
</html>