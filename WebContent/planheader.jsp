<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

.header {
	width : 1080px;
	height : 75px;
	overflow : hidden
}
.image {
	whidth : 200px;
	height : 50px;
	float : left;
	padding : 0 0 0 45px;
	margin : 10px 80px 10px 0px;
	
}
.menu {
	float : left;
	width : 550px;
	hight : 50px;
	padding : 0px;
	margin : 15px 10px 0px 10px;
}
.menu-line {
	list-style-type: none;
	padding: 0px 20px;
}
.menu-line li{
	display: inline;
	padding: 0px;
	margin: 15px 20px;
}
.menu-line li a {
	font-family: 'NanumSquareRound', sans-serif;
	font-size: 17px;
	font-weight: bold;
	text-decoration: none;
	color: black;
}
.login {
	float: right;
	width: 100px;
	height: 50px;
	margin: 10px 5px 10px 0px;
}
.loginbutton {
	float: right;
	padding: 0px;
	margin: 10px 0px 20px 0px;
}
</style>
</head>
<body>
	<div class="header" id="planheader">
		<div class="image" onclick="location.href='main.jsp'">
		<img alt="image" src="images/111_cut-cutout2.png">
		<img alt="image1" src="images/paperplane-cutout2.png">
	</div>
	<div class="menu">
		<ul class="menu-line">
			<li><a href="###.jsp">관광지검색</a></li>
			<li><a href="###.jsp">일정만들기</a></li>
			<li><a href="###.jsp">일정게시판</a></li>
			<li><a href="###.jsp">동행구하기</a></li>
		</ul>
	</div>
	<div class="login">
		<div class="loginbutton" onclick="location.href='login.jsp'">
		<img alt="loginbutton" src="images/login-256.png">
		</div>
	</div>
	</div>

</body>
</html>