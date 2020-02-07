<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- csrf정보  -->
<meta name="_csrf" content="${_csrf.token}"/>
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- datepicker -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
<title>마이페이지/프로필</title>
<style>
#reservation-header {
	padding-top: 150px;
}
#border {
	border: 3px solid #000000;
	/*border-collapse: collapse;*/
}

.reservationTabMenu {
	margin-top: 40px;
    width: 80%;
    margin-bottom: 150px;
}

.nav-tabs {
	border: 0px!important;
}

.informationTab {
	width: 50%;
	cursor: pointer;
	border-top: 1px solid #343a40;
	border-left: 1px solid #343a40;
	border-right: 1px solid #343a40;
    background-color: #343a40;
    color: white;
    font-weight: bold;
}

.informationTab a {
	display: block;
	padding-top: 5px;
    height: 35px;
    width: 100%;
}

.tab-content {
	padding-top: 30px;
}

.informationForm {
	width: 400px;
}

.informationTab_info {
	font-size:15px;
	font-weight: bold;
	padding: 20px;
	padding-bottom: 50px;
    margin-bottom: 50px;
    border-bottom: 1px solid lightgrey;
}

.informationTab_info i {
	font-size: 40px;
    margin-bottom: 10px;
}

#myPage_name {
	margin-bottom: 50px;
}

.form-control {
	border: none;
	border-radius: 0;
	border-bottom: 2px solid grey;
}

.form-group .btn {
	font-weight: bold;
}

.form_center {
	padding-left: 35px;
}
.myPageform {
	display : flex;
	align-items: center;
	width : 100%;
	height : 280px;
	border-bottom: 1px solid lightgrey;
}
.myPage {
	margin : 0 auto;
	border : 1px solid black;
	width : 85%;
	height : 85%;
}

@media screen and (max-width: 576px) {
	.reservationTabMenu {
		width: 300px;
	}
	
	.reservation {
		width: 150px;
		cursor: pointer;
	}
	
	.informationTab_info {
		font-size: 14px;
	}
	
	.informationTab a {
		width: 150px;
	}
	
	.informationForm {
		width: 300px;
	}
	
	.form_center {
		padding-left: 20px;
	}
	
}

</style>
</head>
<body>
<jsp:include page="common/header.jsp" flush = "flase"></jsp:include>
<div class="main">
	<div class="container" id="reservation-header">
		<h3>예약 페이지</h3>
		<div id="border"></div>
		<div class="reservationTabMenu mx-auto">
			<div class = "row">
				<div class = "col-sm-9">
					<form action = "reservation" method = "post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
						<label>숙박비</label>
						<div>${rdto.acm_charge}</div>
						<!-- ***************** acm_availdate ***********-->
						<div class="input-group date form-group d-flex justify-content-between" id="datepicker">
							<div>
								<label class="mb-3" for="acm_availdate">예약 가능한 날짜를 선택해주세요</label>
							</div>
							<div>
						    	<input type="hidden" id="acm_availdate" name="acm_availdate" placeholder="Select days" required />
						    </div>
						</div>
						<!-- 달력 아이콘
						<i class="glyphicon glyphicon-calendar"></i>  -->
						<label>성인</label>
						<input type = "number" id = "Adult" class = "form-control" />
						<label>어린이</label>
						<input type = "number" id = "Child" class = "form-control" /><br/>
						
						<input type = "submit" class = "btn btn-dark form-control" value = "예약" />
					</form>
				</div>
				<div class = "col-sm-3">
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="common/footer.jsp" flush="false"/>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>
<!-- iCheck(라디오 버튼) -->
<script src="icheck-1.x/icheck.min.js"></script>
<script>
$(function () {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function (e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});
</script>
<script>
$(document).ready(function() {
	$(".menu-toggle").click(function() {
		$("nav").toggleClass("active");
		$(".main").toggleClass("main1");
	});
	$('#datepicker').datepicker({
        startDate: new Date(),
        multidate: true,
        format: "dd/mm/yyyy",
        daysOfWeekHighlighted: "6,0",
        datesDisabled: ['07/01/2020'],
        language: 'en'
    });
});
</script>
</body>
</html>