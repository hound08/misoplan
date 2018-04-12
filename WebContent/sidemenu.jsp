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
	<%
		MemberDao dao = MemberDao.getInstance();
		session.setAttribute("admin", dao.selectAdminChk(request.getParameter("email")));
	%>
	<div id="sidemenu">
		<ul>
			<li class="sidemenus"><a href="myInfoConfirmForm.do?email=${email}" class="a">내 정보</a></li>
			<li class="sidemenus"><a href="scheduleForm.do?email=${email }" class="a">내 계획</a></li>
			<li class="sidemenus"><a href="myWishList.jsp" class="a">찜 리스트</a></li>
			<li class="sidemenus"><a href="companionForm.do?email=${email }" class="a">동행</a></li>
			<c:if test="${admin == 1}">
				<li class="sidemenus"><a href="adminConfirmForm.do?email=${email }" id="b" >관리자 메뉴</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>