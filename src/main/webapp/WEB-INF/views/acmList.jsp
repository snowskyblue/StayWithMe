<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Insert title here</title>
<style>
.main1 {
	margin-top: 100px;
}

#csM-header {
	padding-top: 110px;
}

.container-fluid h3 {
	margin-top: 20px;
}

#border {
	border: 3px solid #000000;
	margin-bottom: 30px;
	/*border-collapse: collapse;*/
}

.form-group label, .container-fluid h3, .container-fluid h4 {
	font-family: 'S-CoreDream-2ExtraLight';
	font-weight: bold;
}

.mapcont {
	width: 40%;
    position: fixed;
    bottom: 0px;
    top: 100px;
    left: 0;
    z-index: 1;
    /*top: 0;*/
}

#map{
    position: relative;
    overflow: hidden;
    height: 100%;
    width: 100%;
}

.acmList {
	width: 60%;
    position: fixed;
    margin-left: 50%;
    top: 100px;
    right: 0;
    bottom: 0;
    overflow: auto;
    /*z-index: 1;
    top: 0;*/
}

.listForm {
	display : flex;
	align-items: center;
	width : 100%;
	height : 250px;
	border-bottom: 1px solid lightgrey;
	border-top: 1px solid lightgrey;
	border-collapse: collapse;
}

.listSection {
	position: fixed;
	/*margin : 0 auto;*/
	width : 85%;
	height : 85%;
}

.lsImgDiv {
	display: inline-block;
	float: right;
	width: 300px;
	height: 200px;
}

.lsImg {
	width: 300px;
	height: 200px;
}

.lsConDiv {
	float: left;
	display: block;
	padding-left: 20px;
	width: 600px;
}

.contHead {
	font-size: 13px;
}

.lsConDivMobile {
	display: none;
}
@media screen and (min-width: 1000px) and (max-width: 1300px) {
	.mapcont {
		width: 30%;
		position: fixed;
	}
	.acmList {
		width: 70%;
		position: fixed;
	}
	
	.lsConDiv {
		width: 400px;
	}
}

@media screen and (max-width: 1000px) {
	#csM-header {
		padding-top: 120px;
	}
	.mapcont {
		display: none;
	}
	
	.acmList {
		margin-left: 0;
		position: relative;
		top: 0;
		width: 100%;
	}
	
	.lsConDiv {
		width: 550px;
	}
}

@media screen and (max-width: 640px) {
	.listForm {
		height: 460px;
		align-items: normal;
		padding-top: 10px;
		display: inline-block;
	}
	
	.lsImgDiv {
		width: 100%;
    	height: 350px;
	}
	.lsImg {
		width: 100%;
    	height: 350px;
	}
	
	.lsConDiv {
		display: none;
	}
	
	.lsConDivMobile {
		display: block;
	}
}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<div class="main">
	<div class="container-fluid" id="csM-header">
		
		
		<div class="mx-auto">
			<div class="mx-auto">
				<section class="mapcont">
					<div id="map"></div>
				</section>
				<section class="acmList">
					<div style="margin-top:40px; width: 90%;" class="mx-auto">
						<h3>숙소리스트</h3>
						<div id="border"></div>
					</div>
					<c:forEach items="${list}" var="list">
						<div class="section mx-auto d-flex flex-wrap align-content-center container-fluid" value="${list.acm_address}">
							<div class="listForm">
								<!-- <div class = "listSection d-flex flex-wrap align-content-center container-fluid" id ="listFormInner"> -->
									<div class="lsImgDiv">
										<img src="/stay/resources/upImg/${list.acm_thumbnail}" class="lsImg">
									</div>
									<div class="lsConDiv my-auto">
										<c:choose>
											<c:when test="${list.acm_type eq 'apt'}">
												<span class="contHead">아파트</span>
											</c:when>
											<c:when test="${list.acm_type eq 'flat'}">
												<span class="contHead">주택</span>
											</c:when>
											<c:when test="${list.acm_type eq 'guestHouse'}">
												<span class="contHead">게스트하우스</span>
											</c:when>
											<c:when test="${list.acm_type eq 'villa'}">
												<span class="contHead">빌라</span>
											</c:when>
											<c:when test="${list.acm_type eq 'Hanok'}">
												<span class="contHead">한옥스테이</span>
											</c:when>
											<c:when test="${list.acm_type eq pension}">
												<span class="contHead">펜션</span>
											</c:when>
											<c:otherwise>
												<span class="contHead">템플스테이</span>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${list.acm_room_type eq 'wholeH'}">
												<span class="contHead">&nbsp;&nbsp;전체</span>
											</c:when>
											<c:when test="${list.acm_room_type eq 'exclusiveR'}">
												<span class="contHead">&nbsp;&nbsp;개인실</span>
											</c:when>
											<c:when test="${list.acm_room_type eq 'shareR'}">
												<span class="contHead">&nbsp;&nbsp;다인실</span>
											</c:when>
										</c:choose>
										<br/>
										<span id="address">${list.acm_address}</span>
										<!-- <input type="hidden" name="address" value="${list.acm_address}"> -->
										<h4 style="margin-top:10px; word-break: keep-all;">${list.acm_title}</h4>
										<span>인원 ${list.acm_guest_num}명 /</span>
										<span> 침실 ${list.acm_room_num}개 /</span>
										<c:choose>
											<c:when test="${list.acm_bedding eq 'bed'}">
												<span> 침대 /</span>
											</c:when>
											<c:otherwise>
												<span> 온돌방 /</span>
											</c:otherwise>
										</c:choose>
										<span> 화장실 ${list.acm_bath_num}개</span>
										<h4 style="margin-top:10px; color:#ec6969;">
											${list.acm_charge}
											<span style="color:black; font-size:0.9rem;"> /1박</span>
										</h4>
									</div>
									<br/>
									<div class="lsConDivMobile my-auto">
										
										<c:choose>
											<c:when test="${list.acm_type eq 'apt'}">
												<span class="contHead">아파트</span>
											</c:when>
											<c:when test="${list.acm_type eq 'flat'}">
												<span class="contHead">주택</span>
											</c:when>
											<c:when test="${list.acm_type eq 'guestHouse'}">
												<span class="contHead">게스트하우스</span>
											</c:when>
											<c:when test="${list.acm_type eq 'villa'}">
												<span class="contHead">빌라</span>
											</c:when>
											<c:when test="${list.acm_type eq 'Hanok'}">
												<span class="contHead">한옥스테이</span>
											</c:when>
											<c:when test="${list.acm_type eq pension}">
												<span class="contHead">펜션</span>
											</c:when>
											<c:otherwise>
												<span class="contHead">템플스테이</span>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${list.acm_room_type eq 'wholeH'}">
												<span class="contHead">&nbsp;&nbsp;전체</span>
											</c:when>
											<c:when test="${list.acm_room_type eq 'exclusiveR'}">
												<span class="contHead">&nbsp;&nbsp;개인실</span>
											</c:when>
											<c:when test="${list.acm_room_type eq 'shareR'}">
												<span class="contHead">&nbsp;&nbsp;다인실</span>
											</c:when>
										</c:choose>
										<h4 style="margin-top:10px; word-break: keep-all;">${list.acm_title}</h4>
									</div>
									
								<!-- </div> -->
							</div>
						</div>
					</c:forEach>
					
				</section>
			</div>
		</div>
		

	</div>
</div>


<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?&key=AIzaSyB_AJKPN0Wc4MHuwPgdbLdzCeqRk4hGDV8&callback=initMap"></script>


<script>

$(document).ready(function() {
	$(".menu-toggle").click(function() {
		$("nav").toggleClass("active");
		$(".main").toggleClass("main1");
	});
});

function initMap() {
	var map = new google.maps.Map(document.getElementById("map"), {
		zoom: 11,
		center: {
			lat: 37.564524,
			lng: 126.973872
		}
	});
	var geocoder = new google.maps.Geocoder();
	
	//geocodeAddress(geocoder, map);
	var addressArray = [];
	$(".section").each(function(){
		var value = $(this).attr("value");
		addressArray.push(value);
	});
	
	var xObject = [];
	var markers = [];
	var info = [];
	var total = addressArray.length;
	var counter = 0;
	
	//alert(addressArray[0]);
	
	addressArray.forEach(function(addr) {
		geocoder.geocode({'address':addr}, function(result, status) {
			console.log(result);
			console.log(status);
			xObject.push({
				"addr" : addr,
				"lat" : result[0].geometry.location.lat(),
				"lng" : result[0].geometry.location.lng()
			});
			
			counter++;
			
			var marker, i;
			if(total === counter) {
				for(i = 0 ; i < total ; i++) {
					marker = new google.maps.Marker({
						id:xObject[i].addr,
						position: new google.maps.LatLng(xObject[i].lat, xObject[i].lng),
						map: map,
						icon: "https://maps.google.com/mapfiles/ms/icons/blue-dot.png"
					});
					
					markers.push(marker);
					
					var infowindow = new google.maps.InfoWindow({
						content:xObject[i].addr,
						id:xObject[i].addr,
						disableAutoPan: true
					});
					
					info.push(infowindow);
					
					//infowindow.open(map, markers[i]);
					
					/*function hand(k) {
						return function(e) {
							
							if(info[k].getMap()) {
								info[k].close();
								markers[0].setIcon("https://maps.google.com/mapfiles/ms/icons/blue-dot.png");
							}
							else {
								info[k].open(map, markers[0]);
								markers[0].setIcon("https://maps.google.com/mapfiles/ms/icons/red-dot.png");
							}
						}
					}
					for(var k = 0, kk = markers.length; k<kk; k++) {
						if(info[k].id == markers[0].id) {
							google.maps.event.addListener(markers[0], "click", hand(k));
							
						}
					}
					function hand(k) {
						return function(e) {
							
							if(info[k].getMap()) {
								info[k].close();
								markers[0].setIcon("https://maps.google.com/mapfiles/ms/icons/blue-dot.png");
							}
							else {
								info[k].open(map, markers[1]);
								markers[0].setIcon("https://maps.google.com/mapfiles/ms/icons/red-dot.png");
							}
						}
					}
					for(var k = 0, kk = markers.length; k<kk; k++) {
						if(info[k].id == markers[1].id) {
							google.maps.event.addListener(markers[1], "click", hand(k));
							
						}
					}*/
				}
				function hand0(k) {
					return function(e) {
						
						if(info[k].getMap()) {
							info[k].close();
							markers[0].setIcon("https://maps.google.com/mapfiles/ms/icons/blue-dot.png");
						}
						else {
							info[k].open(map, markers[0]);
							markers[0].setIcon("https://maps.google.com/mapfiles/ms/icons/red-dot.png");
						}
					}
				}
				for(var k = 0, kk = markers.length; k<kk; k++) {
					if(info[k].id == markers[0].id) {
						google.maps.event.addListener(markers[0], "click", hand0(k));
						
					}
				}
				function hand1(k) {
					return function(e) {
						
						if(info[k].getMap()) {
							info[k].close();
							markers[1].setIcon("https://maps.google.com/mapfiles/ms/icons/blue-dot.png");
						}
						else {
							info[k].open(map, markers[1]);
							markers[1].setIcon("https://maps.google.com/mapfiles/ms/icons/red-dot.png");
						}
					}
				}
				for(var k = 0, kk = markers.length; k<kk; k++) {
					if(info[k].id == markers[1].id) {
						google.maps.event.addListener(markers[1], "click", hand1(k));
						
					}
				}
				function hand2(k) {
					return function(e) {
						
						if(info[k].getMap()) {
							info[k].close();
							markers[2].setIcon("https://maps.google.com/mapfiles/ms/icons/blue-dot.png");
						}
						else {
							info[k].open(map, markers[2]);
							markers[2].setIcon("https://maps.google.com/mapfiles/ms/icons/red-dot.png");
						}
					}
				}
				for(var k = 0, kk = markers.length; k<kk; k++) {
					if(info[k].id == markers[2].id) {
						google.maps.event.addListener(markers[2], "click", hand2(k));
						
					}
				}
				function hand3(k) {
					return function(e) {
						
						if(info[k].getMap()) {
							info[k].close();
							markers[3].setIcon("https://maps.google.com/mapfiles/ms/icons/blue-dot.png");
						}
						else {
							info[k].open(map, markers[3]);
							markers[3].setIcon("https://maps.google.com/mapfiles/ms/icons/red-dot.png");
						}
					}
				}
				for(var k = 0, kk = markers.length; k<kk; k++) {
					if(info[k].id == markers[3].id) {
						google.maps.event.addListener(markers[3], "click", hand3(k));
						
					}
				}
				function hand4(k) {
					return function(e) {
						
						if(info[k].getMap()) {
							info[k].close();
							markers[4].setIcon("https://maps.google.com/mapfiles/ms/icons/blue-dot.png");
						}
						else {
							info[k].open(map, markers[4]);
							markers[4].setIcon("https://maps.google.com/mapfiles/ms/icons/red-dot.png");
						}
					}
				}
				for(var k = 0, kk = markers.length; k<kk; k++) {
					if(info[k].id == markers[4].id) {
						google.maps.event.addListener(markers[4], "click", hand4(k));
						
					}
				}
				
				$(".section").eq(0).mouseover(function() {
					for(var j = 0; j < total; j++) {
						if(markers[j].id == $(".section").eq(0).attr("value")) {
							markers[j].setIcon("https://maps.google.com/mapfiles/ms/icons/red-dot.png");
							map.setCenter(new google.maps.LatLng(xObject[j].lat, xObject[j].lng));
						}
					}
				});
				$(".section").eq(0).mouseout(function() {
					for(var j = 0; j < total; j++) {
						if(markers[j].id == $(".section").eq(0).attr("value")) {
							markers[j].setIcon("https://maps.google.com/mapfiles/ms/icons/blue-dot.png");
						}
					}
				});
				$(".section").eq(1).mouseover(function() {
					for(var j = 0; j < total; j++) {
						if(markers[j].id == $(".section").eq(1).attr("value")) {
							markers[j].setIcon("https://maps.google.com/mapfiles/ms/icons/red-dot.png");
							map.setCenter(new google.maps.LatLng(xObject[j].lat, xObject[j].lng));
						}
					}
				});
				$(".section").eq(1).mouseout(function() {
					for(var j = 0; j < total; j++) {
						if(markers[j].id == $(".section").eq(1).attr("value")) {
							markers[j].setIcon("https://maps.google.com/mapfiles/ms/icons/blue-dot.png");
						}
					}
				});
				$(".section").eq(2).mouseover(function() {
					for(var j = 0; j < total; j++) {
						if(markers[j].id == $(".section").eq(2).attr("value")) {
							markers[j].setIcon("https://maps.google.com/mapfiles/ms/icons/red-dot.png");
							map.setCenter(new google.maps.LatLng(xObject[j].lat, xObject[j].lng));
						}
					}
				});
				$(".section").eq(2).mouseout(function() {
					for(var j = 0; j < total; j++) {
						if(markers[j].id == $(".section").eq(2).attr("value")) {
							markers[j].setIcon("https://maps.google.com/mapfiles/ms/icons/blue-dot.png");
						}
					}
				});
				$(".section").eq(3).mouseover(function() {
					for(var j = 0; j < total; j++) {
						if(markers[j].id == $(".section").eq(3).attr("value")) {
							markers[j].setIcon("https://maps.google.com/mapfiles/ms/icons/red-dot.png");
						}
					}
				});
				$(".section").eq(3).mouseout(function() {
					for(var j = 0; j < total; j++) {
						if(markers[j].id == $(".section").eq(3).attr("value")) {
							markers[j].setIcon("https://maps.google.com/mapfiles/ms/icons/blue-dot.png");
						}
					}
				});
				$(".section").eq(4).mouseover(function() {
					for(var j = 0; j < total; j++) {
						if(markers[j].id == $(".section").eq(4).attr("value")) {
							markers[j].setIcon("https://maps.google.com/mapfiles/ms/icons/red-dot.png");
						}
					}
				});
				$(".section").eq(4).mouseout(function() {
					for(var j = 0; j < total; j++) {
						if(markers[j].id == $(".section").eq(4).attr("value")) {
							markers[j].setIcon("https://maps.google.com/mapfiles/ms/icons/blue-dot.png");
						}
					}
				});
				/*$(".section").eq(5).mouseover(function() {
					for(var j = 0; j < total; j++) {
						if(markers[j].id == $(".section").eq(5).attr("value")) {
							markers[j].setIcon("https://maps.google.com/mapfiles/ms/icons/red-dot.png");
						}
					}
				});
				$(".section").eq(5).mouseout(function() {
					for(var j = 0; j < total; j++) {
						if(markers[j].id == $(".section").eq(5).attr("value")) {
							markers[j].setIcon("https://maps.google.com/mapfiles/ms/icons/blue-dot.png");
						}
					}
				});
				$(".section").eq(6).mouseover(function() {
					for(var j = 0; j < total; j++) {
						if(markers[j].id == $(".section").eq(6).attr("value")) {
							markers[j].setIcon("https://maps.google.com/mapfiles/ms/icons/red-dot.png");
						}
					}
				});
				$(".section").eq(6).mouseout(function() {
					for(var j = 0; j < total; j++) {
						if(markers[j].id == $(".section").eq(6).attr("value")) {
							markers[j].setIcon("https://maps.google.com/mapfiles/ms/icons/blue-dot.png");
						}
					}
				});
				$(".section").eq(7).mouseover(function() {
					for(var j = 0; j < total; j++) {
						if(markers[j].id == $(".section").eq(7).attr("value")) {
							markers[j].setIcon("https://maps.google.com/mapfiles/ms/icons/red-dot.png");
						}
					}
				});
				$(".section").eq(7).mouseout(function() {
					for(var j = 0; j < total; j++) {
						if(markers[j].id == $(".section").eq(7).attr("value")) {
							markers[j].setIcon("https://maps.google.com/mapfiles/ms/icons/blue-dot.png");
						}
					}
				});
				$(".section").eq(8).mouseover(function() {
					for(var j = 0; j < total; j++) {
						if(markers[j].id == $(".section").eq(8).attr("value")) {
							markers[j].setIcon("https://maps.google.com/mapfiles/ms/icons/red-dot.png");
						}
					}
				});
				$(".section").eq(8).mouseout(function() {
					for(var j = 0; j < total; j++) {
						if(markers[j].id == $(".section").eq(8).attr("value")) {
							markers[j].setIcon("https://maps.google.com/mapfiles/ms/icons/blue-dot.png");
						}
					}
				});
				$(".section").eq(9).mouseover(function() {
					for(var j = 0; j < total; j++) {
						if(markers[j].id == $(".section").eq(9).attr("value")) {
							markers[j].setIcon("https://maps.google.com/mapfiles/ms/icons/red-dot.png");
						}
					}
				});
				$(".section").eq(9).mouseout(function() {
					for(var j = 0; j < total; j++) {
						if(markers[j].id == $(".section").eq(9).attr("value")) {
							markers[j].setIcon("https://maps.google.com/mapfiles/ms/icons/blue-dot.png");
						}
					}
				});*/
				
			}
			
			/*function showMarker(map, marker) {
				if(marker.setMap()) return;
				marker.setMap(map);
			}
			
			function hideMarker(map, marker) {
				if(!marker.setMap()) return;
				marker.setMap(null);
			}
			
			function getClickHandler(seq) {
				return function(e) {
					var marker = markers[seq],
						infowindow = info[seq];
					
					
					if(infowindow.getMap()) {
						infowindow.close();
					}
					else {
						infowindow.open(map, marker);
					}
					
				}
			}
			
			for(var k = 0, kk = markers.length; k<kk; k++) {
				google.maps.event.addListener(markers[k], "click", getClickHandler(k));
			}*/
		});
		
	});
}


</script>
</body>
</html>