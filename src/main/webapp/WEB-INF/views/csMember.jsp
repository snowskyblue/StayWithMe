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

.mx-auto {
	width: 450px;
}
</style>
</head>
<body>
<jsp:include page="common/header.jsp" flush="false"/>
<div class="main">
	<div class="container" id="csM-header">
		<h3>1:1 문의</h3>
		<div id="border"></div>
		
		
		<div class="mx-auto">
		<h3><sec:authentication property="principal.username"/>님</h3>
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