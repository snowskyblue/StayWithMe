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
	padding-top: 150px;
}

#border {
	border: 3px solid #000000;
	/*border-collapse: collapse;*/
}

.form-group label, .container h3, .container h4 {
	font-family: 'S-CoreDream-2ExtraLight';
	font-weight: bold;
}

.mapcont {
	width: 40%;
    position: fixed;
    bottom: 0px;
    top: 110px;
    left: 0;
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
    margin-left: 40%;
    top: 110px;
    right: 0;
    bottom: 0;
    overflow: scroll;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<div class="main">
	<div class="container" id="csM-header">
		<h3>1:1 문의</h3>
		<div id="border"></div>
		
		<div class="mx-auto">
			<div class="mx-auto">
				<section class="mapcont">
					<div id="map"></div>
				</section>
				<section class="acmList">
				</section>
			</div>
		</div>
		

	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?&key=AIzaSyAneA2YbKfpf0Lwti8iT1ib95kfizWeNo8"></script>
<script>

$(document).ready(function() {
	$(".menu-toggle").click(function() {
		$("nav").toggleClass("active");
		$(".main").toggleClass("main1");
	});
});

var contentArray = [];
var iConArray = [];
var markers = [];
var iterator = 0;
var markerArray = [];
var map;
 
// infowindow contents 배열
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
/*
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
 
google.maps.event.addDomListener(window, 'load', initialize);

</script>
</body>
</html>