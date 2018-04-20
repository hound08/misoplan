<%@page import="service.AreaParser"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" hrefs="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
<style type="text/css">
/* 전체 적용   */
* {
	font-family: 'NanumSquareRound', sans-serif;
}

a {
	text-decoration: none;
}

a:visited {
	color: black;
}

html {
	width: 100%;
	height: 100%;
}

body {
	width: 100%;
	height: 100%;
	padding: 0px;
	margin: 0px;
}

/* 개별 적용 */
.section {
	padding: 0px;
	margin: 0px;
	width: 100%;
	min-height: 100%;
	overflow: hidden;
}

.center {
	padding: 0px;
	margin: 0px;
	float: left;
	width: 0%;
	height: 900px;
	overflow: scroll;
	transition: all 0.5s;
}

.tourlist {
	display: inline-block;
	padding: 0px;
	margin: 0px;
	float: left;
	width: 0%;
	height: 900px;
	overflow: scroll;
	transition: all 0.5s;
}

.tourinfo {
	width: 100%;
	height: 400px;
	border: 1px solid gray;
}

.sidebar {
	padding: 0px;
	margin: 0px;
	float: left;
	width: 5%;
	height: 900px;
}

#sidebar-menu {
	min-width: 100%;
	height: 5.5%;
	border-bottom: 1px solid white;
	background-color: #39A2D8;
}

#sidebar-menu:hover {
	cursor: pointer;
}

.sidedesc {
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
	height: 910px;
	transition: all 0.5s;
}

#cityinfo {
	width: 0%;
	height: 0%;
	padding: 0px;
	margin: 0px;
	border: 1px solid gray;
}

.citydesc {
	text-align: center;
	width: 0%;
	margin: 10% 0 0 30%;
}

#cityinfo:hover {
	cursor: pointer;
}

.city_selected {
	background-color: gray;
	color: white;
}

.tourImage {
	width: 100%;
	height: 300px;
}

.tourtitle {
	padding: 5px;
}

.touraddr {
	padding: 5px;
}

.tourImageDiv {
	width: 100%;
	height: 300px;
	border: 1px solid gray;
	/* margin: 5% 0 0 0; */
}

.tourdescdiv {
	float: left;
	width: 80%;
	height: 100px;
	overflow: hidden;
	border-bottom: 1px solid gray;
}

.descwrapper {
	width: 100%;
	height: 100px;
}

.plusbutton {
	text-align: center;
	float: right;
	width: 20%;
	height: 100px;
	background-color: #ff9933;
	color: white;
	font-size: 30px;
}

.plusP {
	margin: 60% 0 0 0;
}

.plusbutton:hover {
	cursor: pointer;
}

.plan {
	
}

.wrapper {
	position: relative;
}

.plandiv {
	position: absolute;
	top: 50px;
	left: 79%;
	background-color: rgba(255, 255, 255, 0.7);
	width: 20%;
	height: 65px;
	border: 1px solid white;
	border-radius: 10px;
	transition: all 0.5s;
}

.day {
	width: 100%;
	height: 20px;
	background-color: #39A2D8;
	border-radius: 10px;
	color: white;
	margin: 0px;
	padding: 0px;
}

.dayleft {
	float: left;
}

.daycount {
	margin: 0px;
	padding: 0px;
}

.dayright {
	float: right;
}

.deleteday {
	float: right;
}

.plantop {
	width: 100%;
	height: 20px;
	background-color: gray;
	border: 1px solid gray;
	border-radius: 10px;
	color: white;
	text-align: center;
}

.dayplus {
	position: absolute;
	bottom: 22px;
	width: 100%;
	height: 20px;
	background-color: #33cc33;
	border: 1px solid #33cc33;
	border-radius: 10px;
	color: white;
	text-align: center;
}

.dayplus:hover {
	cursor: pointer;
}

.daycount {
	float: left;
}

.deleteday {
	float: right;
}

.deleteday:hover {
	cursor: pointer;
}

.planelem {
	width: 100%;
	height: 20px;
	border-radius: 10px;
	border: 1px solid #a6a6a6;
	overflow: hidden;
}

.elemtitle {
	float: left;
	margin: 0px;
	padding: 0px;
	text-overflow: ellipsis;
	width: 80%;
	height: 20px;
}

.deleteelem {
	float: right;
}

.deleteelem:hover {
	cursor: pointer;
}

.completebtn {
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

.completebtn:hover {
	cursor: pointer;
}

#dialog {
	background-color: white;
}

.inputs {
	width: 300px;
	height: 30px;
	margin: 5px;
	border-radius: 5px;
	font-size: 20px;
}

#wishList{
	min-width: 100%;
	height: 5.8%;
	border-bottom: 1px solid white;
	background-color: #39A2D8;
}
#wishList:hover{
	cursor: pointer;
}
</style>

<!--  -->

<link rel="stylesheet" href="css/demo.css">
<link rel="stylesheet" href="css/avgrund.css">


<script>
	function openDialog() {
		Avgrund.show("#default-popup");
	}
	function openSecondDialog() {
		Avgrund.show("#second-popup");
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
	infowindow = [];
	var seq = 0;
	var path = null;

	
	// 
	$(document).ready(function(){
		var status = '${status}';
		if(status == null){
			status = '0';
		}
		console.log("status in script : " + status);
		if(status == 1){
			var loadJsonArr = '${loadJsonArr}';
			loadJsonArr = JSON.parse(loadJsonArr).reverse();
			console.log(loadJsonArr);
			var plandiv = $('.plandiv');
			var dayFlag = loadJsonArr[0].tour_date;
			//console.log("dayFlag : " + dayFlag)
			makeDay();
			jQuery.each(loadJsonArr, function(index, value){
				if(dayFlag != value.tour_date){
					//console.log(dayFlag +"////" + value.tour_date);
					makeDay();
					dayFlag = value.tour_date;
				}
				plandiv.append("<div class='planelem' seq=seq-"+ seq+ " id='planelem"+ value.tour_code + "' dayvalue="+ (daycount - 1) 
						  + " areaName = "+ value.area_name + " areaCode="+ value.area_code + " sigunguName ="+ value.sigungu_name
						  + " sigunguCode="+ value.sigungu_code + " contentId="+ value.tour_code + " mapx="+ value.coord_x + " mapy="+ value.coord_y
						  + " imagePath="+ value.image_url+" sl_code="+value.sl_code+" sm_code="+value.sm_code+" ss_code="+value.ss_code+">"
						  +	" <p class='elemtitle' id='elemtitle"+value.tour_code+"'>"+ value.tour_name
						  + "</p><div class='deleteelem' id='delete"+value.tour_code+"'>X&nbsp;</div></div>");
				plandivheight = plandivheight + 22;
				plandiv.css('height', plandivheight);
				
				createMarker(value.coord_y, value.coord_x);
			});
			drawLines();
			$('#form').append("<input type='hidden' name='sl_code' value="+loadJsonArr[0].sl_code+">");
			
			
		}
			$('#form').append("<input type='hidden' name='status' value="+status+">");
	});
	function makeDay(){
		var plandiv = $('.plandiv');
		plandiv.append("<div class='day' id='div"+daycount+"'><p class='daycount' id='p"+daycount+"'>&nbsp;Day "
				+ daycount
				+ "</p><div class='deleteday' id='delete"+daycount+"'>X&nbsp;</div></div>");
		plandivheight = plandivheight + 20;
		plandiv.css('height', plandivheight);
		daycount = daycount + 1;
	}
	
	function createMarker(y, x){
		var latlng = new google.maps.LatLng(y, x);	
		var marker = new google.maps.Marker({		
			position : latlng,
			map : map,
			icon : 'images/marker.png'
		});
		markers[seq] = marker;
		seq = seq + 1;			
		marker.setMap(map);		
		map.panTo(latlng);		
		map.setZoom(15, true);
	}
	 
	
	// 저장 버튼 클릭 이벤트
	$(document).on('click','#completebtn',function() {
						var plandiv = $(".plandiv");
						var contents = $(".planelem");
						var jsonArr = [];
						var sl_code = "";
						jQuery.each(contents, function(index, value) { // jQuery each >> java의 향상된 for문과 비슷함, value는 contents의 각 요소
							if ($(value).attr('dayvalue')) { // jsonArr에 데이터를 push
								sl_code = 
								jsonArr.push({
												"dayvalue" : $(value).attr('dayvalue'),
												"areaCode" : $(value).attr('areaCode'),
												"areaName" : $(value).attr('areaName'),
												"sigunguCode" : $(value).attr('sigunguCode'),
												"sigunguName" : $(value).attr('sigunguName'),
												"contentId" : $(value).attr('contentId'),
												"elemTitle" : $(value).children(".elemtitle").text().replace(/ /gi,""), // 공백을 제거하는 메서드
												"mapx" : $(value).attr('mapx'),
												"mapy" : $(value).attr('mapy'),
												"imagePath" : $(value).attr('imagePath'),
												"slcode" : $(value).attr('sl_code'),
												"smcode" : $(value).attr('sm_code'),
												"sscode" : $(value).attr('ss_code')
								});
							}
						});

						var stringArr = JSON.stringify(jsonArr); // json 형태의 데이터를 String으로 만듦
						var form = $('#form');
						form.append("<input type='hidden' name='jsonArr' value="+stringArr+">"); // submit하기위해 form에 input태그를 append
						openDialog(); //모달 오픈
					});

	
	// 서울, 인천 등의 지역 클릭 이벤트
	$(document).on('click','#sidebar-menu',function() {
				var $this = $(this);
				var areaCode = $(this).attr('data');
				var sendData = "areaCode=" + areaCode; // loadCityList.jsp로 보낼 파라미터 
				$.post('loadCityList.jsp', sendData, function(msg) {
					var list = JSON.parse(msg); // String 형태의 데이터를 JSON형태로 파싱
					$('.center').contents().remove(); // 기존에 존재하는 center div의 자식엘리먼트들을 제거
					for (var i = Object.keys(list).length; i > 0; i--) { // JSON 객체의 length만큼 반복
						$('.center').prepend( // AJAX로 받아온 JSON으로 새롭게 prepend
								"<li id='cityinfo' data="+ Object.keys(list)[i - 1] + ">"
										+ "<p class='citydesc' id='citydesc'>"+ list[Object.keys(list)[i - 1]]+ "</p>" + "</li>");
					}

					document.getElementById("center").style.width = "8%"  // CSS 컨트롤
					document.getElementById("map").style.width = "87%";
					document.getElementById("tourlist").style.width = "0px";
					var cityinfolist = $('.center').children();
					var cityimagelist = document.getElementsByClassName("cityimage");
					var citydesclist = document.getElementsByClassName("citydesc");
					for (var i = 0; i < cityinfolist.length; i++) {
						cityinfolist[i].style.width = "100%";
						cityinfolist[i].style.height = "5%";
						cityinfolist[i].style.border = "1px solid gray";
						citydesclist[i].style.width = "50%";
					}
					$(".sidebar").children().removeClass("area_selected");  // 기존에 선택된 클래스 value 제거
					$this.addClass('area_selected'); // 클릭된 엘리먼트에 클래스 value 설정
				});
			});

	// 시/군/구 클릭 이벤트
	$(document).on('click','#cityinfo',function() {
						var $this = $(this);
						var areaCode = $('.area_selected').attr('data');
						var sigunguCode = $(this).attr('data');
						$('.tourlist').contents().remove(); // 기존에 존재하는 관광지 리스트를 제거
						$.ajax({
								url : 'TourList',			// 전송할 URL
								type : 'get',				// 전송 방식
								dataType : 'json',  		// 전송할 데이터의 타입
								data : {
										area : areaCode,
										sigun : sigunguCode
								}, 							// 전송할 데이터
								success : function(data) {  // 통신이 성공했다면 수행할 콜백메서드
									var myItem = data.response.body.items.item; // 필요한 데이터가 들어있는 곳으로 접근, myItem ==> 검색된 관광지의 수 
									for (var i = 0; i < myItem.length; i++) {   // 검색된 관광지의 수 만큼 반복
										mapx.push(myItem[i].mapx);
										mapy.push(myItem[i].mapy);
										var title = myItem[i].title;
										var addr1 = myItem[i].addr1;
										var addr2 = myItem[i].addr2;
										var coordx = myItem[i].mapx;
										var coordy = myItem[i].mapy;
										mapx.push(coordx);
										mapy.push(coordy);

										var contentid = myItem[i].contentid;
										var firstImage = myItem[i].firstimage;
										if (firstImage == undefined) {
											firstImage = "images/no_image.jpg";
										}
										if (addr1 == undefined) {
											addr1 = addr2;
										}
										$(".tourlist").prepend("<li class='tourinfo' id="+contentid+"><div class='tourImageDiv'><img class='tourImage' src="+firstImage+"></div>"
																+ "<div class='descwrapper'><div class='tourdescdiv' id='tourdescdiv' mapx="+coordx+" mapy="+coordy+">"
																+ "<p class='tourtitle'>"+ title+ "</p><p class='touraddr'>"+ addr1
																+ "</p></div><div class='plusbutton' id="+contentid+"><p class='plusP'>+</p></div></div></li>");
									}							// 각각의 관광지 정보를 추출하여 엘리먼트를 만들고 prepend
								},
								error : function(XMLHttpRequest,textStatus, errorThrown) { // AJAX통신이 실패했을 때
									console.log("request : "+ XMLHttpRequest);
									console.log("Status: " + textStatus);
									console.log("Error: " + errorThrown);
								}
							});

					document.getElementById("tourlist").style.width = "20%";  // CSS 컨트롤
					var tourinfo = document.getElementsByClassName("tourinfo");
					for (var i = 0; i < tourinfo.length; i++) {
						tourinfo[i].style.width = "100%";
					}
					document.getElementById("map").style.width = "67%";
					$(".center").children().removeClass("city_selected");  // 기존에 선택된 클래스의 value 제거
					$this.addClass('city_selected');					   // 클릭된 엘리먼트의 클래스 value 설정
				});

	// 각 관광지의  +버튼 클릭이벤트
	$(document).on('click','.plusbutton',function() {
						$this = $(this);
						var tourtitle = $this.prevAll("#tourdescdiv").children().eq(0).text();   // 노드 탐색
						var touraddr = $this.prevAll("#tourdescdiv").children().eq(1).text();
						var coordx = $this.prevAll("#tourdescdiv").attr("mapx");
						var coordy = $this.prevAll("#tourdescdiv").attr("mapy");
						var sl_code = $this.prevAll("#tourdescdiv").attr("slcode");
						var imagePath = $this.parent().prevAll(".tourImageDiv").children(".tourImage").attr("src");
						var contentId = $(this).attr("id");
						var plandiv = $('.plandiv');
						var areaCode = $('.area_selected').attr('data');
						var areaName = $('.area_selected').text().trim();
						var sigunguCode = $('.city_selected').attr('data');
						var sigunguName = $('.city_selected').text().trim();
						if (plandiv.children("#planelem" + contentId).attr('id')) {  // 이미 추가된 관광지 삽입 방지
							alert("이미 추가된 여행지입니다.");
						} else {													 // 추가되지 않은 관광지만 삽입 허용
							if (!plandiv.children(".day").attr("id")) {				 // Day div가 추가되어있지 않다면 추가
								plandiv.append("<div class='day' id='div"+daycount+"'><p class='daycount' id='p"+daycount+"'>&nbsp;Day "
												+ daycount
												+ "</p><div class='deleteday' id='delete"+daycount+"'>X&nbsp;</div></div>");
								plandivheight = plandivheight + 20;					 // 추가되는 div만큼 plandiv의 height 컨트롤 
								plandiv.css('height', plandivheight);				 // plandiv의 CSS 수정
								daycount = daycount + 1;
							}
							plandiv.append("<div class='planelem' seq=seq-"+ seq+ " id='planelem"+ contentId+ "' dayvalue="+ (daycount - 1)					// (데이터베이스 전송을 위해 
															  + " areaName = "+ areaName+ " areaCode="+ areaCode+ " sigunguName ="+ sigunguName				// 	담고가야할 데이터를 속성으로
															  + " sigunguCode="+ sigunguCode+ " contentId="+ contentId+ " mapx="+ coordx+ " mapy="+ coordy  //	설정하여 append
															  + " imagePath="+ imagePath+" sl_code='' sm_code='' ss_code=''><p class='elemtitle' id='elemtitle"+contentId+"'>"+ tourtitle
															  + "</p><div class='deleteelem' id='delete"+contentId+"'>X&nbsp;</div></div>");
							plandivheight = plandivheight + 22;
							plandiv.css('height', plandivheight);
						}

						var latlng = new google.maps.LatLng(coordy, coordx);	// 마커 생성을 위한 위도, 경도 객체를 생성
						var marker = new google.maps.Marker({					// 마커생성
							position : latlng,									// 마커의 위치
							map : map,											// 마커를 붙일 map 객체
							icon : 'images/marker.png'							// 마커의 이미지
						});

						markers[seq] = marker;		// 마커를 집단적으로 관리하기 위해 생성된 마커를 배열에 할당
						seq = seq + 1;				// 마커를 추가, 삭제할 때 index로 관리하기 위해 사용하는 변수
						marker.setMap(map);			// 마커를 map에 set
						map.panTo(latlng);			// 지도 시점 이동
						map.setZoom(15, true);		// 지도 Zoom 정도 조정
						removeLines();				// 현재 렌더된 선들을 제거하는 메서드
						drawLines();				// 현재 선택된 관광지를 잇는 선을 그리는 메서드
					});

	// 플래너의 X버튼 클릭이벤트
	$(document).on('click', '.deleteelem', function() {
		$this = $(this);
		var plandiv = $(".plandiv");
		var deleteid = $this.attr('id');
		var parsedid = deleteid.substring(6, deleteid.length);	// plan에 추가된 관광지를 삭제하기
		var parseddiv = "#planelem" + parsedid;					// 노트 탐색을위한 텍스트 파싱작업
		var parsedtitle = "#elemtitle" + parsedid;
		var parseddelete = "#delete" + parsedid;
		var seqInDiv = $this.parent().attr('seq');
		var parsedSeq = seqInDiv.substr(4, seqInDiv.length);
		//console.log("parsedSeq : " + parsedSeq);
		plandivheight = plandivheight - 22;
		plandiv.css('height', plandivheight);
		$(parseddiv).remove();					// 엘리먼트들을 제거하는 메서드
		$(parsedtitle).remove();
		$(parseddelete).remove();

		//console.log("markers before remove : " + markers);
		markers[parsedSeq].setMap(null);						// 마커를 맵에서 떼어냄
		delete markers[parsedSeq];								// 마커 배열에서 제거
		//console.log("markers after remove: " + markers);
		removeLines();
		drawLines();

	});

	// 1일+ 클릭 이벤트
	$(document).on('click','.dayplus',function() {
						var plandiv = $(".plandiv");
						plandivheight = plandivheight + 20;
						plandiv.append("<div class='day' id='div"+daycount+"'><p class='daycount' id='p"+daycount+"'>&nbsp;Day "
										+ daycount
										+ "</p><div class='deleteday' id='delete"+daycount+"'>X&nbsp;</div></div>");
						plandiv.css('height', plandivheight);
						daycount = daycount + 1;
					});

	// 일 X 클릭 이벤트
	$(document).on('click', '.deleteday', function() {
		var deleteid = $(this).attr('id');
		var plandiv = $('.plandiv');
		var parsedid = deleteid.substring(6, deleteid.length);
		var divid = "#div" + parsedid;
		var pid = "#p" + parsedid;

		deleteid = "#delete" + parsedid;
		daycount = daycount - 1;
		plandivheight = plandivheight - 20;
		plandiv.css('height', plandivheight);

		$(divid).remove();
		$(pid).remove();
		$(deleteid).remove();
	});

	// 마커 사이를 잇는 선을 그리는 메서드
	function drawLines() {
		path = new google.maps.Polyline({
			path : getLocations(),	// 위경도 정보가 들어있는 배열
			geodesic : true,		// ??
			strokeColor : 'black',  // 선 색상
			strokeOpacity : 1.0,	// 선 투명도
			strokeWeight : 2		// 선 두께
		});
		path.setMap(map);			// 생성된 선을 map에 붙임
	}

	// 현재 지도위에 렌더된 선을 지우는 메서드
	function removeLines() {
		if (path != null) {
			path.setMap(null);
			path = null;
		}
	}

	// 현재 생성된 마커의 경,위도를 추출하여 배열로 리턴하는 메서드
	function getLocations() {
		var planelem = $('.planelem');
		var locations = [];
		console.log("planelem : " + planelem);
		jQuery.each(planelem, function(index, value) {
			var mapx = $(value).attr('mapx');
			var mapy = $(value).attr('mapy');
			var location = new google.maps.LatLng(mapy, mapx);
			locations.push(location);
		});
		return locations;
	}

	
	$(document).on('click', '#wishList', function(){
		console.log("clicked");
		
		
	});
	
	
	// 서울, 인천 등 을 클릭했을 때 맵을 이동시키는 메서드
	$(document).on('click', '#sidebar-menu', function(e) {
		/* 좌표 미세조정 */
		var $this = $(this).attr('data');
		if ($this == '1') {
			e.preventDefault();
			map.panTo({
				lat : 37.566662,
				lng : 126.978424
			});
			map.setZoom(12, true);
		} else if ($this == '2') {
			var incheon = new google.maps.LatLng(37.4261057, 126.7530724);
			e.preventDefault();
			map.panTo(incheon);
			map.setZoom(12, true);
		} else if ($this == '3') {
			var daejeon = new google.maps.LatLng(36.300412, 127.4823583);
			e.preventDefault();
			map.panTo(daejeon);
			map.setZoom(12, true);
		} else if ($this == '4') {
			var daegu = new google.maps.LatLng(35.8319559, 128.6923414);
			e.preventDefault();
			map.panTo(daegu);
			map.setZoom(12, true);
		} else if ($this == '5') {
			var gwangju = new google.maps.LatLng(35.1100765, 126.9491083);
			e.preventDefault();
			map.panTo(gwangju);
			map.setZoom(12, true);
		} else if ($this == '6') {
			var busan = new google.maps.LatLng(35.12951, 129.171666);
			e.preventDefault();
			map.panTo(busan);
			map.setZoom(12, true);
		} else if ($this == '7') {
			var ulsan = new google.maps.LatLng(35.488739, 129.4091703);
			e.preventDefault();
			map.panTo(ulsan);
			map.setZoom(12, true);
		} else if ($this == '8') {
			var sejong = new google.maps.LatLng(36.4300984, 127.3890354);
			e.preventDefault();
			map.panTo(sejong);
			map.setZoom(12, true);
		} else if ($this == '31') {
			var kk = new google.maps.LatLng(37.214627, 127.10953);
			e.preventDefault();
			map.panTo(kk);
			map.setZoom(9, true);
		} else if ($this == '32') {
			var kw = new google.maps.LatLng(37.819157, 128.153092);
			e.preventDefault();
			map.panTo(kw);
			map.setZoom(9, true);
		} else if ($this == '33') {
			var cb = new google.maps.LatLng(37.001801, 127.699625);
			e.preventDefault();
			map.panTo(cb);
			map.setZoom(9, true);
		} else if ($this == '34') {
			var cn = new google.maps.LatLng(37.001801, 127.699625);
			e.preventDefault();
			map.panTo(cn);
			map.setZoom(9, true);
		} else if ($this == '35') {
			var kb = new google.maps.LatLng(36.294101, 128.890085);
			e.preventDefault();
			map.panTo(kb);
			map.setZoom(9, true);
		} else if ($this == '36') {
			var kn = new google.maps.LatLng(35.462191, 128.207913);
			e.preventDefault();
			map.panTo(kn);
			map.setZoom(9, true);
		} else if ($this == '37') {
			var jb = new google.maps.LatLng(35.717958, 127.154594);
			e.preventDefault();
			map.panTo(jb);
			map.setZoom(9, true);
		} else if ($this == '38') {
			var jn = new google.maps.LatLng(34.870864, 126.994047);
			e.preventDefault();
			map.panTo(jn);
			map.setZoom(9, true);
		} else if ($this == '39') {
			var jj = new google.maps.LatLng(33.382297, 126.552247);
			e.preventDefault();
			map.panTo(jj);
			map.setZoom(11, true);
		}
	});

	// googlemap을 초기화하는 메서드
	function initMap() {
		var area = document.getElementsByClassName('sidebar-menu');
		var center = {
			lat : 36.543583,
			lng : 127.859900
		};
		map = new google.maps.Map(document.getElementById('map'), {
			zoom : 7,
			center : center,
			gestureHandling : 'greedy'
		});
	};
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBnkgSC0SDpUzIBHXo7NrQKEnt0T0CpQK8&callback=initMap"></script>
</head>
<body>
	<%
		/* if(request.getAttribute("loadJsonArr") != null){
			System.out.println("loadJsonArr in planner.jsp : " + request.getAttribute("loadJsonArr").toString());	
		}else if(request.getAttribute("loadJsonArr") == null){
			System.out.println("empty!!!!!!");
		} */
		request.setAttribute("status", request.getAttribute("status"));
		System.out.println("status in planner.jsp : " + request.getAttribute("status"));
	%>
	<%
		if (session.getAttribute("email") == null) {
	%>
	<script type="text/javascript">
		alert("로그인이 필요한 서비스 입니다.");
		location.href = "loginForm.do";
	</script>
	<%
		}
	%>

	<div class="section">
		${areasMap }
		<ul class="sidebar">
			<li id = "wishList">☆</li>
			<c:forEach var="areaMap" items="${areasList}">
				<li id="sidebar-menu" data="${areaMap.code }">
					<p class="sidedesc" id="sidedesc">${areaMap.name }</p>
				</li>
			</c:forEach>
		</ul>

		<ul class="center" id="center">

		</ul>

		<ul class="tourlist" id="tourlist">

		</ul>

		<div class="wrapper" id="wrapper">
			<div class="map" id="map"></div>
			<div class="plandiv" id="plandiv">
				<div class="plantop" id="plantop">PLAN</div>
				<div class="dayplus" id="dayplus">1일 +</div>
				<div class="completebtn" id="completebtn">저장</div>
			</div>
		</div>
	</div>
	<aside id="default-popup" class="avgrund-popup">
	<h2>저장</h2>
	<form action="plannerDetail.jsp" method="post" id="form">
		<label>플랜 제목 : </label> <input type="text" name="title" id="title" class="inputs" required> <br>
	    <label>출발일 : </label> <input type="date" name="date" class="inputs" required> <br> 
		<input	type="submit" value="전송">
	</form>
	</aside>
	<div class="avgrund-cover"></div>

	<script type="text/javascript" src="js/avgrund.js"></script>
	<script type="text/javascript"
		src="http://platform.twitter.com/widgets.js"></script>

</body>
</html>
