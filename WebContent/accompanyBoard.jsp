<%@page import="java.util.ArrayList"%>
<%@page import="dao.AccompanyBoardDto"%>
<%@page import="dao.AccompanyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<link href="accompanyBoardCSS.css" rel="stylesheet" type="text/css" media="all">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="section">
		<div class="main-image">
			<img id="center-image" alt="centerimage" src="images/korea1.jpg">
			<div class="center-label">
				<!-- 텍스트 ! -->
			</div>
		</div>
		<div class="align">
			<button>조회순</button>
			<button>인기순</button>
			<button>최신순</button>
		</div>
		<div class="section-card">
		<c:forEach var="board" items="${list }">
			<a href="viewActionAB.do?post_num=${board.post_num }">
			<div class="card">
				<!-- 카드 헤더 -->
				<div class="card-header" style="background: url('${board.image_url}'); background-size: 100% 280px; background-repeat: no-repeat;">
					<div class="card-header-is_closed">
						<c:if test="${board.is_closed == 0 }">
							<div class="card-header-text">모집중</div>
							<div class="card-header-number">${board.current_num } / ${board.minimum_num }</div>
						</c:if>
						<c:if test="${board.is_closed == 1 }">
							<div class="card-header-text">마감</div>
							<div class="card-header-number">${board.current_num } / ${board.minimum_num }</div>
						</c:if>
					</div>
				</div>
				<!--  카드 바디 -->
				<div class="card-body">
					<!--  카드 바디 헤더 -->
					<div class="card-body-header">
						<h1>${board.title }</h1>
						<c:set var="tags" value="${fn:split(board.tag, ' ')}"/>
						<p class="card-body-hashtag">
							<c:forEach var="t" items="${tags }">
								<c:out value="${t }"></c:out>
							</c:forEach>
						</p>
						<p class="card-body-nickname">작성자: ${board.nickname }</p>
					</div>
					<!--  카드 바디 본문 -->
					<p class="card-body-description">${board.content }</p>
					<!--  카드 바디 푸터 -->
					<div class="card-body-footer">
						<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
						<i class="icon icon-view_count"></i>조회 ${board.view_count }회 
						<i class="icon icon-comments_count"></i>댓글 4개 
						<i class="reg_date"></i>${board.reg_date }
					</div>
				</div>
			</div>
			</a>
			</c:forEach>
			</div>
				<!--section card -->
				<div>
					<a href="writeFormAB.jsp"><button class="write-button">글쓰기</button></a>
				</div>
				<div class="pagination">
					
					<c:if test="${startPage!=1 }">
						<a href='listAction.do?pageNum=${startPage-blockSize }'>&laquo;</a>
					</c:if>
					<c:if test="${startPage==1 }">
						<a href='listAction.do?pageNum=1'>&laquo;</a>
					</c:if>
					<c:if test="${currentPage!=1 }">
						<a href='listAction.do?pageNum=${currentPage-1}'>&#9665</a>
					</c:if>
					<c:if test="${currentPage==1 }">
						<a href='listAction.do?pageNum=1'>&#9665</a>
					</c:if>

					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<a href='listAction.do?pageNum=${i }'>${i }</a>
					</c:forEach>

					<c:if test="${currentPage==totalPage }">
						<a href='listAction.do?pageNum=${totalPage }'>&#9655</a>
					</c:if>
					<c:if test="${currentPage!=totalPage }">
						<a href='listAction.do?pageNum=${currentPage+1 }'>&#9655</a>
					</c:if>
					<c:if test="${endPage>=totalPage }">
						<a href='listAction.do?pageNum=${totalPage}'>&raquo;</a>
					</c:if>
					<c:if test="${endPage<totalPage }">
						<a href='listAction.do?pageNum=${endPage+blockSize }'>&raquo;</a>
					</c:if>
				</div>
				<div class="search">
					<select class="search-select">
						<option>제목</option>
						<option>지역명</option>
						<option>닉네임</option>
						<option>날짜</option>
					</select> 
					<input type="text" class="search-bar" placeholder="지금 바로 동행을 검색해보세요!">
					<button type="submit" class="search-submit">검색</button>
				</div>
		</div>
		<div class="footer_wrap">
			<%@ include file="footer.jsp"%>
		</div>
		<script type="text/javascript">
						var image = document.getElementById("center-image");
			var current = 0;
			var images = [ "images/korea2.jpg", 
			               "images/korea3.jpg",
						   "images/korea4.jpg", 
						   "images/korea5.jpg",
						   "images/korea1.jpg" ]
			function replacePhoto() {
				++current;
				if (current >= images.length)
					current = 0;
				image.src = images[current];
			}
			setInterval(replacePhoto, 3000);
		</script>
</body>
</html>