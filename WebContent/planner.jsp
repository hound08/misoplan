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
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
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
	.sidebar{
		padding: 0px;
		margin: 0px;
		float: left;
		width: 10%;
		height: 900px;
		background-color: #39A2D8;

	}
	#sidebar-menu{
		background-color: #39A2D8;
		min-width: 100%;
		height: 5.8%;
		border-bottom: 1px solid white;
		
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
		width: 90%;
		height: 900px;
		transition:all 0.5s;
    }
    #cityinfo{
    	width: 0%;
    	height: 0%;
    	padding: 0px;
    	margin:0px;
    }
    .citydesc{
    	width: 0%;
    	float: left;
    	margin: 13% 0 0 5%;
    }
    #cityinfo:hover{
    	cursor: pointer;
    }
    .cityimage{
    	margin: 4% 0 0 4%;
    	float:left;
    	width: 0%;
    }
    .selected{
    	background-color: black;
    }
    
</style>




<script type="text/javascript">

$(document).on('click','#sidebar-menu', function(){
    /* load city list */
    var $this = $(this);
    var areaCode = $(this).attr('data');
    var sendData = "areaCode="+areaCode;
    $.post('loadCityList.jsp', sendData, function(msg){
    	var list = JSON.parse(msg);
    	$('.center').contents().remove();
    	for(var i = Object.keys(list).length; i > 0; i--){
				$('.center').prepend("<li class='cityinfo' id='cityinfo' data="+Object.keys(list)[i-1]+">"
						+	"<img class='cityimage' id='cityimage' alt='' src='images/plan.jpg'>"
    			    	+	"<p class='citydesc' id='citydesc'>"+list[Object.keys(list)[i-1]]+"</p>"
    			    	+   "</li>");
    	}
    	
    	document.getElementById("center").style.width="20%";
		document.getElementById("map").style.width="70%";
		
		var cityinfolist = document.getElementsByClassName("cityinfo");
		var cityimagelist = document.getElementsByClassName("cityimage");
		var citydesclist = document.getElementsByClassName("citydesc");
		for(var i = 0; i<cityinfolist.length; i++){
			cityinfolist[i].style.width="100%";
			cityinfolist[i].style.height="12%";
			cityinfolist[i].style.border="1px solid gray";
			cityimagelist[i].style.width="35%";
			cityimagelist[i].style.height="80%";
			citydesclist[i].style.width="30%";
		} 
    /* load city list end */
    
    
    /* select, unselect */
	$(".sidebar").children().removeClass("selected");
	$this.addClass('selected');
	/* select, unselect end */
	
	
	});
});   
    

$(document).on('click','#cityinfo', function(){
	var areaCode = $('.selected').attr('data');
	var sigunguCode = $(this).attr('data');
	var sendData = "areaCode="+areaCode+"sigunguCode"+sigunguCode;
	

	$.post('loadMarkers.jsp', sendData, function(msg){
		alert(msg);
	});
});



$(document).on('click','#sidebar-menu', function(e){
	    var $this = $(this).attr('data');
	    if($this == '1'){
	    	var seoul = new naver.maps.LatLng(37.566662, 126.978424);
			e.preventDefault();
		    map.setZoom(7, true);
		    map.panTo(seoul);
	    }
	    else if($this == '2'){
	    	var incheon = new naver.maps.LatLng(37.4261057, 126.7530724);
			e.preventDefault();
		    map.setZoom(7, true);
		    map.panTo(incheon);
	    	
	    }
	    else if($this == '3'){
	    	var daejeon = new naver.maps.LatLng(36.300412, 127.4823583);
			e.preventDefault();
		    map.setZoom(7, true);
		    map.panTo(daejeon);
	    }
	    else if($this == '4'){
	    	var daegu = new naver.maps.LatLng(35.8319559, 128.6923414);
			e.preventDefault();
		    map.setZoom(7, true);
		    map.panTo(daegu);
	    }
	    else if($this == '5'){
	    	var gwangju = new naver.maps.LatLng(35.1100765, 126.9491083);
			e.preventDefault();
		    map.setZoom(7, true);
		    map.panTo(gwangju);
	    }
	    else if($this == '6'){
	    	var busan = new naver.maps.LatLng(35.12951,129.171666);
			e.preventDefault();
		    map.setZoom(7, true);
		    map.panTo(busan);
	    }
	    else if($this == '7'){
	    	var ulsan = new naver.maps.LatLng(35.488739,129.4091703);
			e.preventDefault();
		    map.setZoom(7, true);
		    map.panTo(ulsan);
	    }
	    else if($this == '8'){
	    	var sejong = new naver.maps.LatLng(36.4300984,127.3890354);
			e.preventDefault();
		    map.setZoom(7, true);
		    map.panTo(sejong);
	    }
	    else if($this == '31'){
	    	var kk = new naver.maps.LatLng(37.214627,127.10953);
			e.preventDefault();
		    map.setZoom(5, true);
		    map.panTo(kk);
	    }
	    else if($this == '32'){
	    	var kw = new naver.maps.LatLng(37.819157, 128.153092);
			e.preventDefault();
		    map.setZoom(5, true);
		    map.panTo(kw);
	    }
	    else if($this == '33'){
	    	var cb = new naver.maps.LatLng(37.001801, 127.699625);
			e.preventDefault();
		    map.setZoom(5, true);
		    map.panTo(cb);
	    }
	    else if($this == '34'){
	    	var cn = new naver.maps.LatLng(37.001801, 127.699625);
			e.preventDefault();
		    map.setZoom(5, true);
		    map.panTo(cn);
	    }
	    else if($this == '35'){
	    	var kb = new naver.maps.LatLng(36.294101, 128.890085);
			e.preventDefault();
		    map.setZoom(5, true);
		    map.panTo(kb);
	    }
	    else if($this == '36'){
		    var kn = new naver.maps.LatLng(35.462191, 128.207913);
			e.preventDefault();
		    map.setZoom(5, true);
		    map.panTo(kn);
	    }
	    else if($this == '37'){
	    	var jb = new naver.maps.LatLng(35.717958, 127.154594);
			e.preventDefault();
		    map.setZoom(5, true);
		    map.panTo(jb);
	    }
	    else if($this == '38'){
	    	var jn = new naver.maps.LatLng(34.870864, 126.994047);
			e.preventDefault();
		    map.setZoom(5, true);
		    map.panTo(jn);
	    }
	    else if($this == '39'){
	    	var jj = new naver.maps.LatLng(33.382297, 126.552247);
			e.preventDefault();
		    map.setZoom(5, true);
		    map.panTo(jj);
	    }	    
});

</script>

</head>
<body>

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
	

		<div id="map" class="map"></div>
		
		<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=rrztZgCkXFNkTJtZLzXH"></script>
		<script>
			var mapOptions = {
		 	   center: new naver.maps.LatLng(37.3595704, 127.105399),
			    zoom: 2
			};
			var map = new naver.maps.Map('map', mapOptions);
		</script>
		
</div>

</body>
</html>
