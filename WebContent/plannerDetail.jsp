<%@page import="java.util.Locale"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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

.planDiv {
	width: 1200px;
	border-radius: 10px;
	margin: 10px 0 0 0;
}

.planTop {
	background-color: gray;
	width: 1200px;
	height: 30px;
	border-radius: 10px;
	text-align: center;
	vertical-align: center;
	display: table;
}

.planTopInner {
	display: table-cell;
	vertical-align: middle;
	color: white;
	font-size: 25px;
}

.dayDiv {
	background-color: #39A2D8;
	width: 1200px;
	height: 30px;
	border-radius: 10px;
	border-color: #39A2D8;
	color: white;
}

.dayP {
	margin: 10px 0 0 5px;
}

.contentDiv {
	width: 1200px;
	height: 30px;
	border: 1px solid gray;
	border-radius: 10px;
	background-color: #33cc33;
	color: white;
}

.contentP {
	margin: 5px 0 0 5px;
}

.contentTextDiv {
	width: 1200px;
	border-radius: 10px;
}

.textarea {
	width: 1200px;
	height: 100px;
}
</style>

<script type="text/javascript">
	$(document).on('click','#tempSaveBtn',function() {
		var jsonArr = [];
		var wrapper = $(".wrapper");
		jQuery.each(wrapper, function(index, value) {
			jsonArr.push({
				"dayvalue" : $(value).children(".contentTextDiv").children().attr('dayValue'),
				"areaCode" : $(value).children(".contentTextDiv").children().attr('areaCode'),
				"sigunguCode" : $(value).children(".contentTextDiv").children().attr('sigunguCode'),
				"contentId" : $(value).children(".contentTextDiv").children().attr('contentId'),
				"elemTitle" : $(value).children(".contentDiv").children(".contentP").text().trim(),
				"mapx" : $(value).children(".contentTextDiv").children().attr('mapx'),
				"mapy" : $(value).children(".contentTextDiv").children().attr('mapy'),
				"imagePath" : $(value).children(".contentTextDiv").children().attr('imagePath'),
				"detail" : $(value).children(".contentTextDiv").children().val()
			});
		});
		var jsonString = JSON.stringify(jsonArr);
		$("#jsonString").val(jsonString);
		console.log(jsonArr);
	});

</script>

</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String jsonString = request.getParameter("jsonArr");
		String date = request.getParameter("date");
		
		System.out.println("jsonString : " + jsonString);
		
		JSONArray ja1 = new JSONArray(jsonString);
		JSONObject lastObj = ja1.getJSONObject(ja1.length()-1);
		int max = Integer.parseInt((String) lastObj.get("dayvalue"));
		
		System.out.println("date : " +date);
		Date firstDay = new SimpleDateFormat("yyyy-MM-dd").parse(date);
		String strFirstDay = new SimpleDateFormat("yyyy/MM/dd").format(firstDay);
		System.out.println(strFirstDay);
		
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(firstDay);
		cal.add(Calendar.DAY_OF_YEAR, max-1);
		Date lastDay = cal.getTime();
		String strLastDay = new SimpleDateFormat("yyyy/MM/dd").format(lastDay);
		System.out.println(strLastDay);
		
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
			<h2><%=title%></h2>
			<br> 
			<h3><%=strFirstDay %> ~ <%= strLastDay %></h3><br>
		</div>

		<div class="planDiv">
			<form action="insertPlan.do" id="form">
				<div class="planTop">
				<input type="hidden" name="title" value="<%=title %>">
				<input type="hidden" name="firstDate" value="<%=strFirstDay %>">
				<input type="hidden" name="lastDate" value="<%=strLastDay %>">
				<input type="hidden" name="jsonString" id="jsonString">
					<div class="planTopInner">PLAN</div>
				</div>
				<%
					JSONArray ja = new JSONArray(jsonString);
					JSONObject firstObj = ja.getJSONObject(0);
					String min = (String) firstObj.get("dayvalue");
				%>
				<div class="dayDiv">
					<p class="dayP">
						Day
						<%=min%>
					</p>
				</div>
				<%
					for (int i = 0; i < ja.length(); i++) {

						JSONObject jo = ja.getJSONObject(i);
						String dayValue = (String) jo.get("dayvalue");
						String areaCode = (String) jo.get("areaCode");
						String sigunguCode = (String) jo.get("sigunguCode");
						String planTitle = (String) jo.get("elemTitle");
						String contentId = (String) jo.get("contentId");
						String mapx = (String) jo.get("mapx");
						String mapy = (String) jo.get("mapy");
						String imagePath = (String) jo.get("imagePath");

						if (!dayValue.equals(min)) {
							min = dayValue;
				%>
				<div class="dayDiv">
					<p class="dayP">
						Day
						<%=dayValue%>
					</p>
				</div>
				<div class="wrapper">
					<div class="contentDiv">
						<input type="hidden" name="jsonArr" id="jsonArr">
						<p class="contentP">
							<%=planTitle%>
						</p>
					</div>

					<div class="contentTextDiv">
						<textarea class="textarea" dayValue="<%=dayValue%>"
							areaCode="<%=areaCode%>" sigunguCode="<%=sigunguCode%>"
							planTitle="<%=planTitle%>" contentId="<%=contentId%>"
							mapx="<%=mapx%>" mapy="<%=mapy%>" imagePath="<%=imagePath%>"></textarea>
					</div>
				</div>
				<%
					} else {
				%>
				<div class="wrapper">
					<div class="contentDiv">
						<input type="hidden" name="jsonArr" id="jsonArr">
						<p class="contentP">
							<%=planTitle%>
						</p>
					</div>

					<div class="contentTextDiv">
						<textarea class="textarea" dayValue="<%=dayValue%>"
							areaCode="<%=areaCode%>" sigunguCode="<%=sigunguCode%>"
							planTitle="<%=planTitle%>" contentId="<%=contentId%>"
							mapx="<%=mapx%>" mapy="<%=mapy%>" imagePath="<%=imagePath%>"></textarea>
					</div>
				</div>
				<%}
				}%>
				<input type="submit" value="저장">
			</form>
		</div>
		<div class="bottom">
			<button id="tempSaveBtn">임시저장</button>
		</div>
		
		
	</div>
</body>
</html>