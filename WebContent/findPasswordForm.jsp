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
		width: 1080px;
		text-align: center;
	}
	
	.email {
		width: 225px;
		height: 30px;
		margin-right: 4px;
	}
	
	.btnEmailChk {
		width: 70px;
		height: 30px;
		color: white;
		background-color: #1A7AD9;
		border-color: transparent;
	}
	
	.inputConfirm {
		width: 225px;
		height: 30px;
		margin-right: 4px;
		margin-bottom: 5px;
	}
	
	.btnConfirm {
		width: 70px;
		height: 30px;
		border-color: transparent;
	}
	
	#password {
		width: 300px;
		height: 30px;
		margin-bottom: 2px;
	}
	
	#passwordChk {
		width: 300px;
		height: 30px;
	}
	
	.btnSubmit {
		width: 300px;
		height: 40px;
		color: white;
		background-color: #1A7AD9;
		border-color: transparent;
		margin-top: 15px;
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
						$('#spanEmail').html('※가입되지 않은 이메일 주소입니다.');
						$('#email').focus();
					} else {
						emailChk = true;
						$('#spanEmail').html('　');
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
		
		formFindPassword.btnConfirm.value = "확인";
		$("#inputConfirm").prop('disabled', false);
		$("#btnConfirm").prop('disabled', false);
		$("#btnConfirm").css('color', 'white');
		$("#btnConfirm").css('background-color', '#1A7AD9');
		
		var sendData = 'email=' + $('#email').val();
		
		if (confirm("해당 이메일로 임시 비밀번호가 발송됩니다.\n계속 진행하시겠습니까?")) {
			$.post(
				'emailCheck.jsp',
				sendData,
				function(result) {
					confirmNum = result.substr(result.indexOf("authNum:")+8, 6);
			});
			
			alert("임시 비밀번호가 발송되었습니다.\n반드시 새로운 비밀번호로 변경하시기 바랍니다.");
		} else {
			alert("진행을 취소하셨습니다.");
			location.href="findPasswordForm.do";
		}
	}
	
	$(function() {
		$('#btnConfirm').click(function() {
			if (!formFindPassword.inputConfirm.value) { 
				alert("인증번호를 입력해주세요.");
				formFindPassword.inputConfirm.focus();
				
				return;
			}
			
			confirmEmail(formFindPassword.inputConfirm.value, confirmNum);
		});
	});
	
	function confirmEmail(emailconfirm_value, authNum){
		if(!emailconfirm_value || emailconfirm_value != authNum){	// 인증코드가 일치하지 않을 경우
			alert("인증번호가 일치하지 않습니다!");
			formFindPassword.inputConfirm.value = "";
			formFindPassword.inputConfirm.focus();
		} else if(emailconfirm_value == authNum){	// 일치할 경우
			alert("인증에 성공하였습니다.");
			formFindPassword.btnConfirm.value = "인증완료";
			$("#inputConfirm").prop('disabled', true);
			$("#btnConfirm").prop('disabled', true);
			$("#btnConfirm").css('color', '#808080');
			$("#btnConfirm").css('background-color', '#DDDDDD');
			
			$('#password').prop('disabled', false);
			$('#passwordChk').prop('disabled', false);
			$('#password').focus();
		}
		
		return;
	}
	
	function chk() {
		if (formFindPassword.btnConfirm.value.indexOf("인증완료") < 0) {
			alert("이메일 인증이 처리되지 않았습니다.");
			formFindPassword.email.focus();
			
			return false;
		}
	}
</script>
</head>
<body>
	<div class="header_wrap">
		<%@ include file="header.jsp"%>
	</div>
	<div class="divForm">
		<form action="#" name="formFindPassword" onsubmit="return chk()">
			<h1>비밀번호 찾기</h1>
			<input type="email" id="email" name="email" class="email" required="required" placeholder="가입한 이메일 주소"><input type="button" class="btnEmailChk" value="인증하기" onclick="emailCheck(formFindPassword.email.value)"><br>
			<input type="text" id="inputConfirm" name="inputConfirm" class="inputConfirm" required="required" placeholder="인증번호 입력" disabled="disabled"><input type="button" id="btnConfirm" name="btnConfirm" class="btnConfirm" value="확인" disabled="disabled"><br>
			<span id="spanEmail" style="font-size: 13px; color: red">　</span>
			<p>
				<input type="password" id="password" required="required" placeholder="새로운 비밀번호 입력" disabled="disabled"><br>
				<input type="password" id="passwordChk" required="required" placeholder="비밀번호 확인" disabled="disabled">
			</p>
			<p><input type="submit" class="btnSubmit" value="비밀번호 재설정"></p>
		</form>
	</div>
	<div class="footer_wrap">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>