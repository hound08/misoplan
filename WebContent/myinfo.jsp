<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.*" errorPage="Error.jsp"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 정보</title>
<style type="text/css">
body {
	font-family: 'NanumSquareRound', sans-serif;
}

hr {
	margin-bottom: 15px;
}

table {
	width: 315px;
	text-align: left;
}

td {
	width: 200px;
	font-weight: bold; 
}

.td {
	width: 100px;
	font-size: 15px;
}

.tdEmail {
	font-weight: normal;
}

.tdPassword {
	width: 100px;
	vertical-align: bottom;
	padding-bottom: 6px;
	font-size: 15px;
}

.tdPasswordChk {
	width: 100px;
	vertical-align: top;
	padding-top: 8px;
	font-size: 15px;
}

.tdSubmit {
	text-align: center;
}

#center {
	margin: 0px auto;
	width: 1200px;
	height: 100%;
}

#main {
	background-color: #f0f0f0;
	width: 930px;
	text-align: center;
	float: left;
	margin-top: 20px;
	border-radius: 25px;
	padding-bottom: 20px;
}

#main h1 {
	margin: 20px 0px;
}

#second {
	background-color: #d7e4bd;
	border-radius: 5px;
	width: 450px;
	margin: 0px auto;
	padding: 30px;
}

#previewImg {
	border: 1px solid gray;
	width: 150px;
	height: 150px;
}

#secondbox table {
	margin: 0px auto;
	background-color: #d7e4bd
}

#secondbox table tr {
	height: 40px;
}

.input {
	width: 200px;
	height: 30px;
	margin-top: 15px;
	margin-bottom: 15px;
	margin-right: 0px;
}

#nickname {
	margin-bottom: 3px;
}

#spanNickname {
	font-size: 13px;
	font-weight: normal;
}

.password {
	width: 200px;
	height: 30px;
	margin-top: 15px;
	margin-bottom: 0px;
}

.passwordChk {
	width: 200px;
	height: 30px;
	margin-top: 0px;
	margin-bottom: 3px;
}

#spanPassword {
	font-size: 13px;
	color: red;
	font-weight: normal;
	margin-bottom: 15px;
}

.btn {
	margin-top: 15px;
	width: 305px;
	height: 40px;
	color: white;
	background-color: #1A7AD9;
	border-color: transparent;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	var myInfoComplete = true;

	$(function() {
		$('#nickname').change(function() {
			if (!frm.nickname.value || frm.nickname.value == "") {
				$('#spanNickname').html("　");
			} else if (frm.nickname.value != frm.nicknameOriginal.value) {
				var sendData = 'nickname=' + $('#nickname').val();
				
				$.post(
					'myinfocheck.jsp',
					sendData,
					function(result) {
						if (result.indexOf('이미') > 0) {
							$('#spanNickname').css('color', 'red');
							$('#spanNickname').html("※이미 사용중인 별명입니다.");
							$('#nickname').focus();
							myInfoComplete = false;
						} else {
							$('#spanNickname').html("※사용 가능한 별명입니다.");
							$('#spanNickname').css('color', 'green');
							myInfoComplete = true;
						}
				});
			} else {
				$('#spanNickname').html("　");
				myInfoComplete = true;
			}
		});
	});
	
	$(function() {
		$('#password').change(function() {
			$('#passwordChk').val("");
			$('#passwordChk').focus();
		});
	});
	
	$(function() {
		$('#passwordChk').change(function() {
			if ($('#password').val() != $('#passwordChk').val()) { 
				$('#passwordChk').val("");
				$('#passwordChk').focus();
				$('#spanPassword').html("※ 비밀번호가 일치하지 않습니다.");
				myInfoComplete = false;
				
				return;
			} else {
				myInfoComplete = true;
				$('#spanPassword').html("　");
			}
		});
	});

	function chk() {
		if (myInfoComplete == false) {
			alert("회원 정보 수정이 실패하였습니다.\n입력하신 정보를 다시 한번 확인해 보시기 바랍니다.");
			
			return false;
		}
		
		return true;
	}
</script>
</head>
<%
	request.setAttribute("email", session.getAttribute("email"));
%>
<body>
	<div id="center">
		<%@ include file="sidemenu.jsp"%>
		<div id="main">
			<h1>내 정보</h1>
			<div id="myinfo">
				<div id="second">
					<form action="myInfoPro.do" name="frm" onsubmit="return chk()" id="secondbox" method="post" enctype="multipart/form-data">
						<div id="img_div">
							<img id="previewImg" alt="프로필 사진" src="${ memberdto.profile_url}"><br>
							<table>
								<tr><td class="td">사진 변경</td><td><input type="file" name="profile_url" class="input"></td></tr>
							</table>
						</div>
						<hr color="gray" size="1px">
						<table>
							<tr><td class="td">계정명</td><td class="tdEmail">${memberdto.email }<input type="hidden" name="email" value="${memberdto.email }"><td></tr>
							<tr><td class="td">별명</td><td><input type="text" id="nickname" class="input" required="required" name="nickname" id="nickname" value="${memberdto.nickname }">
							<input type="hidden" id="nicknameOriginal" value="${memberdto.nickname }"><br>
							<span id="spanNickname">　</span><td></tr>
							<tr><td class="tdPassword"><p>새 비밀번호</td><td><input type="password" id="password" class="password" name="password"></td></tr>
							<tr><td class="tdPasswordChk">비밀번호 확인</td><td><input type="password" id="passwordChk" class="passwordChk" name="passwordChk">
							<span id="spanPassword">　</span></td></tr>
							<tr><td class="td">연락처</td><td><input type="tel" class="input" required="required" name="phone" value="${memberdto.phone }"></td></tr>
							<tr><td colspan="2" class="tdSubmit"><input type="submit" class="btn" value="정보 수정"></td></tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>