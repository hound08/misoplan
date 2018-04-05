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
	padding-top: 100px;
	padding-bottom: 100px;
	width: 1080px;
	text-align: center;
}

.footer_wrap {
	position: absolute;
	left: 0px;
	width: 100%;
	background-color: #0099ff;
}

.pEmail {
	margin-bottom: 5px;
}

.inputType {
	width: 300px;
	height: 30px;
}

#submit {
	width: 300px;
	height: 40px;
	color: white;
	background-color: #1A7AD9;
	border-color: transparent;
}

#spanEmail {
	font-size: 13px;
}

#spanNickname {
	font-size: 13px;
}

.pNickname {
	margin-top: 15px;
	margin-bottom: 5px;
}

.pPassword {
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
			
			$.post(
				'joinCheck.jsp',
				sendData,
				function(result) {
					$('#spanEmail').html(result);
			});
		});
	});
	
	$(function() {
		$('#nickname').change(function() {
			var sendData = 'nickname=' + $('#nickname').val();
			
			$.post(
				'joinCheck.jsp',
				sendData,
				function(result) {
					$('#spanNickname').html(result);
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
			<p class="pEmail"><input type="email" id="email" name="email" class="inputType" required="required" placeholder="이메일"></p>
			<span id="spanEmail">　</span>
			<p class="pNickname"><input type="text" id="nickname" name="nickname" class="inputType" required="required" placeholder="별명 (최대 6글자)"></p>
			<span id="spanNickname">　</span>
			<p class="pPassword"><input type="password" name="password" class="inputType" required="required" placeholder="비밀번호"></p>
			<p><input type="tel" name="phone" class="inputType" required="required" placeholder="연락처"></p>
			<p><input type="file" name="profile_url" class="inputType"></p>
			<p><input type="submit" id="submit" value="회원가입"></p>
		</form>
	</div>
	<div class="footer_wrap">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>