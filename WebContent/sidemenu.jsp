<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사이드 메뉴</title>
	<style type="text/css">
		*{ margin:0; padding:0; }
		li{ list-style:none; }
		a{ text-decoration:none;}
		img {vertical-align:bottom;}
		#sidemenu  {
				margin-top: 60px;
				background-color: #f0f0f0;
				border-radius: 25px;
				width: 200px;
				height: 630px;
				float: left;
				margin: 20px;
			}
		#sidemenu h1 {
				text-align: center;
				margin: 20px 10px 50px ;
			
			}
		#sidemenu .sidemenus{
				text-align: center;
				margin : 40px;
				font-size: 25px;
				
			}
		.sidemenus .a {
				color: black;
		}
		.sidemenus #b {
				color: blue;
		}
	</style>
</head>
<body>
	<div id="sidemenu">
		<ul>
			<h1>My Page</h1>
			<li class="sidemenus"><a href="myInfoForm.do?email=${email}" class="a">내정보</a></li>
			<li class="sidemenus"><a href="scheduleForm.do?email=${email }" class="a">내 계획</a></li>
			<li class="sidemenus"><a href="myWishList.jsp" class="a">찜 List</a></li>
			<li class="sidemenus" ><a href="companionForm.do?email=${email }" class="a">동행</a></li>
			<li class="sidemenus" ><a href="#" id="b" >관리자</a></li>
		</ul>
	</div>
</body>
</html>