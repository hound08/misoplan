<%@page import="email.EmailConfirm"%>
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
	width: 300px;
	text-align: center;
}

.footer_wrap {
	position: absolute;
	left: 0px;
	width: 100%;
}

.divEmail {
	width: 300px;
	margin-bottom: 5px;
}

.inputTypeEmail {
	width: 225px;
	height: 30px;
}

.btnEmailChk {
	width: 70px;
	height: 30px;
	color: white;
	background-color: #1A7AD9;
	border-color: transparent;
}

.confirmCode {
	width: 225px;
	height: 30px;
	margin-right: 4px;
}

.btnConfirm {
	width: 70px;
	height: 30px;
	border-color: transparent;
}

.inputType {
	width: 300px;
	height: 30px;
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

.divPassword {
	margin-top: 15px;
}

.password {
	width: 300px;
	height: 30px;
	margin-bottom: 1px;
}

.passwordChk {
	width: 300px;
	height: 30px;
	margin-bottom: 5px;
}

#spanPassword {
	color: red;
	font-size: 13px;
}

.pPhone {
	margin-top: 15px;
}

.divProfile {
	border: 1px solid #A9A9A9;
	width: 298px;
	text-align: left;
}

#submit {
	width: 300px;
	height: 40px;
	color: white;
	background-color: #1A7AD9;
	border-color: transparent;
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
	var confirmNum = "";

	$(function() {
		$('#email').change(function() {
			var sendData = 'email=' + $('#email').val();
			
			$.post(
				'joinCheck.jsp',
				sendData,
				function(result) {
					$('#spanEmail').html(result);
					
					if (result.indexOf('이미') > 0) {
						$('#email').val("");
						$('#email').focus();
					}
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
					
					if (result.indexOf('이미') > 0) {
						$('#nickname').val("");
						$('#nickname').focus();
					}
			});
		});
	});
	
	function emailCheck(email){
		if (!joinForm.email.value) { 
			alert("이메일 주소를 입력하세요.");
			joinForm.email.focus();
			
			return;
		} else if(joinForm.email.value.indexOf('@') < 0 || joinForm.email.value.indexOf('.') < 0) {
			alert("이메일 주소가 올바르지 않습니다.");
			joinForm.email.focus();
			
			return;
		}
		
		joinForm.btnConfirm.value = "확인";
		$("#confirmCode").prop('disabled', false);
		$("#btnConfirm").prop('disabled', false);
		$("#btnConfirm").css('color', 'white');
		$("#btnConfirm").css('background-color', '#1A7AD9');
		
		var sendData = 'email=' + $('#email').val();
		
		$.post(
			'emailConfirmPro.jsp',
			sendData,
			function(result) {
				confirmNum = result.substr(result.indexOf("authNum:")+8, 6);
		});
		
		alert("해당 이메일로 인증번호가 발송되었습니다.");
	}
	
	$(function() {
		$('#btnConfirm').click(function() {
			if (!joinForm.confirmCode.value) { 
				alert("인증번호를 입력해주세요.");
				joinForm.confirmCode.focus();
				
				return;
			}
			
			confirmEmail(joinForm.confirmCode.value, confirmNum);
		});
	});
	
	function confirmEmail(emailconfirm_value, authNum){
		if(!emailconfirm_value || emailconfirm_value != authNum){	// 인증코드가 일치하지 않을 경우
			alert("인증번호가 일치하지 않습니다!");
			joinForm.confirmCode.value = "";
			joinForm.confirmCode.focus();
		} else if(emailconfirm_value == authNum){	// 일치할 경우
			alert("인증에 성공하였습니다.");
			joinForm.btnConfirm.value = "인증완료";
			$("#confirmCode").prop('disabled', true);
			$("#btnConfirm").prop('disabled', true);
			$("#btnConfirm").css('color', '#808080');
			$("#btnConfirm").css('background-color', '#DDDDDD');
		}
		
		return;
	}
	
	$(function() {
		$('#passwordChk').change(function() {
			if ($('#password').val() != $('#passwordChk').val()) { 
				$('#passwordChk').val("");
				$('#passwordChk').focus();
				$('#spanPassword').html("※ 비밀번호가 일치하지 않습니다.");
				
				return;
			} else {
				$('#spanPassword').html("　");
			}
		});
	});
	
	function chk() {
		if (joinForm.btnConfirm.value.indexOf("인증완료") < 0) {
			alert("이메일 인증이 처리되지 않았습니다.");
			joinForm.email.focus();
			
			return false;
		}
	}
</script>
</head>
<body>
	<% String userIp = request.getRemoteAddr(); %>
	<div class="header_wrap">
		<%@ include file="header.jsp"%>
	</div>
	<div class="joinDiv">
		<h1>회원가입</h1>
		<form action="joinPro.do" name="joinForm" method="post" enctype="multipart/form-data" onsubmit="return chk()">
			<div class="divEmail">
				<input type="email" id="email" name="email" class="inputTypeEmail" required="required" placeholder="이메일">
				<input type="button" name="btnEmailChk" class="btnEmailChk" value="인증하기" onclick="emailCheck(joinForm.email.value)"><br>
				<input type="text" id="confirmCode" name="confirmCode" class="confirmCode" placeholder="인증번호" disabled="disabled"><input type="button" id="btnConfirm" name="btnConfirm" class="btnConfirm" value="확인" disabled="disabled">
			</div>
			<span id="spanEmail">　</span>
			<div class="divPassword">
				<input type="password" id="password" name="password" class="password" required="required" placeholder="비밀번호"><br>
				<input type="password" id="passwordChk" name="passwordChk" class="passwordChk" required="required" placeholder="비밀번호 확인"><br>
				<span id="spanPassword">　</span>
			</div>
			<p class="pNickname"><input type="text" id="nickname" name="nickname" class="inputType" required="required" placeholder="별명 (최대 6글자)"></p>
			<span id="spanNickname">　</span>
			<p class="pPhone"><input type="tel" name="phone" class="inputType" required="required" placeholder="연락처"></p>
			<h3>프로필 사진</h3>
			<div class="divProfile">
				<input type="file" name="profile_url" class="inputFile">
			</div>
			<p><input type="submit" id="submit" value="회원가입"></p>
			<input type="hidden" name="ip_address" value="<%=userIp%>">
		</form>
	</div>
	<div class="footer_wrap">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>