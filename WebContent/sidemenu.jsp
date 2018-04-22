<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>사이드 메뉴</title>
	<style type="text/css">
		*{ margin:0; padding:0; }
		li{ list-style:none; }
		img {vertical-align:bottom;}
		#sidemenu  {
				margin-top: 60px;
				background-color: #f0f0f0;
				border-radius: 25px;
				width: 200px;
				height: 550px;
				float: left;
				margin: 20px;
				padding-bottom: 35px;
			}
		#sidemenu .sidemenus{
				text-align: center;
				margin : 40px;
				font-size: 23px;
				
			}
		.sidemenus .a {
				color: black;
		}
		
		.list_admin {
			text-align: center;
			margin : 40px 40px 10px 40px;
			font-size: 25px;
		}
		.list_admin #b {
			color: blue;
		}
		.list_admin_sub {
			text-align: center;
			margin: 5px;
		}
		.list_admin_sub:HOVER {
			text-decoration: underline;
		}
	</style>
</head>
<body>
	<%
		MemberDao dao = MemberDao.getInstance();
		session.setAttribute("admin", dao.selectAdminChk((String)session.getAttribute("email")));
	%>
	<div id="sidemenu">
		<ul>
			<li class="sidemenus"><a href="myInfoConfirmForm.do?email=${email }" class="a">내 정보</a></li>
			<li class="sidemenus"><a href="scheduleForm.do?email=${email }" class="a">내 계획</a></li>
			<li class="sidemenus"><a href="myWishListForm.do?email=${email }" class="a">찜 리스트</a></li>
			<li class="sidemenus"><a href="companionForm.do?email=${email }" class="a">동행</a></li>
			<c:if test="${admin == 1}">
				<li class="list_admin"><a href="adminConfirmForm.do" id="b">관리자 메뉴</a></li>
				<ul>
					<li class="list_admin_sub"><a href="adminMainForm.do" id="a">회원 관리</a></li>
					<li class="list_admin_sub"><a href="adminSubjectForm.do" id="a">글 관리</a></li>
				</ul>
			</c:if>
		</ul>
	</div>
</body>
</html>