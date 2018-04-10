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
				border-radius: 15px;
				width: 450px;
				margin: 0px auto;
				padding: 30px;
			}
			
			#previewImg {
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
		<script type="text/javascript" src="js/jQuery.js"></script>
		<script type="text/javascript">
		 function winop() {
			if (!frm.Nickname.value) {
				alert("닉네임을 입력해주세요.");
				frm.Nickname.focus();
				return false;
			} 
				window.open("myinfocheck.jsp?Nickname=" + frm.Nickname.value, "",
				"width=300 height=300");
			
		} 
		function chk() {
			if (frm.password.value != frm.password1.value) {
				alert("암호가 다릅니다");
				frm.password.focus();
				return false;
			}
			return true;
		}
		
		
		function previewFile(input){
		      var reader=new FileReader();
		      
		      reader.onload=function(event){
		         $('#previewImg').attr('src', event.target.result);
		      }
		      reader.readAsDataURL(input.files[0]);
		   }

		 

		</script>
	</head>
	<%request.setAttribute("email", session.getAttribute("email")); %>
	<body>
		<div id="center">
			<%@ include file="sidemenu.jsp" %>
			<div id="main">
				<h1>내 정보</h1>  
				<div id="myinfo">
					<div id="second">
						<form action="myInfoPro.do" name="frm" onsubmit="return chk()" id="secondbox" method="post" enctype="multipart/form-data">
						<div id="img_div">
								<img id="previewImg" alt="프로필 사진" src="${ memberdto.profile_url}"><br>
								<input type="file" name="profile_url" value="${ memberdto.profile_url}" onchange="preview(this)">
						</div>
						<table>
							<tr><td>이 메 일 : </td><td><input type="text" class="input" readonly="readonly" name="email" value="${memberdto.email }"></td><td></td></tr>
							<tr><td>닉 네 임 : </td><td><input type="text" class="input" required="required" name="Nickname" id="Nickname" value="${memberdto.nickname }" oninput="checkId()"></td>
													<td><input type="button" class="but" value="중복확인" id="nameclice" onclick="winop()"></td></tr>
							<tr><td>		   </td><td><span id="name_result"></span></td></tr>
							<tr><td>비밀번호 : </td><td><input type="password" class="input" required="required" name="password"></td><td></td></tr>
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