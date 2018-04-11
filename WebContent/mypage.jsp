<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*" errorPage="Error.jsp"%>
   <%@ include file="header.jsp" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		html{
			height: 100%;
			width: 100%;
		}
		body{
			font-family: 'NanumSquareRound', sans-serif;
			height: 100%;
			width: 100%;
		}
		#main {
			width: 1200px;
			margin: 0 auto;
		}
		#main div{
			float: left;
		}
		#myinfo{
			width: 690px;
			height: 400px;
			background-image: url("images/3.jpg");
		}
		#myinfoa {
			margin: 80px 0px 0px 50px;
		}
		/* ##myinfoa.a:hover{
			color : #1e68cb;
			letter-spacing: 0.1em;
			text-decoration:none;
		} */
		#schedule{
			width: 490px;
			height: 400px;
			background-image: url("images/3.jpg");
		}
		#schedulea {
			margin: 80px 0px 0px 50px;
		}
		#myWishlist{
			width: 490px;
			height: 400px;
			background-image: url("images/3.jpg");
		}
		#myWishlista{
			margin: 80px 0px 0px 50px;
		}
		#companion{
			width: 690px;
			height: 400px;
			background-image: url("images/3.jpg");
		}
		#companiona{
			margin: 80px 0px 0px 50px;
		}
		.menu {
			font-size: 19px;
			padding: 10px;
			border-radius: 10px;
			color : white;
			background-color:  #1e68cb;
		}
		 a:hover{
			color: #1e68cb;
			background-color: white;
		}
	</style>
</head>
<body>
	<div id="main">
			<div id="myinfo" background="images/03.jpg">
				<div id="myinfoa">
					<a href="myInfoConfirmForm.do?email=${email}" class="menu"> 개인 정보 수정 </a>
				</div>
			</div>
			<div id="schedule">
				<div id="schedulea">
					<a href="scheduleForm.do?email=${email }" class="menu"> 내 계획 </a>
				</div>
			
			</div>
			<div id="myWishlist">
				<div id="myWishlista">
					<a href="myWishList.jsp" class="menu"> 찜 List </a>
				</div>
			</div>
			<div id="companion">
				<div id="companiona">
					<a href="companionForm.do?email=${email }" class="menu"> 동행 </a>
				</div>
			</div>
		
			<!-- <img alt="myinfo" src="images/03.jpg" id="myinfo">
			<img alt="schedule" src="images/03.jpg" id="schedule">
			<img alt="myWishlist" src="images/03.jpg" id="myWishlist">
			<img alt="companion" src="images/03.jpg" id="companion"> -->
		
	</div>
</body>
</html>