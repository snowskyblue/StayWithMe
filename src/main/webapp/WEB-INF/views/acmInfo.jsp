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
<!-- datepicker -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- multi date picker 추가 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker3.min.css">

<title>숙소 정보</title>
<style>
.main1 {
	margin-top: 100px;
}

#acmInfo-header {
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

a{
	color: black!important;
}

.mainDiv {
	margin-top: 40px;
    width: 90%;
    margin-bottom: 150px;
}

.option {
	padding:10px 0px;
	font-weight:bold;
}

#title {
	word-break: keep-all;
	margin-bottom: 10px;
    padding: 10px 0px;
    border-top: 2px solid black;
    border-bottom: 2px solid black;
    text-align: center;
}

.amenity {
	width:140px;
	display:inline-block;
}

.ck-widget img {
	width: 100%;
}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<div class="main">
	<div class="container" id="acmInfo-header">
		<h3>숙소 정보</h3>
		<div id="border"></div>
		
		<div class="mainDiv mx-auto">
			<div class = "row" style = "margin-botoom : 300px">
				<div class = "col-sm-8">
					<div class="option">
						<i class="fas fa-home"></i>
						<c:choose>
							<c:when test="${acmInfo[0].acm_type eq 'apt'}">
								<span class="contHead">아파트</span>
							</c:when>
							<c:when test="${acmInfo[0].acm_type eq 'flat'}">
								<span class="contHead">주택</span>
							</c:when>
							<c:when test="${acmInfo[0].acm_type eq 'guestHouse'}">
								<span class="contHead">게스트하우스</span>
							</c:when>
							<c:when test="${acmInfo[0].acm_type eq 'villa'}">
								<span class="contHead">빌라</span>
							</c:when>
							<c:when test="${acmInfo[0].acm_type eq 'Hanok'}">
								<span class="contHead">한옥스테이</span>
							</c:when>
							<c:when test="${acmInfo[0].acm_type eq pension}">
								<span class="contHead">펜션</span>
							</c:when>
							<c:otherwise>
								<span class="contHead">템플스테이</span>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${acmInfo[0].acm_room_type eq 'wholeH'}">
								<span class="contHead">&nbsp;전체</span>
								<br/>
								<span style="font-weight:normal;">게스트가 숙소 전체를 다른 사람과 공유하지 않고 단독으로 이용합니다. 일반적으로 침실, 욕실, 부엌이 포함됩니다.</span>
							</c:when>
							<c:when test="${acmInfo[0].acm_room_type eq 'exclusiveR'}">
								<span class="contHead">&nbsp;개인실</span>
								<br/>
								<span style="font-weight:normal;">게스트에게 개인 침실이 제공됩니다. 침실 이외의 공간은 공용일 수 있습니다.</span>
							</c:when>
							<c:when test="${acmInfo[0].acm_room_type eq 'shareR'}">
								<span class="contHead">&nbsp;다인실</span>
							</c:when>
						</c:choose>
					</div>
					<div class="option" style="border-top: 1px solid lightgray;">
						<i class="fas fa-home"></i>
						숙소 정보
						<br/>
						<span style="font-size:14px;font-weight:normal;">
							인원 ${acmInfo[0].acm_guest_num}명 /
							침실 ${acmInfo[0].acm_room_num}개 /
							<c:choose>
								<c:when test="${acmInfo[0].acm_bedding eq 'bed'}">
									<span> 침대 /</span>
								</c:when>
								<c:otherwise>
									<span> 온돌방 /</span>
								</c:otherwise>
							</c:choose>
							화장실 ${acmInfo[0].acm_bath_num}개
						</span>
					</div>
					<h3 id="title">${acmInfo[0].acm_title}</h3>
					<div>
						${acmInfo[0].acm_info}
					</div>
					<div style="border-top: 3px solid #000000; padding: 15px 0px;">
						<div>
							<h4>편의시설</h4>
						</div>
						<div>
							<c:forEach items="${amenity}" var="amenity">
								<c:choose>
									<c:when test="${amenity.acm_amenity eq 'wifi'}">
										<span class="amenity">
											<i class="fas fa-wifi"></i>
											<span>무선 인터넷</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'tv'}">
										<span class="amenity">
											<i class="fas fa-tv"></i>
											<span>TV</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'kitchen'}">
										<span class="amenity">
											<i class="fas fa-utensils"></i>
											<span>주방</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'dish'}">
										<span class="amenity">
											<i class="fas fa-bullseye"></i>
											<span>식기 제공</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'lock'}">
										<span class="amenity">
											<i class="fas fa-lock"></i>
											<span>방 잠금장치</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'towel'}">
										<span class="amenity">
											<i class="fas fa-scroll"></i>
											<span>수건</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'washer'}">
										<span class="amenity">
											<i class="fas fa-tshirt"></i>
											<span>세탁기</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'dryer'}">
										<span class="amenity">
											<i class="fas fa-wind"></i>
											<span>건조기</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'shower'}">
										<span class="amenity">
											<i class="fas fa-bath"></i>
											<span>샤워 시설</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'hairdryer'}">
										<span class="amenity">
											<i class="fas fa-bullhorn"></i>
											<span>헤어 드라이기</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'fan'}">
										<span class="amenity">
											<i class="fas fa-fan"></i>
											<span>선풍기</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'extinguisher'}">
										<span class="amenity">
											<i class="fas fa-fire-extinguisher"></i>
											<span>소화기</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'balcony'}">
										<span class="amenity">
											<i class="fas fa-store"></i>
											<span>발코니</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'garden'}">
										<span class="amenity">
											<i class="fas fa-seedling"></i>
											<span>마당</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'heater'}">
										<span class="amenity">
											<i class="fas fa-temperature-high"></i>
											<span>난방기구</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'breakfast'}">
										<span class="amenity">
											<i class="fas fa-coffee"></i>
											<span>아침식사 제공</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'bbq'}">
										<span class="amenity">
											<i class="fas fa-drumstick-bite"></i>
											<span>BBQ 시설</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'park'}">
										<span class="amenity">
											<i class="fas fa-parking"></i>
											<span>주차공간</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'aircon'}">
										<span class="amenity">
											<i class="fab fa-diaspora"></i>
											<span>에어컨</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'infodesk'}">
										<span class="amenity" style="width:160px;">
											<i class="fas fa-info-circle"></i>
											<span>인포메이션 데스크</span>
										</span>
									</c:when>
								</c:choose>
								
							</c:forEach>
						</div>
					</div>
				</div>
				<div class = "col-sm-4 row" style = "position : relative;">
					<div style = "width : 100%; margin-left : 10px; margin-right : 10px; ">
						<div id = "sideSticker" style = "border : 1px solid grey; width : 100%; margin-left : 10px; margin-right : 10px; height : auto;">
							<div class="input-group date form-group d-flex justify-content-between" id="datepicker" style = "font-weight : bold">
							</div>
						</div>
					</div>
				</div>
			</div>
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
<!-- datepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>

<script>
$(document).ready(function() {

	$(".menu-toggle").click(function() {
		$("nav").toggleClass("active");
		$(".main").toggleClass("main1");
	});
	$('#datepicker').datepicker({
		format: "dd/mm/yyyy",
		startDate: '17/02/2020',
		daysOfWeekHighlighted: "6,0",
		datesDisabled: ['07/01/2020'],
		language: 'en'
	});
});
</script>

</body>
</html>