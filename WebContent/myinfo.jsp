<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*" errorPage="Error.jsp"%>
   <%@ include file="header.jsp" %>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>내 정보</title>
		
		<style type="text/css">
			#center {
				border: 1px solid red;
				margin: 0px auto;
				width: 1000px;
				height: 100%;
			}
			
			#main {
					width: 730px;
					border: 3px solid green;
					text-align: center;
					float: left;
					margin-top: 20px;
				}
			#main h1 {
					margin: 20px 0px;
			}
			#second {
				background-color: #d7e4bd;
				border: 1px solid green;
				border-radius: 15px;
				width: 450px;
				margin: 0px auto;
				padding: 30px;
			}
			
			#img {
				margin: 0px auto;
				border: 1px solid red;
				width: 100px;
				height: 100px;
			}
			#img input {
			
			}
			#secondbox table{
				margin: 0px auto;
				background-color:  #d7e4bd
				
				}
			#secondbox table tr {
				height: 40px;
				}
				
			.input {
				border-radius :10px;
			}
		</style>
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript">
		/* 	function nameclick() {
				if(!frm.Nickname.value){
					alert(" 닉네임을 입력해주세요.")
					frm.Nickname.focus();
					return false;
				}
				if(frm.Nickname.value){
					window.open("confirmId.jsp?id="+ frm.id.value, "", "width=300 height=300");
				}
			} */

			$(function(){
				$('#name_check').blur(function(){
					$.ajax({
						type:"post",
						url:"myinfocheck.jsp",
						data:{
							"name_check":$('#name_check').val()
						},
						success:function(data){
							if($trim(data)== "YES"){
								//alert('사용가능');
								$('#name_result').html('<b style="font-size:18px; color:blue">사용가능.</b>')
							}else{
								//alert('사용불가');
								$('#name_result').html('<b style="font-size:18px; color:red">사용불가.</b>')

							}
						}
					});
				});
			});
		
		
		</script>
	</head>
	<body>
		<div id="center">
			<%@ include file="sidemenu.jsp" %>
			<div id="main">
				<h1>내 정보</h1>
				<div id="myinfo">
					<div id="second">
						<form action="myInfoPro.do" name="frm" id="secondbox">
						<div id="img_div">
								<img id="img" alt="프로필 사진" src="${memberdto.profile_url }">
						</div>
						<table>
							<tr><td>이 메 일 : </td><td><input type="text" class="input" readonly="readonly" name="email" value="${memberdto.email }"></td><td></td></tr>
							<tr><td>닉 네 임 : </td><td><input type="text" class="input" required="required" name="Nickname" id="name_check" value="${memberdto.nickname }"></td>
													<td><input type="button" class="but" value="중복확인" id="nameclice" onclick="nameclick()"></td></tr>
							<tr><td>		   </td><td><span id="name_result"></span></td></tr>
							<tr><td>비밀번호 : </td><td><input type="password" class="input" required="required" name="password" value="${memberdto.password }"></td><td></td></tr>
							<tr><td>비밀번호 확인 : </td><td><input type="password" class="input" required="required" ></td><td></td></tr>
							<tr><td>핸드폰 번호 : </td><td><input type="tel" class="input" required="required" name="phone" value="${memberdto.phone }"></td><td></td></tr>
							<tr></tr>
							<tr><td></td><td><input type="submit" class="but" value="정보 수정"> 
											 <input type="button" value="회원탈퇴"></td><td></td></tr>		
						</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>