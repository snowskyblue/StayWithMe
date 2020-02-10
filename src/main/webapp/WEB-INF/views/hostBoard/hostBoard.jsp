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
<title>Board jsp</title>
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

.form-group label, .container h3, .container h4 {
	font-family: 'S-CoreDream-2ExtraLight';
	font-weight: bold;
}

.board_notice .fas {
	font-size: 40px;
}
.hostBoard {
	margin-top: 100px;
	margin-bottom: 200px;
}

.hostBoard_list tr {
	border-collapse: collapse;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.hostBoard_list th {
	background-color: #f3f3f3;
	padding: 0.5%;
}

.hostBoard_list td#acmTitle {
	text-align: left;
	padding-left: 10px;
	font-weight: bold;
}
.hostBoard_list td#acmAddress, .hostBoard_list td#acmDetail {
	text-align: left;
}

a{
	color: black!important;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>
<div class="main">
	<div class="container" id="board">
		<h3>호스트 안내판</h3>
		<div id="border"></div>
		
		<div class="hostBoard mx-auto">
			<table class="hostBoard_list mx-auto text-center">
				<colgroup>
					<col style="width:450px;">
					<col style="width:300px;">
					<col style="width:150px;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">숙소</th>
						<th scope="col">주소</th>
						<th scope="col">상세주소</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="4" style="height:400px;">
									<h4 class="board_notice text-center">
										<i class="fas fa-exclamation-circle"></i><br/><br/>
										등록된 숙소가 없습니다. 숙소를 등록해주세요
									</h4>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="list">
								<tr>
									<td id="acmTitle">
										<a href="acmContent?acm_code=${list.acm_code}">
											${list.acm_title}
										</a>
									</td>
									<td id="acmAddress">
										${list.acm_address}
									</td>
									<td id="acmDetail">
										${list.acm_add_detail}
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
				<tfoot>
					<tr style="border:0;">
						<td colspan="4" align="right">
							<button type="button" onClick="location.href='addAcm'" id="cs_write" class="btn btn-dark" style="margin-top:10px;">숙소 추가하기</button>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<img src="img/logo.jpg">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center" style="font-weight:bold;">
				 회원가입이 성공적으로 이루어졌습니다.
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="hostModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<img src="img/logo.jpg">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center" style="font-weight:bold;">
				호스트로 등록되셨습니다. 이제 숙소를 등록해주세요.
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"/>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
	<c:choose>
		<c:when test="${not empty hostJoin}">
			$("#hostModal").modal("show");
		</c:when>
		<c:when test="${not empty success}">
			$("#joinModal").modal("show");
		</c:when>
	</c:choose>
	$(".menu-toggle").click(function() {
		$("nav").toggleClass("active");
		$(".main").toggleClass("main1");
	});
});

</script>
</body>
</html>