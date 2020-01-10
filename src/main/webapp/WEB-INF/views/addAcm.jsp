<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<title>Insert title here</title>
<style>

option {
   background : #ffffff; /*흰색*/
   font-size:14px;
}
.form-check-label { 
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  /* font-size: 18px;*/
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.form-check-label input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
}

/* On mouse-over, add a grey background color */
.form-check-label:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.form-check-label input:checked ~ .checkmark {
  background-color: #343a40;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.form-check-label input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.form-check-label .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}

#acm_rule .form-check-label {
	margin-bottom: 25px;
}

/*세번째*/
.form-control {
      margin:0 ;
      margin-bottom: 25px;
   }

</style>
</head>
<body>
<jsp:include page="common/header.jsp" flush="true"/>

<div class="container" style = "min-height : 500px;">
	<div class="row d-flex justify-content-center pt-5" style="max-width:1200px;"> <!-- pt 네비바에서 숙소 등록을 시작합니다 사이 -->
		<h3 class="font-weight-bold">숙소 등록을 시작합니다</h3>
		<div class="col-10 col-sm-10 mt-5 mb-5"> <!-- mt 숙소등록을 시작합니다 - 숙소유형을 선택해주세요 사이 -->
			<form method="POST" action ="write" enctype="multipart/form-data">
				<div class="form-group d-flex justify-content-between">
					<label class="text-muted mb-3" for="acm_type">숙소 유형을 선택해 주세요</label>
					<div>
						<!-- 111111111111111  name="acm_type"    1111111111111111111111111 -->
						<select class="form-control" name="acm_type" id="acm_type" >
							<option selected value="apt">아파트</option>
							<option value="flat">주택</option>
							<option value="guestHouse">게스트하우스</option>
							<option value="villa">빌라</option>
							<option value="Hanok">한옥스테이</option>
							<option value="pension">펜션</option>
							<option value="temple">템플스테이</option>
				 		</select>
			 		</div>
				</div>
				<hr/>
				
				<!-- 222222222222222222  name=acm_room_type 2222222222222222222222222-->
				<div>
					<div class="text-muted mb-3" >게스트가 묵을 공간의 종류를 선택해 주세요</div>
					<div>
						<div class="mb-3 custom-control custom-radio">
							<input type="radio" class="custom-control-input" id="acm_room_type1" name="acm_room_type" value="wholeH" checked>집 전체<br/>
							<label class="text-muted custom-control-label" for="acm_room_type1">게스트가 숙소 전체를 다른 사람과 공유하지 않고 단독으로 이용합니다. 일반적으로 침실, 욕실, 부엌이 포함됩니다.</label>
						</div>
						<div class="mb-3 custom-control custom-radio">
							<input type="radio" class="custom-control-input" id="acm_room_type2"  name="acm_room_type" value="exclusiveR">개인실<br/>
							<label class="text-muted custom-control-label" for="acm_room_type2">게스트에게 개인 침실이 제공됩니다. 침실 이외의 공간은 공용일 수 있습니다.</label>
						</div>
						<div class="mb-3 custom-control custom-radio">
							<input type="radio" class="custom-control-input" id="acm_room_type3"   name="acm_room_type" value="shareR">다인실<br/>
							<label class="text-muted custom-control-label" for="acm_room_type3">게스트는 개인 공간 없이, 다른 사람과 함께 쓰는 침실이나 공용 공간에서 숙박합니다.</label>
						</div>
					</div>
				</div>
				<hr/>
				
				<!-- 3333333333333333333333 name="bed" name="floor"  33333333333333333333333 -->
				
				<div class="d-flex justify-content-between">
					<div>침실 타입</div>
					<div>
						<div class="form-check-inline">
					    	<label class="form-check-label" for="check1">
								<input type="checkbox" class="form-check-input" id="check1" name="bed" value="bed" checked>침대
								<span class="checkmark"></span>
							</label>
					    </div>
					    <div class="form-check-inline">
					    	<label class="form-check-label" for="check2">
					        	<input type="checkbox" class="form-check-input" id="check2" name="floor" value="floor">온돌
					        	<span class="checkmark"></span>
					    	</label>
					    </div>
					</div>
				</div>
			    <hr/>
			    
			    <!-- 세컨드 -->
			    <!-- ********************** name="acm_guest_num" ********************* -->
				<div class="row">
					<div class="text-muted col-sm-8">최대 숙박 가능 인원은 몇 명인가요?</div>
					<div class="col-sm-4">
						<input type="number" id="acm_guest_num" name="acm_guest_num" value="1" min="1" max="500" step="1"/>
					</div>
				</div>
				<hr/>
				
				<!-- *************************** name="acm_room_num"  ****************-->
				<div class="row">
					<div class="text-muted col-sm-8">게스트가 사용할 방의 개수는 몇 개인가요?</div>
					<div class="col-sm-4">
						<input type="number" id="acm_room_num" name="acm_room_num" value="1" min="1" max="100" step="1"/>
					</div>
				</div>
				<hr/>
				
				<!-- **************************  name= "acm_bath_num" ************* -->
				<div class="row">
					<div class="text-muted col-sm-8">게스트가 사용할 수 있는 화장실은 몇 개인가요?</div>
					<div class="col-sm-4">
						<input type="number" id="acm_bath_num" name= "acm_bath_num" value="1" min="1" max="100" step="1"/>
					</div>
				</div>
				<hr/>
				
				<!-- ****************************** name="acm_area" **************-->
				<div class="row">
					<div class="text-muted col-sm-8">게스트가 사용할 전체 공간의 대략적인 평수를 입력해주세요 (단위 : m²) </div>
					<div class=" col-sm-4">
						<input type="number" id="acm_area" name= "acm_area" value="1" min="1" max="100" step="1"/>
						<!-- <input type="number" name="acm_area" value="4.5" data-decimals="1" min="0" max="9" step="0.1" /><!-- data-suffix="m²" --> 
						
					</div>
				</div>
				<hr/>
				
				<!-- 3번째 -->
				<div class="mb-5"> <!-- form안에서 이전,다음버튼과 컨텐츠과의 거리 -->
					<div class="row d-flex justify-content-start">
						<input class="form-control col-sm-3" type="text" name="postcode"  id="postcode" placeholder="우편번호">
					</div>
					<div class="row">
						<input class="form-control col-sm-6" type="text" name="address"  id="address" placeholder="주소 찾기를 클릭해 주소를 검색해주세요"><br>
						<input class="form-control col-sm-6" type="text" name="extraAddress"  id="extraAddress" placeholder="참고주소">
					</div>
					<div class="row">
						<input class="form-control col-sm-9" type="text" name="detailAddress"  id="detailAddress" placeholder="상세주소를 입력해주세요">
						<div class="col-sm-3 d-flex justify-content-end">
							<input class="form-control w-75 bg-dark text-light" type="button" onclick="daumPostcode()" value="주소찾기">
						</div>
					</div>
					
					<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
				</div>
			    
				
				
				<!-- 5번째 -->
				<div class="row"> <!-- acm_checkin_time, acm_checkout_time -->
					<div class="col-sm-6">
						<div class="form-group">
		  				<label for="acm_checkin_time" class="col-form-label">체크인 시간</label>
						<div>
						    <input class="form-control not" type="time" value="13:45:00" name="acm_checkin_time" id="acm_checkin_time">
						</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
		  				<label for="acm_checkout_time" class="col-form-label">체크아웃 시간</label>
						<div>
						    <input class="form-control not" type="time" value="13:45:00" name="acm_checkout_time" id="acm_checkout_time">
						</div>
						</div>
					</div>
				</div>
				<!-- *********************** acm_rule *********** -->
				<div class="row mt-5 mb-5" id="acm_rule">
					<div class="col-sm-6">
						<label class="form-check-label"> 유아(2세 미만) 숙박에 적합함
						  <input type="checkbox" name="infant" value="infant">
						  <span class="checkmark"></span>
						</label>
						<label class="form-check-label"> 어린이(2~12세) 숙박에 적합함
						  <input type="checkbox" name="child" value="child">
						  <span class="checkmark"></span>
						</label>
						<label class="form-check-label"> 반려동물 동반에 적합함
						  <input type="checkbox" name="pet" value="pet">
						  <span class="checkmark"></span>
						</label>
					</div>
					<div class="col-sm-6">
						<label class="form-check-label"> 흡연 가능
						  <input type="checkbox" name="smoking" value="smoking">
						  <span class="checkmark"></span>
						</label>
						<label class="form-check-label"> 행사나 파티 허용
						  <input type="checkbox" name="party" value="party1">
						  <span class="checkmark"></span>
						</label>
						<label class="form-check-label"> 상업적 이용 가능
						  <input type="checkbox" name="commercial" value="commercial">
						  <span class="checkmark"></span>
						</label>
					</div>
				</div>
				
				
				<!-- 6번째 -->
				
				<!-- *****************   name="acm_charge" --------------- -->
				<div class="row">
					<div class="text-muted col-sm-8">설정하고 싶은 하루 숙박료를 입력해주세요 (단위 : 원)</div>
					<div class="col-sm-4">
						<input type="number" name="acm_charge" value="50000" min="1000" max="5000000" step="1000"/>
					</div>
				</div>
				<hr/>
				
				<!-- ***************** acm_availdate ***********-->
				<div class="input-group date form-group d-flex justify-content-between" id="datepicker">
					<div>
						<label class="mb-3	text-muted" for="acm_availdate">예약 가능한 날짜를 선택해주세요</label>
					</div>
					<div>
				    	<input type="hidden" id="acm_availdate" name="acm_availdate" placeholder="Select days" required />
				    </div>
				</div>
				<!-- 달력 아이콘
				<i class="glyphicon glyphicon-calendar"></i>  -->
				
				<!-- 4번째 -->
				<!-- ***********  name="acm_title" *************** -->
				<div class="row form-group">
					<label class="text-muted mb-3 col-sm-2" for="acm_title">이름 지정</label>
					<div class="col-sm-10">
						<input class="form-control" id="acm_title" name="acm_title" placeholder="숙소의 특징과 장점을 강조하는 제목을 정해 게스트의 관심을 끌어보세요." type="text" value="">
					</div>
				</div>
				
				<!-- ************ name="acm_info"***************** -->
				<div class="row form-group">
					<label class="text-muted mb-3 col-sm-2" for="acm_info">숙소 소개</label>
					<div class="col-sm-10">
						<textarea class="form-control" rows="10" name="acm_info" placeholder="숙소에 대해 간략히 설명해주세요. 숙소와 주변 지역에 대한 정보에서 시작해 게스트와 어떻게 소통하고 싶은지 등의 내용을 적어주세요."></textarea>
					</div>
				</div>
				
				<div class="row form-group">
					<label class="text-muted mb-3 col-sm-2" for="acm_img">숙소 사진</label>
					<div class="col-sm-10">
						<input id="acm_img" type="file" name="acm_img" multiple />
					</div>
				</div>
				
				<!-- 참고용(삭제예정)
				<div class="row form-group">
					<label class="text-muted mb-3 col-sm-2" for="acm_img">숙소 사진</label>
					<div class="custom-file col-sm-10 mb-3">
						<input class="custom-file-input" id="acm_img" type="file" name="acm_img" multiple />
						<label class="custom-file-label" for="acm_img">숙소사진을 올려주세요</label>
					</div>
				</div>
				
				 -->
				
				<!-- 편의시설 amenity -->
				<div>
					<div class="d-inline">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="wifi1" value="F"  name="ame_wifi"  checked>
							<label class="custom-control-label" for="wifi1"></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="wifi2" value="T"  name="ame_wifi">
							<label class="custom-control-label" for="wifi2"></label>
						</div>
					</div>
					<div class="d-inline">무선인터넷</div>
				</div>
				<div>
					<div class="d-inline">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="tv1" value="F"  name="ame_tv" checked>
							<label class="custom-control-label" for="tv1"></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="tv2" value="T"   name="ame_tv">
							<label class="custom-control-label" for="tv2"></label>
						</div>
					</div>
					<div class="d-inline">TV</div>
				</div>
				<div>
					<div class="d-inline">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="kitchen1" value="F"  name="ame_kitchen" checked>
							<label class="custom-control-label" for="kitchen1"></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="kitchen2" value="T"   name="ame_kitchen">
							<label class="custom-control-label" for="kitchen2"></label>
						</div>
					</div>
					<div class="d-inline">주방</div>
				</div>
				<div>
					<div class="d-inline">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="aircon1" value="F"  name="ame_aircon" checked>
							<label class="custom-control-label" for="aircon1"></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="aircon2"  value="T"  name="ame_aircon">
							<label class="custom-control-label" for="aircon2"></label>
						</div>
					</div>
					<div class="d-inline">에어컨</div>
				</div>
				<div>
					<div class="d-inline">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="lock1" value="F"  name="ame_room_lock" checked>
							<label class="custom-control-label" for="lock1"></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="lock2" value="T"   name="ame_room_lock">
							<label class="custom-control-label" for="lock2"></label>
						</div>
					</div>
					<div class="d-inline">방 잠금장치</div>
				</div>
				<div>
					<div class="d-inline">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="towel1" value="F"  name="ame_towel" checked>
							<label class="custom-control-label" for="towel1"></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="towel2"  value="T"  name="ame_towel">
							<label class="custom-control-label" for="towel2"></label>
						</div>
					</div>
					<div class="d-inline">수건</div>
				</div>
				<div>
					<div class="d-inline">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="washer1" value="F"  name="ame_washer" checked>
							<label class="custom-control-label" for="washer1"></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="washer2" value="T"   name="ame_washer">
							<label class="custom-control-label" for="washer2"></label>
						</div>
					</div>
					<div class="d-inline">세탁기</div>
				</div>
				<div>
					<div class="d-inline">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="dryer1" value="F"  name="ame_dryer" checked>
							<label class="custom-control-label" for="dryer1"></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="dryer2" value="T"   name="ame_dryer">
							<label class="custom-control-label" for="dryer2"></label>
						</div>
					</div>
					<div class="d-inline">건조기</div>
				</div>
				<div>
					<div class="d-inline">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="shower1" value="F"  name="ame_shower" checked>
							<label class="custom-control-label" for="shower1"></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="shower2"  value="T"  name="ame_shower">
							<label class="custom-control-label" for="shower2"></label>
						</div>
					</div>
					<div class="d-inline">샤워시설</div>
				</div>
				<div>
					<div class="d-inline">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="hair_dryer1" value="F"  name="ame_hair_dryer" checked>
							<label class="custom-control-label" for="hair_dryer1"></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="hair_dryer2"  value="T"  name="ame_hair_dryer">
							<label class="custom-control-label" for="hair_dryer2"></label>
						</div>
					</div>
					<div class="d-inline">헤어드라이기</div>
				</div>
				<div>
					<div class="d-inline">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="fan1" value="F"  name="ame_fan" checked>
							<label class="custom-control-label" for="fan1"></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="fan2"  value="T"  name="ame_fan">
							<label class="custom-control-label" for="fan2"></label>
						</div>
					</div>
					<div class="d-inline">선풍기</div>
				</div>
				<div>
					<div class="d-inline">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="extinguisher1" value="F"  name="ame_extinguisher" checked>
							<label class="custom-control-label" for="extinguisher1"></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="extinguisher2"  value="T"  name="ame_extinguisher">
							<label class="custom-control-label" for="extinguisher2"></label>
						</div>
					</div>
					<div class="d-inline">소화기</div>
				</div>
				<div>
					<div class="d-inline">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="balcony1" value="F"  name="ame_balcony" checked>
							<label class="custom-control-label" for="balcony1"></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="balcony2"  value="T"  name="ame_balcony">
							<label class="custom-control-label" for="balcony2"></label>
						</div>
					</div>
					<div class="d-inline">발코니</div>
				</div>
				<div>
					<div class="d-inline">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="garden1" value="F"  name="ame_garden" checked>
							<label class="custom-control-label" for="garden1"></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="garden2"  value="T"  name="ame_garden">
							<label class="custom-control-label" for="garden2"></label>
						</div>
					</div>
					<div class="d-inline">마당</div>
				</div>
				<div>
					<div class="d-inline">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="heater1" value="F"  name="ame_heater" checked>
							<label class="custom-control-label" for="heater1"></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="heater2"  value="T"  name="ame_heater">
							<label class="custom-control-label" for="heater2"></label>
						</div>
					</div>
					<div class="d-inline">난방기구</div>
				</div>
				<div>
					<div class="d-inline">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="infodesk1" value="F"  name="ame_infodesk" checked>
							<label class="custom-control-label" for="infodesk1"></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="infodesk2"  value="T"  name="ame_infodesk">
							<label class="custom-control-label" for="infodesk2"></label>
						</div>
					</div>
					<div class="d-inline">인포메이션 데스크</div>
				</div>
				<div>
					<div class="d-inline">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="breakfast1" value="F"  name="ame_breakfast" checked>
							<label class="custom-control-label" for="breakfast1"></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="breakfast2"  value="T"  name="ame_breakfast">
							<label class="custom-control-label" for="breakfast2"></label>
						</div>
					</div>
					<div class="d-inline">아침</div>
				</div>
				<div>
					<div class="d-inline">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="bbq1" value="F"  name="ame_bbq" checked>
							<label class="custom-control-label" for="bbq1"></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="bbq2"  value="T"  name="ame_bbq">
							<label class="custom-control-label" for="bbq2"></label>
						</div>
					</div>
					<div class="d-inline">BBQ 시설</div>
				</div>
				<div>
					<div class="d-inline">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="park1" value="F" name="ame_park" checked>
							<label class="custom-control-label" for="park1"></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="park2"  value="T"  name="ame_park">
							<label class="custom-control-label" for="park2"></label>
						</div>
					</div>
					<div class="d-inline">주차</div>
				</div>
				
			    <div class="d-flex justify-content-end">
					<button type="submit" class="btn btn-primary">숙소등록 하기</button>
				</div>
				
			</form>
		</div>
	</div>
</div>
<jsp:include page="common/footer.jsp" flush="true"/>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>


<script src="js/bootstrap-input-spinner.js"></script>

<script>
    $("input[type='number']").inputSpinner();
    
    $(document).ready(function() {
        $('#datepicker').datepicker({
            startDate: new Date(),
            multidate: true,
            format: "dd/mm/yyyy",
            daysOfWeekHighlighted: "5,6",
            datesDisabled: ['07/01/2020'],
            language: 'en'
        });
    });
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>

</body>
</html>