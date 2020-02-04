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

.csBoard {
	margin-top: 100px;
	margin-bottom: 200px;
}

.csBoard_content tr {
	border-collapse: collapse;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.csBoard_content th {
	background-color: #f3f3f3;
	padding: 0.5%;
}

.csBoard_content td {
	text-align: left;
	padding-left: 10px;
	font-weight: bold;
}

.csBoard_content td.contents {
	padding: 35px 10px;
}

a{
	color: black!important;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<div class="main">
	<div class="container" id="csM-header">
		<h3>1:1 문의</h3>
		<div id="border"></div>
		
		<div class="csBoard mx-auto">
			<table class="csBoard_content mx-auto text-center">
				<colgroup>
					<col style="width:100px;">
					<col style="width:380px;">
					<col style="width:100px;">
					<col style="width:200px;">
				</colgroup>
				<tbody>
					<c:forEach items="${content}" var="content">
						<tr>
							<th scope="row">제목</th>
							<td colspan="3">${content.cs_title}</td>
						</tr>
						<tr>
							<th scope="row">작성자</th>
							<td>${content.mb_name}</td>
							<th scope="row">작성일</th>
							<td>${content.cs_date}</td>
						</tr>
						<tr>
							<td colspan="4" class="contents">${content.cs_content}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr style="border:0px;">
						<td colspan="4" align="right">
							<button type="button" id="cs_modify" class="btn btn-dark" style="margin-top:10px;">수정</button>
							<button type="button" id="cs_delete" class="btn btn-dark" style="margin-top:10px;">삭제</button>
						</td>
					</tr>
				</tfoot>
			</table>
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