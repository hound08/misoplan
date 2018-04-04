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

.pEmail {
	margin-bottom: 5px;
}

#spanEmail {
	font-size: 13px;
}

.pNickname {
	margin-top: 15px;
}

p {
	margin-top: 30px;
	margin-bottom: 30px;
}

h1 {
	margin-bottom: 50px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#email').change(function() {
			var sendData = 'email=' + $('#email').val();
			$.post('joinCheck.jsp', sendData, function(result) {
				$('#spanEmail').html(result);
			});
		});
	});
</script>
</head>
<body>
	<div class="header_wrap">
		<%@ include file="header.jsp"%>
	</div>
	<div class="joinDiv">
		<h1>회원가입</h1>
		<form action="joinPro.do" name="joinForm" method="post" enctype="multipart/form-data">
			<p class="pEmail">이메일 : <input type="email" id="email" name="email" required="required"></p>
			<span id="spanEmail">　</span>
			<p class="pNickname">별명 : <input type="text" name="nickname" required="required"></p>
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