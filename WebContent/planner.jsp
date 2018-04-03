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
	.sidebar-menu{
		background-color: #39A2D8;
		min-width: 100%;
		height: 5.8%;
		border-bottom: 1px solid white;
		
	}
	.sidebar-menu:hover {
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
    .cityinfo{
    	width: 0%;
    	height: 0%;
    	padding: 0px;
    	margin:0px;
    }
    .citydesc{
    	width: 0%;
    	float: left;
    	margin: 16% 0 0 5%;
    }
    #cityinfo:hover{
    	cursor: pointer;
    }
    .cityimage{
    	margin: 4% 0 0 4%;
    	float:left;
    	width: 0%;
    }
</style>


<script type="text/javascript">
$(document).on('click','.sidebar-menu', function(){
    var areaCode = $(this).attr('id');
    var sendData = "areaCode="+areaCode;
    $.post('loadCityList.jsp', sendData, function(msg){
    	var list = JSON.parse(msg);
    	$('.center').contents().remove();
    	for(var i = Object.keys(list).length; i > 0; i--){
     			$('.center').prepend("<div class='cityinfo' id="+Object.keys(list)[i-1]+" onclick='javascript:alert(this.id);'>"
    			    	+	"<img class='cityimage' id='cityimage' alt='' src='images/plan.jpg'>"
    			    	+	"<p class='citydesc' id='citydesc'>"+list[Object.keys(list)[i-1]]+"</p>"
    			    	+   "</div>");
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
    });
});
   

$(document).on('click','.sidebar-menu', function(e){
	    var $this = $(this).attr('id');
	    if($this == '1'){
	    	var seoul = new naver.maps.LatLng(37.5662952,126.9757564);
			e.preventDefault();
		    map.setZoom(6, true);
		    map.panTo();
	    }
	    else if($this == '2'){
	    	var incheon = new naver.maps.LatLng(37.4561057, 126.7030724);
			e.preventDefault();
		    map.setZoom(6, true);
		    map.panTo(incheon);
	    	
	    }
	    else if($this == '3'){
	    	var daejeon = new naver.maps.LatLng(36.350412, 127.3823583);
			e.preventDefault();
		    map.setZoom(6, true);
		    map.panTo(daejeon);
	    }
	    else if($this == '4'){
	    	var daegu = new naver.maps.LatLng(35.8819559, 128.5923414);
			e.preventDefault();
		    map.setZoom(6, true);
		    map.panTo(daegu);
	    }
	    else if($this == '5'){
	    	var gwangju = new naver.maps.LatLng(35.1600765, 126.8491083);
			e.preventDefault();
		    map.setZoom(6, true);
		    map.panTo(gwangju);
	    }
	    else if($this == '6'){
	    	var busan = new naver.maps.LatLng(35.17951,129.071666);
			e.preventDefault();
		    map.setZoom(6, true);
		    map.panTo(busan);
	    }
	    else if($this == '7'){
	    	var ulsan = new naver.maps.LatLng(35.538739,129.3091703);
			e.preventDefault();
		    map.setZoom(6, true);
		    map.panTo(ulsan);
	    }
	    else if($this == '8'){
	    	var sejong = new naver.maps.LatLng(36.4800984,127.2890354);
			e.preventDefault();
		    map.setZoom(6, true);
		    map.panTo(sejong);
	    }
	    else if($this == '31'){
	    	var kk = new naver.maps.LatLng(37.274627,127.00953);
			e.preventDefault();
		    map.setZoom(6, true);
		    map.panTo(kk);
	    }
	    else if($this == '32'){
	    	var kw = new naver.maps.LatLng(37.8853984,127.7275871);
			e.preventDefault();
		    map.setZoom(6, true);
		    map.panTo(kw);
	    }
	    else if($this == '33'){
	    	var cb = new naver.maps.LatLng(36.633713,127.4901737);
			e.preventDefault();
		    map.setZoom(6, true);
		    map.panTo(cb);
	    }
	    else if($this == '34'){
	    	var cn = new naver.maps.LatLng(36.6588284,126.6706662);
			e.preventDefault();
		    map.setZoom(6, true);
		    map.panTo(cn);
	    }
	    else if($this == '35'){
	    	var kb = new naver.maps.LatLng(36.5544072,128.7244815);
			e.preventDefault();
		    map.setZoom(6, true);
		    map.panTo(kb);
	    }
	    else if($this == '36'){
		    var kn = new naver.maps.LatLng(35.1802625,127.8305974);
			e.preventDefault();
		    map.setZoom(6, true);
		    map.panTo(kn);
	    }
	    else if($this == '37'){
	    	var jb = new naver.maps.LatLng(35.7262841,126.3695716);
			e.preventDefault();
		    map.setZoom(6, true);
		    map.panTo(jb);
	    }
	    else if($this == '38'){
	    	var jn = new naver.maps.LatLng(34.6909976,125.3768214);
			e.preventDefault();
		    map.setZoom(6, true);
		    map.panTo(jn);
	    }
	    else if($this == '39'){
	    	var jj = new naver.maps.LatLng(33.5769613,126.0125771);
			e.preventDefault();
		    map.panTo(jj);
	    }	    
});

</script>

</head>
<body>

<div class="section">
		<div class="sidebar">
			${areasMap }
			<c:forEach var="areaMap" items="${areasList}">
					<div class="sidebar-menu" id="${areaMap.code}">
						<p class="sidedesc" id="sidedesc">
							${areaMap.name}
						</p>
					</div>
			</c:forEach>
		</div>
	
		<div class="center" id="center">
			<div class="cityinfo" id="cityinfo">
				<img class="cityimage" id="cityimage" alt="" src="images/plan.jpg">
				<p class="citydesc" id="citydesc">수원시</p>
			</div>
		</div>
	

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
