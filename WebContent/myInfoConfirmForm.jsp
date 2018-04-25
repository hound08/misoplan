<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<meta charset="UTF-8">
<title>계정 확인</title>
<style type="text/css">
	body {
		font-family: 'NanumSquareRound', sans-serif;
	}
	
	#center {
		margin: 0px auto;
		width: 1200px;
		height: 100%;
	}
	
	#main {
		width: 930px;
		text-align: center;
		float: left;
		margin-top: 20px;
		padding-bottom: 20px;
	}
	
	h1 {
		margin-top: 50px;
		margin-bottom: 20px;
	}
	
	h4 {
		margin-bottom: 40px;
	}
	
	#password {
		margin: 15px;
		width: 300px;
		height: 30px;
	}
	
	.submit {
		width: 300px;
		height: 40px;
		color: white;
		background-color: #1A7AD9;
		border-color: transparent;
		margin-bottom: 50px;
	}
	
</style>
</head>
<body>
	<% String email = (String)session.getAttribute("email"); %>
	
	<div id="center">
		<%@ include file="sidemenu.jsp"%>
		<div id="main">
			<form name="form" action="myInfoConfirmPro.do">
				<h1>계정 정보 확인</h1>
				<h4>개인 정보 보안을 위해 계정 비밀번호를 입력해 주시기 바랍니다.</h4>
				<input type="hidden" name="email" value="<%=email %>">
				<p><input type="password" id="password" name="password" required="required" placeholder="비밀번호 입력"></p>
				<p><input type="submit" class="submit" value="확인"></p>
			</form>
		</div>
	</div>
</body>
</html>