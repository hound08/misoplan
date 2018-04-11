<%@page import="dao.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>미소플랜</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
}

a:VISITED {
	color: black;
}

.header {
	width: 1080px;
	height: 50px;
	margin: 0px auto;
	/*	border:solid;  
	border-color: #EAEAEA;
	border-width: 2px;	*/
}

.logo {
	display: inline-block;
	left: 0px;
	width: 170px;
	cursor: pointer;
	/*	border-right: solid;
	border-color: #EAEAEA;
	border-width: 2px;
	margin-right: 90px;	*/
}

.category {
	display: inline-block;
	width: 620px;
	margin-left: 25px;
	vertical-align: top;
}

.memberImageDiv {
	display: inline-block;
	width: 40px;
	height: 40px;
	margin-top: 5px;
	margin-left: 25px;
	vertical-align: top;
}

.memberImage	{
	width: 40px;
	height: 40px;
}

.login_on {
	/*	border-left:solid;
	border-color: #EAEAEA;
	border-width: 2px;	*/
	display: inline-block;
	width: 180px;
	height: 45px;
	margin-top: 5px;
	vertical-align: top;
	text-align: left;
	white-space: nowrap;
}

.login_off {
	/*	border-left:solid;
	border-color: #EAEAEA;
	border-width: 2px;	*/
	padding-top: 15px;
	margin-left: 90px;
	display: inline-block;
	width: 160px;
	height: 35px;
	vertical-align: top;
	text-align: center;
}

.login_label {
	height: 50px;
	vertical-align: middle;
	text-decoration: none;
	font-size: 15px;
	cursor: pointer;
	margin-left: 14px;
	margin-right: 14px;
}

.login_label:HOVER {
	color: #47C83E;
}

.category-menu {
	list-style-type: none;
}

.category-menu li {
	display: inline;
	margin-left: 10px;
	margin-right: 10px;
}

.category-menu li a {
	font-family: 'NanumSquareRound', sans-serif;
	font-size: 19px;
	font-weight: bold;
	text-decoration: none;
	color: black;
}

.btnMyInfo {
	width: 70px;
	height: 22px;
	color: white;
	background-color: #49B2E9;
	border-color: transparent;
}

.btnLogout {
	width: 70px;
	height: 22px;
	color: white;
	background-color: #49B2E9;
	border-color: transparent;
}

</style>
</head>
<body>
	<div class="header" id="header1">
		<div class="logo" onclick="location.href='main.do'">
			<img alt="logo" src="images/logo.png" class="logo_image"> 
		</div>
		<div class="category">
			<ul class="category-menu">
				<li><a href="search.do"><img src="images/category1.png" align="middle" class="category-image"></a></li>
				<li><a href="makePlan.do"><img src="images/category2.png" align="middle" class="category-image"></a></li>
				<li><a href="boardschedule.do"><img src="images/category3.png" align="middle" class="category-image"></a></li>
				<li><a href="listAction.do"><img src="images/category4.png" align="middle" class="category-image"></a></li>
			</ul>
		</div>
		<%
			if (session.getAttribute("email") == null) {	%>
				<div class="login_off">
					<div class="loginlabel">
						<a href="loginForm.do" class="login_label">로그인</a>
						<a href="joinForm.do" class="login_label">회원가입</a>
					</div>
				</div>	<%
			} else if (session.getAttribute("email") != null) {	%>
				<div class="memberImageDiv">
					<img class="memberImage" alt="회원 사진" src="${profile_url }">
				</div>
				<div class="login_on">
					<p class="welcome"><strong>${nickname }</strong>님 환영합니다!</p>
					<p class="buttons"><input type="button" class="btnMyInfo" value="정보수정" onclick="location.href='myInfoConfirmForm.do?email=${email}'">
					<input type="button" value="로그아웃" class="btnLogout" onclick="location.href='logoutPro.do'"></p>
				</div>	<%
			}
		%>
	</div>
</body>
</html>