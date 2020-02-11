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
	width: 450px;
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
		height: 500px;
		align-items: normal;
		padding-top: 10px;
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
						<div class="mx-auto d-flex flex-wrap align-content-center container-fluid">
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
										<span>${list.acm_address}</span>
										<input type="hidden" name="address" value="${list.acm_address}">
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
		//$(".mapcont").toggleClass("main1");
		//$(".acmList").toggleClass("main1");
		//$().css("top", "200px");
		//$(".acmList").css("top", "200px");
	});
	
	//geocodeAddress(geocoder, map);
	
	
	
	
});

var address = new Array();
//address = document.getElementsByClassName("address").value;
address = document.getElementsByName("address");
//var address = '서울 중구 명동길 11 (명동1가)';
/*var contentArray = [];
var iConArray = [];
var markers = [];
var iterator = 0;
var markerArray = [];
var map;*/

function initMap() {
	var map = new google.maps.Map(document.getElementById("map"), {
		zoom: 12.5,
		center: {
			lat: -34.397,
			lng: 150.644
		}
	});
	var geocoder = new google.maps.Geocoder();
	
	geocodeAddress(geocoder, map);
}

function geocodeAddress(geocoder, resultMap) {

	
	for(var i = 0; i < 3; i++) {
		var a = address[i].value;
		
		geocoder.geocode({'address':a}, function(result, status) {
			console.log(result);
			console.log(status);
			
			if(status == 'OK') {
				resultMap.setCenter(result[0].geometry.location);
				resultMap.setZoom(11);
				var marker = new google.maps.Marker({
					map: resultMap,
					position: result[0].geometry.location
				});
				
				console.log("위도 : " + marker.position.lat());
				console.log("경도 : " + marker.position.lng());
				
			}
			else {
				alert("실패");
			}
		});
		
	}
	
		

}

//window.onload = 
/*
var array1 = new Array();
var array2 = new Array();
$(".editor").eq(0).find('figure img').each(function(){
	
	var value = $(this).attr("src");
	value = "<img src= '" + value + "' >";
	array1.push(value);
	console.log(array1);
	$("#s0").html(array1);
});
$(".editor").eq(1).find('figure img').each(function(){
	
	var value = $(this).attr("src");
	value = "<img src= '" + value + "' >";
	array2.push(value);
	console.log(array2);
	$("#s1").html(array2);
});*/



 
/* infowindow contents 배열
 contentArray[0] = "Kay";
 contentArray[1] = "uhoons blog";
 contentArray[2] = "blog.uhoon.co.kr";
 contentArray[3] = "blog.uhoon.co.kr ";
 contentArray[4] = "blog.uhoon.co.kr";
 contentArray[5] = "blog.goodkiss.co.kr";
 contentArray[6] = "GG";
 contentArray[7] = "blog.goodkiss.co.kr";
 contentArray[8] = "II";
 contentArray[9] = "blog.goodkiss.co.kr";
 
// marker icon 배열
 iConArray[0] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
 iConArray[1] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
 iConArray[2] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
 iConArray[3] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
 iConArray[4] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
 iConArray[5] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
 iConArray[6] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
 iConArray[7] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
 iConArray[8] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
 iConArray[9] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
 
// 위경도 배열

var markerArray = [ new google.maps.LatLng(40.3938,-3.7077)
, new google.maps.LatLng(40.45038,-3.69803)
, new google.maps.LatLng(40.45848,-3.69477)
, new google.maps.LatLng(40.40672,-3.68327)
, new google.maps.LatLng(40.43672,-3.62093)
, new google.maps.LatLng(40.46725,-3.67443)
, new google.maps.LatLng(40.43794,-3.67228)
, new google.maps.LatLng(40.46212,-3.69166)
, new google.maps.LatLng(40.41926,-3.70445)
, new google.maps.LatLng(40.42533,-3.6844)
];
*/
/*
markerArray[0] = new google.maps.LatLng(40.3938,-3.7077);
markerArray[1] = new google.maps.LatLng(40.45038,-3.69803);
markerArray[2] = new google.maps.LatLng(40.45848,-3.69477);
markerArray[3] = new google.maps.LatLng(40.40672,-3.68327);
markerArray[4] = new google.maps.LatLng(40.43672,-3.62093);
markerArray[5] = new google.maps.LatLng(40.46725,-3.67443);
markerArray[6] = new google.maps.LatLng(40.43794,-3.67228);
markerArray[7] = new google.maps.LatLng(40.46212,-3.69166);
markerArray[8] = new google.maps.LatLng(40.41926,-3.70445);
markerArray[9] = new google.maps.LatLng(40.42533,-3.6844);
 
function initialize() {
    var mapOptions = {
        zoom: 11,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        center: new google.maps.LatLng(40.4167754,-3.7037901999999576)
    };
 
    map = new google.maps.Map(document.getElementById('map'),mapOptions);
 
    for (var i = 0; i < markerArray.length; i++) {
        addMarker();
    }
}
 
 
// 마커 추가
function addMarker() {
 
    var marker = new google.maps.Marker({
        position: markerArray[iterator],
        map: map,
        draggable: false,
        icon: iConArray[iterator]
    });
    markers.push(marker);
 
    var infowindow = new google.maps.InfoWindow({
      content: contentArray[iterator]
    });
 
    google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map,marker);
    });
    iterator++;
}
 
google.maps.event.addDomListener(window, 'load', initialize);*/
</script>
</body>
</html>