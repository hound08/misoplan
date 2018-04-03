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
<title>Insert title here</title>
<style type="text/css">
	  *{ margin:0; padding:0; }
      li{ list-style:none; }
      a{ text-decoration:none;}
      a:hover{text-decoration:underline; text-decoration: none; }
      img {vertical-align:bottom;}

.header {
	width: 100%;
	height: 50px;
	overflow: hidden;
	margin: 5px auto;
	display: inline-block;
/*	border:solid;  
	border-color: #EAEAEA;
	border-width: 2px;	*/
}

.logo {
	width: 180px;
	height: 100%;
	float: left;
/*	border-right: solid;
	border-color: #EAEAEA;
	border-width: 2px;
	margin-right: 90px;	*/
}

.logo_image{
	float: right;
	cursor: pointer;
}

.category {
	width: 800px; 
	height: 50px;
	padding: 0px auto;
	margin-top: auto;
	margin-bottom: auto;
	display: flex;
	float: left;
	align-items: center;
}

.login {
/*	border-left:solid;
	border-color: #EAEAEA;
	border-width: 2px;	*/
	width: 260px; 
	height: 50px;
	display: flex;
	align-items:center;
	float: right;
}

.login_label {
    vertical-align:middle;
    text-decoration: none;
    font-size: 15px;
    cursor: pointer;
    margin-left: 20px;
}

.login_label:hover{
	color: #47C83E
}

.category-menu {
	list-style-type: none;
	padding-left: 90px;
}

.category-menu li {
	display: inline;
	padding: 0px;
	margin-right: 30px;
}

.category-menu li a {
	font-family: 'NanumSquareRound', sans-serif;
	font-size: 19px;
	font-weight: bold;
	text-decoration: none;
	color: black;
	align-content: center;
}

.myInfo {
	margin-left: 10px;
	margin-right: 10px;
}

.logout {
	margin-right: 10px;
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
				<li><a href="search.jsp"><img src="images/category1.png" align="middle" class="category-image"></a></li>
				<li><a href="makePlan.do"><img src="images/category2.png" align="middle" class="category-image"></a></li>
				<li><a href="boardschedule.do"><img src="images/category3.png" align="middle" class="category-image"></a></li>
				<li><a href="accompanyBoard.jsp"><img src="images/category4.png" align="middle" class="category-image"></a></li>
			</ul>
		</div>
		<%
			if (session.getAttribute("email") == null) {	%>
				<div class="login">
					<div class="loginlabel">
						<a href="loginForm.do" class="login_label">로그인</a>
						<a href="joinForm.do" class="login_label">회원가입</a>
					</div>
				</div>	<%
			} else if (session.getAttribute("email") != null) {	%>
				<div class="login">
					<p class="welcome"><a href="myInfoForm.do"><% out.println(session.getAttribute("email")); %>님 환영합니다!</a></p>
					<p class="myInfo"><input type="button" value="정보수정" onclick="location.href='myInfoForm.do'"></p>
					<p class="logout"><input type="button" value="로그아웃" onclick="location.href='logoutPro.do'"></p>
				</div>	<%
			}
		%>
	</div>
</body>
</html>