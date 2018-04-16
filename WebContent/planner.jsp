<%@page import="service.AreaParser"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" hrefs="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
	/* 전체 적용   */
	
	*{
		font-family: 'NanumSquareRound', sans-serif;
	}
	a {
		text-decoration: none;
	}
	a:visited{
		color: black;
	}
	html{
		width: 100%;
		height: 100%;
	}
	body{
		width: 100%;
		height: 100%;
		padding: 0px;
		margin: 0px;
	}
	
	/* 개별 적용 */
	.section{
		padding: 0px;
		margin: 0px;
		width: 100%;
		min-height: 100%;
		overflow: hidden;
	}
	.center{
		padding: 0px;
		margin: 0px;
		float: left;
		width: 0%;
		height: 900px;
		overflow: scroll;
		transition:all 0.5s;
	}
	.tourlist{
		display: inline-block;
		padding: 0px;
		margin: 0px;
		float: left;
		width: 0%;
		height: 900px;
		overflow: scroll;
		transition:all 0.5s;
	}
	.tourinfo{
		width: 100%;
		height: 400px;
		border: 1px solid gray;
	}
	
	.sidebar{
		padding: 0px;
		margin: 0px;
		float: left;
		width: 5%;
		height: 900px;

	}
	#sidebar-menu{
		min-width: 100%;
		height: 5.8%;
		border-bottom: 1px solid white;
		background-color: #39A2D8;
	}
	#sidebar-menu:hover {
		cursor: pointer;
	}
	.sidedesc{
		padding: 20px 0 0 0;
		margin: 0px;
		text-align: center;
		color: white;
	}
    .map {
        padding: 0px;
		margin: 0px;
		float: left;
		width: 95%;
		height: 900px;
		transition:all 0.5s;
    }
    #cityinfo{
    	width: 0%;
    	height: 0%;
    	padding: 0px;
    	margin:0px;
    	border: 1px solid gray;
    }
    .citydesc{
    	text-align: center;
    	width: 0%;
    	margin: 10% 0 0 30%;
    }
    #cityinfo:hover{
    	cursor: pointer;
    }
    .city_selected{
    	background-color: gray;
    	color: white;
    }
    .tourImage{
    	width: 100%;
    	height: 300px;
    }
    .tourtitle{
    	padding: 5px;
    }
    .touraddr{
    	padding: 5px;
    }
    .tourImageDiv{
    	width: 100%;
    	height: 300px;
    	border: 1px solid gray;
    	/* margin: 5% 0 0 0; */
    }
    .tourdescdiv{
    	float: left;
    	width: 80%;
    	height: 100px;
    	overflow: hidden;
    	border-bottom: 1px solid gray;
    }
    .descwrapper{
    	width: 100%;
    	height: 100px;
    }
    
    .plusbutton{
    	text-align: center;
    	float:right;
    	width: 20%;
    	height: 100px;
    	background-color: #ff9933;
    	color: white;
    	font-size: 30px;

    }
    .plusP{
    	margin: 60% 0 0 0;
    }
    .plusbutton:hover {
		cursor: pointer;
	}
	.plan{
	}
	.wrapper{
		position: relative;
	}
    .plandiv{
		position: absolute;
		top: 50px;
		left: 79%;
		background-color: rgba(255,255,255,0.7);
		width: 20%;
		height: 65px;
		border: 1px solid white;
		border-radius: 10px;
		transition:all 0.5s;
    }
    .day{
    	width: 100%;
    	height: 20px;
    	background-color: #39A2D8;
    	border-radius: 10px;
    	color: white;
    	margin: 0px;
    	padding: 0px;
    }
    .dayleft{
    	float: left;	
    }
    .daycount{
    	margin: 0px;
    	padding: 0px;
    }
    .dayright{
    	float: right;
    }
    .deleteday{
    	float: right;
    }
    .plantop{
    	width: 100%;
    	height: 20px;
    	background-color: gray;
    	border: 1px solid gray;
    	border-radius: 10px;
    	color: white;
		text-align: center;    	
    }
    .dayplus{
    	position: absolute;
    	bottom:22px;
    	width: 100%;
    	height: 20px;
    	background-color: #33cc33;
    	border: 1px solid #33cc33;
    	border-radius: 10px;
    	color: white;
    	text-align: center;
    }
    .dayplus:hover{
    	cursor: pointer;
    }
    .daycount{
    	float: left;
    }
    .deleteday{
		float: right;    	
    }
    .deleteday:hover {
		cursor: pointer;
	}
	.planelem{
		width: 100%;
    	height: 20px;
    	border-radius: 10px;
    	border: 1px solid #a6a6a6;
    	overflow: hidden;
	}
	.elemtitle{
		float: left;
		margin: 0px;
		padding: 0px;
		text-overflow: ellipsis;
		width: 80%;
		height: 20px;
	}
	.deleteelem{
		float: right;
	}
	.deleteelem:hover{
		cursor: pointer;
	}
	 .completebtn{
    	position: absolute;
    	bottom: 0px;
    	width: 100%;
    	height: 20px;
    	background-color: #ff9933;
    	border: 1px solid #ff9933;
    	border-radius: 10px;
    	color: white;
    	text-align: center;
    }
    .completebtn:hover{
    	cursor: pointer;
    }
    #dialog{
    	background-color: white;
    }
	.inputs{
		width: 300px;
		height: 30px;	
		margin: 5px;
		border-radius: 5px;
		font-size: 20px;
	}
</style>

<!--  -->

<link rel="stylesheet" href="css/demo.css">
<link rel="stylesheet" href="css/avgrund.css">

<script>
	function openDialog() {
		Avgrund.show( "#default-popup" );
	}
	function openSecondDialog() {
		Avgrund.show( "#second-popup" );
	}
	function closeDialog() {
		Avgrund.hide();
	}
</script>
<!--  -->

<script type="text/javascript">
var mapx = [];
var mapy = [];
var daycount = 1;
var plandivheight = 65;
markers = [];


$(document).on('click', '#completebtn', function(){
	var plandiv = $(".plandiv");
	var contents = $(".planelem");
	var jsonArr = [];
	jQuery.each(contents, function(index, value){
		if($(value).attr('dayvalue')){
			jsonArr.push({"dayvalue" : $(value).attr('dayvalue'), 
						  "areaCode" : $(value).attr('areaCode'),
						  "areaName" : $(value).attr('areaName'),
						  "sigunguCode" : $(value).attr('sigunguCode'),
						  "sigunguName" : $(value).attr('sigunguName'),
						  "contentId" : $(value).attr('contentId'),
						  "elemTitle" : $(value).children(".elemtitle").text().replace(/ /gi,""),
						  "mapx" : $(value).attr('mapx'),
						  "mapy" : $(value).attr('mapy'),
						  "imagePath" : $(value).attr('imagePath')
			});	
		}
	});
	
	var stringArr = JSON.stringify(jsonArr);
	var form = $('#form');
	form.append("<input type='hidden' name='jsonArr' value="+stringArr+">");
	openDialog();
});


$(document).on('click','#sidebar-menu', function(){
    /* load city list */
    var $this = $(this);
    var areaCode = $(this).attr('data');
    var sendData = "areaCode="+areaCode;
    $.post('loadCityList.jsp', sendData, function(msg){
    	var list = JSON.parse(msg);
    	$('.center').contents().remove();
    	for(var i = Object.keys(list).length; i > 0; i--){
				$('.center').prepend("<li id='cityinfo' data="+Object.keys(list)[i-1]+">"
    			    	+	"<p class='citydesc' id='citydesc'>"+list[Object.keys(list)[i-1]]+"</p>"
    			    	+   "</li>");
    	}
    	
    	document.getElementById("center").style.width="8%"
		document.getElementById("map").style.width="87%";
		document.getElementById("tourlist").style.width="0px";
		var cityinfolist = $('.center').children();
		var cityimagelist = document.getElementsByClassName("cityimage");
		var citydesclist = document.getElementsByClassName("citydesc");
		for(var i = 0; i<cityinfolist.length; i++){
			cityinfolist[i].style.width="100%";
			cityinfolist[i].style.height="5%";
			cityinfolist[i].style.border="1px solid gray";
			citydesclist[i].style.width="50%";
		} 
    /* load city list end */
    
    
    /* select, unselect */
	$(".sidebar").children().removeClass("area_selected");
	$this.addClass('area_selected');
	
	/* select, unselect end */
	
	
	});
});   


$(document).on('click','#cityinfo', function(){
	if(markers != null){
		for(var i = 0; i < markers.length; i++){
			markers[i].setMap(null);
		}
	}
	var $this = $(this);
	var areaCode = $('.area_selected').attr('data');
	var sigunguCode = $(this).attr('data');
	$('.tourlist').contents().remove();
	$.ajax({
		url : 'TourList',
		type : 'get',
		dataType : 'json',
		data : {
			area : areaCode,
			sigun : sigunguCode
		},
		success : function(data) {
			var myItem = data.response.body.items.item;
			for(var i = 0; i < myItem.length; i++){
				mapx.push(myItem[i].mapx);
				mapy.push(myItem[i].mapy);
				var title = myItem[i].title;
				var addr1 = myItem[i].addr1;
				var addr2 = myItem[i].addr2;
				var coordx = myItem[i].mapx;
				var coordy = myItem[i].mapy;
				mapx.push(coordx);
				mapy.push(coordy);
				//console.log("coordx : " + coordx);
				//console.log("coordy : " + coordy);
				var latlng = new google.maps.LatLng(coordy, coordx);
				markers[i] = new google.maps.Marker({
				    position: latlng,
				    map: map
				  });
				markers[i].setMap(map);

				
				var contentid = myItem[i].contentid;
				var parsedinfo = contentid+"-"+title;
				var firstImage = myItem[i].firstimage;
				if(firstImage == undefined){
					firstImage = "images/no_image.jpg";
				}
				if(addr1 == undefined){
					addr1 = addr2;
				}
				$(".tourlist").prepend("<li class='tourinfo' id="+contentid+"><div class='tourImageDiv'><img class='tourImage' src="+firstImage+"></div>"
				+"<div class='descwrapper'><div class='tourdescdiv' id='tourdescdiv' mapx="+coordx+" mapy="+coordy+"><p class='tourtitle'>"+title+"</p><p class='touraddr'>"+addr1+"</p></div><div class='plusbutton' id="+contentid+"><p class='plusP'>+</p></div></div></li>");
			}

				
					
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			console.log("request : " + XMLHttpRequest);
			console.log("Status: " + textStatus);
			console.log("Error: " + errorThrown);
		}
	});
	
	
	document.getElementById("tourlist").style.width = "20%";
	var tourinfo = document.getElementsByClassName("tourinfo");
	for(var i = 0; i < tourinfo.length; i++){
		tourinfo[i].style.width = "100%";
	}
	document.getElementById("map").style.width="67%";
	$(".center").children().removeClass("city_selected");
	$this.addClass('city_selected');
	
});




$(document).on('click', '.plusbutton', function(){
	$this = $(this);
	var tourtitle = $this.prevAll("#tourdescdiv").children().eq(0).text();
	var touraddr = $this.prevAll("#tourdescdiv").children().eq(1).text();
	var coordx = $this.prevAll("#tourdescdiv").attr("mapx");
	var coordy = $this.prevAll("#tourdescdiv").attr("mapy");
	var imagePath = $this.parent().prevAll(".tourImageDiv").children(".tourImage").attr("src");
	var contentId = $(this).attr("id");
	var plandiv = $('.plandiv'); 
	var areaCode = $('.area_selected').attr('data');
	var areaName = $('.area_selected').text().trim();
	var sigunguCode = $('.city_selected').attr('data');
	var sigunguName = $('.city_selected').text().trim();
	console.log("area name : " + areaName);
	console.log("sigungu name : " + sigunguName);
	
	var parsedinfo = areaCode + "-" + sigunguCode + "-" + contentId;
	if(plandiv.children("#planelem"+contentId).attr('id')){
		alert("이미 추가된 여행지입니다.");		
	}else{
		if(!plandiv.children(".day").attr("id")){
			plandiv.append("<div class='day' id='div"+daycount+"'><p class='daycount' id='p"+daycount+"'>&nbsp;Day "+daycount+"</p><div class='deleteday' id='delete"+daycount+"'>X&nbsp;</div></div>");
			plandivheight = plandivheight + 20;
			plandiv.css('height', plandivheight);
			daycount = daycount + 1;
		}
		plandiv.append("<div class='planelem' id='planelem"+contentId+"' dayvalue="+(daycount-1)+" areaName = "+areaName+" areaCode="+areaCode+" sigunguName ="+sigunguName+" sigunguCode="+sigunguCode+" contentId="+contentId+" mapx="+coordx+" mapy="+coordy+" imagePath="+imagePath+"><p class='elemtitle' id='elemtitle"+contentId+"'>"+tourtitle+"</p><div class='deleteelem' id='delete"+contentId+"'>X&nbsp;</div></div>");
		plandivheight = plandivheight + 22;
		plandiv.css('height', plandivheight);
	}
});


$(document).on('click', '.deleteelem', function(){
	$this = $(this);
	var plandiv = $(".plandiv");
	var deleteid = $this.attr('id');
	var parsedid = deleteid.substring(6, deleteid.length);
	var parseddiv = "#planelem"+parsedid;
	var parsedtitle = "#elemtitle"+parsedid;
	var parseddelete = "#delete"+parsedid; 
	
	plandivheight = plandivheight - 22;
	plandiv.css('height', plandivheight);
	$(parseddiv).remove();
	$(parsedtitle).remove();
	$(parseddelete).remove();
});	


$(document).on('click', '.dayplus', function(){
	var plandiv = $(".plandiv");
	plandivheight = plandivheight + 20;
	plandiv.append("<div class='day' id='div"+daycount+"'><p class='daycount' id='p"+daycount+"'>&nbsp;Day "+daycount+"</p><div class='deleteday' id='delete"+daycount+"'>X&nbsp;</div></div>");
	
	plandiv.css('height', plandivheight);
	daycount = daycount + 1;
});


$(document).on('click', '.deleteday', function(){
	var deleteid = $(this).attr('id');
	var plandiv = $('.plandiv');
	var parsedid = deleteid.substring(6,deleteid.length);
	var divid = "#div"+parsedid;
	var pid = "#p"+parsedid;
	
	deleteid = "#delete"+parsedid;
	daycount = daycount - 1;
	plandivheight = plandivheight - 20;
	plandiv.css('height', plandivheight);
	
	
	$(divid).remove();
	$(pid).remove();
	$(deleteid).remove();
});


 $(document).on('click','#sidebar-menu', function(e){
	    var $this = $(this).attr('data');
	    if($this == '1'){
			e.preventDefault();
		    map.panTo({lat:37.566662, lng:126.978424});
		    map.setZoom(12, true);
	    }
	    else if($this == '2'){
	    	var incheon = new google.maps.LatLng(37.4261057, 126.7530724);
			e.preventDefault();
		    map.panTo(incheon);
		    map.setZoom(12, true);
	    }
	    else if($this == '3'){
	    	var daejeon = new google.maps.LatLng(36.300412, 127.4823583);
			e.preventDefault();
		    map.panTo(daejeon);
		    map.setZoom(12, true);
	    }
	    else if($this == '4'){
	    	var daegu = new google.maps.LatLng(35.8319559, 128.6923414);
			e.preventDefault(); 
			
		    map.panTo(daegu);
		    map.setZoom(12, true);
	    }
	    else if($this == '5'){
	    	var gwangju = new google.maps.LatLng(35.1100765, 126.9491083);
			e.preventDefault();
		    map.panTo(gwangju);
		    map.setZoom(12, true);
	    }
	    else if($this == '6'){
	    	var busan = new google.maps.LatLng(35.12951,129.171666);
			e.preventDefault();
		    map.panTo(busan);
		    map.setZoom(12, true);
	    }
	    else if($this == '7'){
	    	var ulsan = new google.maps.LatLng(35.488739,129.4091703);
			e.preventDefault();
		    map.panTo(ulsan);
		    map.setZoom(12, true);
	    }
	    else if($this == '8'){
	    	var sejong = new google.maps.LatLng(36.4300984,127.3890354);
			e.preventDefault();
		    map.panTo(sejong);
		    map.setZoom(12, true);
	    }
	    else if($this == '31'){
	    	var kk = new google.maps.LatLng(37.214627,127.10953);
			e.preventDefault();
		    map.panTo(kk);
		    map.setZoom(9, true);
	    }
	    else if($this == '32'){
	    	var kw = new google.maps.LatLng(37.819157, 128.153092);
			e.preventDefault();
		    map.panTo(kw);
		    map.setZoom(9, true);
	    }
	    else if($this == '33'){
	    	var cb = new google.maps.LatLng(37.001801, 127.699625);
			e.preventDefault();
		    map.panTo(cb);
		    map.setZoom(9, true);
	    }
	    else if($this == '34'){
	    	var cn = new google.maps.LatLng(37.001801, 127.699625);
			e.preventDefault();
		    map.panTo(cn);
		    map.setZoom(9, true);
	    }
	    else if($this == '35'){
	    	var kb = new google.maps.LatLng(36.294101, 128.890085);
			e.preventDefault();
		    map.panTo(kb);
		    map.setZoom(9, true);
	    }
	    else if($this == '36'){
		    var kn = new google.maps.LatLng(35.462191, 128.207913);
			e.preventDefault();
		    map.panTo(kn);
		    map.setZoom(9, true);
	    }
	    else if($this == '37'){
	    	var jb = new google.maps.LatLng(35.717958, 127.154594);
			e.preventDefault();
		    map.panTo(jb);
		    map.setZoom(9, true);
	    }
	    else if($this == '38'){
	    	var jn = new google.maps.LatLng(34.870864, 126.994047);
			e.preventDefault();
		    map.panTo(jn);
		    map.setZoom(9, true);
	    }
	    else if($this == '39'){
	    	var jj = new google.maps.LatLng(33.382297, 126.552247);
			e.preventDefault();
		    map.panTo(jj);
		    map.setZoom(11, true);
	    }	    
});

 function initMap() {
       var area = document.getElementsByClassName('sidebar-menu');
 	   var center = {lat:36.543583, lng:127.859900};
       map = new google.maps.Map(document.getElementById('map'), {
         zoom: 7,
         center: center,
         gestureHandling: 'greedy'
       });  
 	  };

 /* function createMarkers(){
 	var markerArr = [];
 	console.log("mapx : " + mapx);
 	console.log("mapy : " + mapy);
 	for(var i = 0; i < mapx.length; i++){
 		var latlng = new google.maps.LatLng( mapx[i], mapy[i]);
 		
 		markerArr[i] = new google.maps.Marker({
 			position: latlng,
 			map: map
 		});
 		markerArr[i].setMap(map);
 	}
 } */
</script>

<script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBnkgSC0SDpUzIBHXo7NrQKEnt0T0CpQK8&callback=initMap">
</script>
</head>
<body>

<%
	if(session.getAttribute("email") == null){
		%>
			<script type="text/javascript">
				alert("로그인이 필요한 서비스 입니다.");
				location.href="loginForm.do";
			</script>
		<%
	}
%>

<div class="section">
			${areasMap }
		<ul class="sidebar">
			<c:forEach var="areaMap" items="${areasList}">
				<li id="sidebar-menu" data="${areaMap.code }">
					<p class="sidedesc" id="sidedesc">
						${areaMap.name }
					</p>
				</li>
			</c:forEach>
		</ul>
	
		<ul class="center" id="center">
		
		</ul>
		
		<ul class="tourlist" id="tourlist">
			
		</ul>

		<div class="wrapper" id="wrapper">
			<div class="map" id="map">
			</div>
			<div class="plandiv" id="plandiv">
				<div class="plantop" id="plantop">
					PLAN
				</div>
				<div class="dayplus" id="dayplus">
					1일 +
				</div>		
				<div class="completebtn" id="completebtn">
					저장
				</div>
			</div>
		</div>
</div>
<!--  -->
		<aside id="default-popup" class="avgrund-popup">
			<h2>저장</h2>
			<form action="plannerDetail.jsp" method="post" id="form">
				<label>플랜 제목 : </label>
				<input type="text" name="title" id="title" class="inputs" required>
				<br>
				<label>출발일 : </label>
			  	<input type="date" name="date" class="inputs" required>
				<br>
			<!-- <button onclick="javascript:document.getElementById('form').submit();">완료</button> -->
			<input type="submit" value="전송">
			</form>
		</aside>
		<div class="avgrund-cover"></div>
	
		<script type="text/javascript" src="js/avgrund.js"></script>
		<script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
		
</body>
</html>
