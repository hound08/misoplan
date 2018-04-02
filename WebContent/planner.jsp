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
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
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
	var data = {
		'areaCode':areaCode,
	};
    $.ajax({
            type:'POST',
            url : '/loadCityList.jsp',
            data: JSON.stringify(data),
            contentType : "application/json",
			success: function(){
				
            }
        });
});
	
	
/* 	    	alert(clicked_id);
			document.getElementById("center").style.width="15%";
			document.getElementById("map").style.width="75%";
			
			var cityinfolist = document.getElementsByClassName("cityinfo");
			var cityimagelist = document.getElementsByClassName("cityimage");
			var citydesclist = document.getElementsByClassName("citydesc");
			for(var i = 0; i<cityinfolist.length; i++){
				cityinfolist[i].style.width="100%";
				cityinfolist[i].style.height="12%";
				cityinfolist[i].style.border="1px solid gray";
				cityimagelist[i].style.width="35%";
				cityimagelist[i].style.height="80%";
				citydesclist[i].style.width="20%";
			} */
</script>
</head>
<body>

<div class="section">
		<div class="sidebar">
			${areasMap }
			<c:forEach var="areaMap" items="${areasList}">
					<div class="sidebar-menu" id="${areaMap.code}" onclick="javascript:clickSideBar(this.id);">
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
	
	
	<script>
      function initMap() {
        var seoul = {lat: 37, lng: 127};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 6,
          center: seoul
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBnkgSC0SDpUzIBHXo7NrQKEnt0T0CpQK8&callback=initMap">
    </script>
</div>

</body>
</html>
