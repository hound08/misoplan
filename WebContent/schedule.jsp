<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   <%@ include file="header.jsp" %>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>내 일정 리스트</title>
		<style type="text/css">
			#center {
				border: 1px solid red;
				margin: 0px auto;
				width: 1200px;
				height: 100%;
			}
			
			#main {
					width: 930px;
					border: 3px solid green;
					text-align: center;
					float: left;
					margin-top: 20px;
				}
			#main h1 {
					margin: 20px 0px;
			}
			.center-second { /* center 의 세부 내용 쭉쭉~~*/
				border: 0.5px solid gray;
				width: 350px;
				height: 400px;
				display: inline-block; /* 가로형 정렬 */
				margin: 30px 22.5px;
				border-radius: 10px;
				vertical-align: middle; /* 텍스트 라인 높이 맞춤 */
			}
			
			.second-box { /* center-second 이미지 삽입 div */
				border-radius: 10px;
				width: 350px;
				height: 250px;
				clear: both;
				overflow: hidden;
			}
			
			.second-text { /* center-second 텍스트 삽입 */
				width: 340px;
				height: 50px;
				padding: px 10px;
				overflow: hidden;
			}
		</style>
	</head>
	<body>
		
		<div id="center">
			<%@ include file="sidemenu.jsp" %>
			<div id="main">
				<h1>나의 일정 리스트</h1>
				<div id="myinfo">
					<div id="info">
						<c:forEach var="bsdto" items="${list }">
							<div class="center-second">
								<div class="second-box">
									<img alt="image" src="images/1.jpg">
								</div>
								<div class="second-text">
									<h1>제목 : ${bs.s_name }</h1>
								</div>
								<div class="tag">여행지 : ${bsdto.local_name }</div>
								<div class="idlocal" align="right">여행기간 : ${bsdto.tour_date }</div>
								<div class="datelocal" align="right">작성일 : ${bsdto.regi_date }</div>
							</div>
						
						</c:forEach>
						<div class="pagination">
										<a href="#">&laquo;</a> 
										<a href="#" class="active">1</a> 
										<a href="#">2</a> 
										<a href="#">3</a> 
										<a href="#" >4</a> 
										<a href="#">5</a> 
										<a href="#">&raquo;</a>
							</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>