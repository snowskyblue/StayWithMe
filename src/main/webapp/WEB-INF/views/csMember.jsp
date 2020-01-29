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

.form-group label, .container h3 {
	font-family: 'S-CoreDream-2ExtraLight';
	font-weight: bold;
}

.cs_notice .fas {
	font-size: 40px;
}
.csBoard {
	margin-top: 100px;
	margin-bottom: 200px;
}

.csBoard_list tr {
	border-collapse: collapse;
	border: 1px solid black;
}

.csBoard_list td.csTitle {
	text-align: left;
}
</style>
</head>
<body>
<jsp:include page="common/header.jsp" flush="false"/>
<div class="main">
	<div class="container" id="csM-header">
		<h3>1:1 문의</h3>
		<div id="border"></div>
		
		<div class="csBoard mx-auto">
			<c:choose>
				<c:when test="${list eq 'login'}">
					<h3 class="cs_notice text-center">
						<i class="fas fa-exclamation-circle"></i><br/><br/>
						로그인 후 문의 내역을 확인하실 수 있습니다.
					</h3>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${empty list}">
							<h3 class="cs_notice text-center">
								<i class="fas fa-exclamation-circle"></i><br/><br/>
								1:1 문의 내역이 존재하지 않습니다.
							</h3>
						</c:when>
						<c:otherwise>
							<table class="csBoard_list mx-auto text-center">
								<colgroup>
									<col style="width:500px;">
									<col style="width:90px;">
									<col style="width:100px;">
									<col style="width:90px;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col">작성일</th>
										<th scope="col">답변유무</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="list">
										<tr class="pc">
											<td class="csTitle">${list.cs_title}</td>
											<td>${list.mb_id}</td>
											<td>${list.cs_date}</td>
											<c:choose>
												<c:when test="${list.cs_complete eq 'N'.charAt(0)}">
													<td>답변대기</td>
												</c:when>
												<c:otherwise>
													<td>답변완료</td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr class="mobile">
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
					
				</c:otherwise>
			</c:choose>
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

<script>
$(document).ready(function() {
	$(".menu-toggle").click(function() {
		$("nav").toggleClass("active");
		$(".main").toggleClass("main1");
	});
});

</script>
</body>
</html>