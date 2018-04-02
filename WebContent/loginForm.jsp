<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
	body {
		font-family: 'NanumSquareRound', sans-serif;
	}
	
	div {
		margin: 0px auto;
	}
	
	.loginForm {
		padding-top: 200px;
		padding-bottom: 200px;
		width: 1080px;
		text-align: center;
	}
	
	.footer_wrap {
		position: absolute;
		left: 0px;
		width: 100%;
		margin-top: 50px;
		background-color: #0099ff;
	}
</style>
</head>
<body>
	<div class="header_wrap">
		<%@ include file="header.jsp"%>
	</div>
	<div class="loginForm">
		<form action="loginPro.do">
			<h2>로그인</h2><br>
			<p>이메일 : <input type="text" name="email" required="required"></p><br>
			<p>비밀번호 : <input type="password" name="password" required="required"></p><br>
			<p><input type="submit" value="로그인"></p>
		</form>
	</div>
	<div class="footer_wrap">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>