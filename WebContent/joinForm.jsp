<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
	body {
		font-family: 'NanumSquareRound', sans-serif;
	}
	
	div {
		margin: 0px auto;
	}
	
	.joinDiv {
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
	
	p {
		margin-top: 30px;
		margin-bottom: 30px;
	}
	
	h1 {
		margin-bottom: 50px;
	}
</style>
</head>
<body>
	<div class="header_wrap">
		<%@ include file="header.jsp"%>
	</div>
	<div class="joinDiv">
		<h1>회원가입</h1>
		<form action="joinPro.do" name="joinForm" method="post" enctype="multipart/form-data">
	  		<p>이메일 : <input type="email" name="email" required="required"></p>
			<p>별명 : <input type="text" name="nickname" required="required"></p>
			<p>비밀번호 : <input type="password" name="password" required="required"></p>
			<p>비밀번호 확인 : <input type="password" name="passwordChk" required="required"></p>
			<p>연락처 : <input type="tel" name="phone" required="required"></p>
			<p>프로필 사진 : <input type="file" name="profile_url"></p>
			<p><input type="submit" value="회원가입"></p>
		</form>
	</div>
	<div class="footer_wrap">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>