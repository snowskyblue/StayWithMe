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
<title>예약 상세 페이지</title>
<style>
.main1 {
	margin-top: 100px;
}

#board {
	padding-top: 150px;
}

#border {
	border: 3px solid #000000;
	/*border-collapse: collapse;*/
}
.resCheck {
	margin-top: 100px;
	margin-bottom: 200px;
}

.resCheck_list tr {
	border-collapse: collapse;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.resCheck_list th {
	background-color: #f3f3f3;
	padding: 0.5%;
}
</style>
</head>
<body>
	<div class="container" id="board">
		<h3>예약 상세 페이지</h3>
		<div id="border"></div>
		<div class = "resCheck mx-auto" style = "max-width : 100%; border : 1px solid black">
			<table class="resCheck_list mx-auto text-center m-0" style = "width : 100%;">
				<colgroup>
					<col style = "width : 50%;">
					<col style = "width : 50%;">
				</colgroup>
				<thead>
					<tr>
						<th colspan="2" scope="col"> 숙소 예약 정보</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty dto}">
							<tr>
								<td colspan="5" style="height:400px;">
									<h4 class="board_notice text-center">
										<i class="fas fa-exclamation-circle"></i><br/><br/>
										예약된 숙소가 없습니다. 예약을 해주세요.
									</h4>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan = "2" style = "padding : 0">${dto.acm_title}</td><!-- 숙소 명 -->
							</tr>
							<tr>
								<td colspan = "2">${dto.acm_address} / ${dto.acm_add_detail}</td><!-- 주소 -->
							</tr>
							<tr>
								<td>${dto.res_checkin_date}</td><!-- checkIn -->
								<td>${dto.res_checkout_date}</td><!-- checkOut -->
							</tr>
						</c:otherwise>
					</c:choose>		
				</tbody>
				<tfoot>
								
				</tfoot>
			</table>
		</div>
	</div>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- datepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>
</body>
</html>