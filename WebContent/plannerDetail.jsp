<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0px;
	padding: 0px;
	font-family: 'NanumSquareRound', sans-serif;
}

div {
	margin: 0px auto;
}

.section {
	width: 1200px;
}

.main-image {
	border-radius: 5px;
	margin-left: auto;
	margin-right: auto;
	width: 100%;
	height: 400px;
	overflow: hidden;
	position: relative;
}

.centerimage {
	min-height: 100%;
	min-width: 100%;
	width: 100%;
	height: auto;
}

.center-label {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 30px
}



.planDiv{
	width: 1200px;
	border-radius: 10px;
	margin: 10px 0 0 0;
}
.planTop{
	background-color: gray;
	width: 1200px;
	height: 30px;
	border-radius: 10px;
	text-align: center;
	vertical-align: center;
	display: table;
}
.planTopInner{
	display: table-cell;
	vertical-align: middle;
	color: white;
	font-size: 25px;
}
.dayDiv{
	background-color: #39A2D8;
	width: 1200px;
	height: 30px;
	border-radius: 10px;
}
.contentDiv{
	width: 1200px;
	height: 30px;
	border: 1px solid gray;
	border-radius: 10px;
	
}
.contentTextDiv{
	
	width: 1200px;
	border-radius: 10px;
}
.textarea{
	width: 1200px;
	height: 100px;
}
</style>
</head>
<body>
	<%
		String title = request.getParameter("title");
		String jsonString = request.getParameter("jsonArr");
		jsonString = jsonString.substring(1, jsonString.length()-1);
		System.out.println();
		
		
		String date = request.getParameter("date");
		
		System.out.println("jsonString = " + jsonString);
		 
		JSONObject jo = new JSONObject();
		jo.put("data", jsonString);
		System.out.println("jo = " + jo);
		System.out.println("jo length = " + jo.size());
		System.out.println("jo get dayvalue = " + jo.get("data")); 
		JSONArray ja = (JSONArray)jo.get("data");
		System.out.println(ja);
		//JSONArray ja = new JSONArray();
	//	ja.add(jsonString);
		//System.out.println("ja get 0 = " + ja.get(0));
	//	System.out.println("ja : " + ja);
	//	System.out.println("ja length : " + ja.size());
	%>

	<div class="section">
		<div class="main-image">
			<img id="center-image" alt="centerimage" src="images/korea1.jpg">
			<div class="center-label">
				<!-- 텍스트 ! -->
			</div>
		</div>
		
		<div class="pageDesc">
			<br>
			<h2>세부일정 작성</h2><br>
			<p>
				세부일정을 작성하는 페이지 입니다.
			</p><br>
		</div>
		
		<div class="planDiv">
			<div class="planTop">
				<div class="planTopInner">
					PLAN
				</div>
			</div>
			
					
			<div class="dayDiv">
			</div>
			<div class="contentDiv">
			</div>
			<div class="contentTextDiv">
				<textarea class="textarea"></textarea>
			</div>
		</div>
		<div>
		
		</div>
	</div>
</body>
</html>