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
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- datepicker -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
<title>stay_myPageProfile</title>
<style>
	.main {
		margin-top : 150px; 
	}
	.main1 {
		margin-top : 250px;
	}
	.pp {
		font-size : 28px;
		font-weight: bold;
		font-family: 'S-CoreDream-2ExtraLight';
		border-bottom : 1px solid grey;
	}
</style>
</head>
<body>

<div class = "main">
	<div class = "container">
		<h3>마이페이지 / 프로필</h3>
		<div id="border"></div>
		<div class = "mx-auto">
			<ul class="nav nav-tabs text-center">
				<li class = "mppTab active" onclick='mppTab(this, "white")'><a data-toggle="tab" data-target ="#myPage">마이페이지</a></li>
				<li class = "mppTab" onclick='mppTab(this, "white")'><a data-toggle="tab" data-target ="#profile">프로필</a></li>
			</ul>
		</div>
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
<script>
$(document).ready(function() {
	$(".myPage").click(function(){
		event.preventDefalut();
		$.ajax({
			url : "myPage",
			data : "",
			dataType : "html",
			success : function(data){
				$(".content").html(data);
			},
			error : function() {
				alert("server error");
			}
		});
	});
});
</script>
</body>
</html>