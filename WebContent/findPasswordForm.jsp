<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style type="text/css">
	body {
		font-family: 'NanumSquareRound', sans-serif;
	}
	
	div {
		margin: 0px auto;
	}
	
	p {
		margin-top: 15px;
		margin-bottom: 15px;
	}
	
	h1 {
		margin-bottom: 50px;
	}
	
	.divForm {
		padding-top: 250px;
		padding-bottom: 150px;
		width: 300px;
		text-align: center;
	}
	
	.email {
		width: 226px;
		height: 30px;
		margin-right: 4px;
		margin-bottom: 5px;
	}
	
	.btnEmailChk {
		width: 70px;
		height: 30px;
		color: white;
		background-color: #1A7AD9;
		border-color: transparent;
	}
	
	.btnSubmit {
		width: 300px;
		height: 40px;
		color: white;
		background-color: #1A7AD9;
		border-color: transparent;
	}
	
	.footer_wrap {
		position: absolute;
		left: 0px;
		width: 100%;
		margin-top: 130px;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	var emailChk = false;
	var confirmNum = "";

	$(function() {
		$('#email').change(function() {
			var sendData = 'email=' + $('#email').val();
			
			$.post(
				'joinCheck.jsp',
				sendData,
				function(result) {
					if (result.indexOf('이미') < 0) {
						emailChk = false;
						$('#spanEmail').css('color', 'red');
						$('#spanEmail').html('※가입되지 않은 이메일 주소입니다.');
						$('#email').focus();
					} else {
						emailChk = true;
						$('#spanEmail').css('color', 'green');
						$('#spanEmail').html('※회원가입이 확인되었습니다.');
					}
			});
		});
	});
	
	function emailCheck(email){
		if (!formFindPassword.email.value) { 
			alert("이메일 주소를 입력하세요.");
			formFindPassword.email.focus();
			
			return;
		} else if(formFindPassword.email.value.indexOf('@') < 0 || formFindPassword.email.value.indexOf('.') < 0) {
			alert("이메일 주소가 올바르지 않습니다.");
			formFindPassword.email.focus();
			
			return;
		} else if (emailChk == false) {
			alert("가입되지 않은 이메일 주소입니다.");
			formFindPassword.email.focus();
			
			return;
		}
		
		alert("회원가입이 확인되었습니다.\n비밀번호 재설정을 진행하시면 해당 주소로 이메일이 발송됩니다.");
	}
	
	function newPasswordSend(email) {
		if (emailChk == false) {
			alert("회원 가입 여부가 확인되지 않았습니다.");
			
			return;
		}
		
		if (confirm("해당 이메일 주소로 새로운 비밀번호가 발송됩니다.\n계속 진행하시겠습니까?")) {
			var sendData = 'email=' + $('#email').val();

			$.post('newPasswordPro.jsp', sendData,
				function(result) {
					confirmNum = result.substr(result.indexOf("authNum:")+8, 18);
				});
						
				alert("임시 비밀번호가 발송되었습니다.\n반드시 새로운 비밀번호로 변경하시기 바랍니다.");
				location.href="loginForm.do";
		} else {
			alert("진행을 취소하셨습니다.");
			location.href="findPasswordForm.do";
		}
	}
</script>
</head>
<body>
	<div class="header_wrap">
		<%@ include file="header.jsp"%>
	</div>
	<div class="divForm">
		<form action="#" name="formFindPassword">
			<h1>비밀번호 찾기</h1>
			<input type="email" id="email" name="email" class="email" required="required" placeholder="가입한 이메일 주소"><input type="button" class="btnEmailChk" value="확인" onclick="emailCheck(formFindPassword.email.value)"><br>
			<span id="spanEmail" style="font-size: 13px">　</span>
			<p><input type="button" class="btnSubmit" value="비밀번호 재설정" onclick="newPasswordSend(formFindPassword.email.value)"></p>
		</form>
	</div>
	<div class="footer_wrap">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>