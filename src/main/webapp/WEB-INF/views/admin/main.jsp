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
<!-- chart -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.css">
<title>Insert title here</title>
<style>
.main {
  margin-left: 300px;
}

.topCount {
	padding: 20px;
    border: 1px solid lightgrey;
	border-radius: 5px;
	height: 150px;
}

.topCountTitle {
	font-weight: bold;
	margin-top: 20px;
	margin-bottom: 0;
}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/navbar.jsp" flush="false"/>
<div class="main">
	<div class="container-fluid" style="margin-top:30px;">
		<div class="row" align="center" style="margin:0px 100px;">
			<div class="col-4">
				<div class="topCount">
					<h1 class="topCountTitle">2500</h1>
					<span>전체 회원수</span>
				</div>
			</div>
			<div class="col-4">
				<div class="topCount">
					<h1 class="topCountTitle">2500</h1>
					<span>전체 숙소 현황</span>
				</div>
			</div>
			<div class="col-4">
				<div class="topCount">
					<h1 class="topCountTitle">2500</h1>
					<span>전체 리뷰</span>
				</div>
			</div>
		</div>
		<div class="container">
			<div>
				<h4 align="center" style="padding-top:50px;font-weight:bold;">&lt;월별 가입자 수&gt;</h4>
			</div>
			<div class="container" style="width:900px;">
				<canvas id="canvas" class="container-fluid" style="min-width:900px!important;min-height:400px!important;"></canvas>
			</div>
		</div>
		<div class="row container" style="margin:0 100px;padding-top:50px;">
			<div class="col-6">
				<canvas id="canvas2" class="container-fluid" style="min-width:800px!important;min-height:350px!important;"></canvas>
			</div>
			<div class="col-6">
				<canvas id="canvas3" class="container-fluid" style="min-width:800px!important;min-height:350px!important;"></canvas>
			</div>
		</div>
		<div class="container">
			<div>
				<h4 align="center" style="padding-top:50px;font-weight:bold;">&lt;지역별 숙소 등록 현황&gt;</h4>
			</div>
			<div class="container" style="width:900px;">
				<canvas id="canvas4" class="container-fluid" style="min-width:900px!important;min-height:400px!important;"></canvas>
			</div>
		</div>
	</div>
</div>


<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Chart -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>

<script>
$(document).ready(function() {
	var chartLabels = ["1월", 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
	var chartData = ["200", "300", "230", "400", "500", "300", "600", "230", "400", "500", "300", "600"];
	
	var lineChartData = {
						labels: chartLabels,
						datasets: [{
							label: "",
							data: chartData,
							fill: false,
							strokeColor: "rgba(220,220,220,1)",
							pointColor: "rgba(220,220,220,1)",
							pointStrokeColor: "#fff",
							pointHighlightStroke: "rgba(220,220,220,1)"
							}]
						};
	
	function createChart() {
		var ctx = document.getElementById("canvas").getContext("2d");
		LineChartDemo = Chart.Line(ctx, {
					data:lineChartData,
					options:{
						scales: {
							yAxes: [{
								thicks: {
									beginAtZero: true
								}
							}]
						}
					}
				});
	}
	
	createChart();
	
	var pieChartData = {
			labels: ["남", "녀"],
			datasets: [{
				label: "남녀 비율",
				data: ["400", "600"],
				fillColor: "rgba(220,220,220,2)",
				strokeColor: "rgba(220,220,220,1)",
				pointColor: "rgba(220,220,220,1)",
				pointStrokeColor: "#fff",
				pointHighlightStroke: "rgba(220,220,220,1)",
				backgroundColor: [
					"#4a71fd",
					"#fd4a6b"
				]
				}]
			};
	
	function createPie() {
		var ctx = document.getElementById("canvas2").getContext("2d");
		new Chart(ctx, {
			type: "pie",
			data: pieChartData,
			option: {responsive: false, maintainAspectRatio:false}
		});
	}
	
	createPie();
	
	var pieChartData2 = {
			labels: ["게스트", "호스트"],
			datasets: [{
				label: "호스트-게스트 비율",
				data: ["400", "600"],
				fillColor: "rgba(220,220,220,2)",
				strokeColor: "rgba(220,220,220,1)",
				pointColor: "rgba(220,220,220,1)",
				pointStrokeColor: "#fff",
				pointHighlightStroke: "rgba(220,220,220,1)",
				backgroundColor: [
					"#f7e838",
					"#6fe461"
				]
				}]
			};
	
	function createPie2() {
		var ctx = document.getElementById("canvas3").getContext("2d");
		new Chart(ctx, {
			type: "pie",
			data: pieChartData2,
			option: {responsive: false,
					maintainAspectRatio:false
					
			}
		});
	}
	
	createPie2();
	
	var barChartData = {
			labels: chartLabels,
			datasets: [{
				label: "",
				data: chartData,
				fill: false,
				strokeColor: "rgba(220,220,220,1)",
				pointColor: "rgba(220,220,220,1)",
				pointStrokeColor: "#fff",
				pointHighlightStroke: "rgba(220,220,220,1)"
				}]
			};

	function createBar() {
		var ctx = document.getElementById("canvas4").getContext("2d");
		new Chart(ctx, {
				type:"bar",
				data:barChartData,
				options:{
					scales: {
						yAxes: [{
							thicks: {
								beginAtZero: true
							}
						}]
					}
				}
			});
	}
	
	createBar();
});
</script>
</body>
</html>