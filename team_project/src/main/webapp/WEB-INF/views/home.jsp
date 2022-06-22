<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
$(document).ready(function() {
	var isExistenceFile = "${isExistence}";
	var driverResult = "${driverResult}";
	var registerDriver = "${registerDriver}";
	var isPassenger = "${isPassenger}";
	if (isExistenceFile == "true") {
		alert("이미 등록된 면허증입니다.");
	}
	if (driverResult == "true"  && isPassenger == "true") {
		alert("운전등록이 완료되었습니다. \n탑승자로 등록되어 있던 경우, 해당 정보는 삭제되었으니 참고 부탁드립니다.");
	} else if (driverResult == "false")  {
		alert("운전등록에 실패하였습니다. \n실패가 계속 될 경우 고객센터로 문의부탁드립니다.")
	}
	if (registerDriver == "true") {
		alert("운전자등록신청이 정상적으로 제출되었습니다. \n승인까지 시간이 걸릴 수 있으니 양해 부탁드립니다. ")
	} else if (registerDriver == "false") {
		alert("운전자등록신청에 실패하였습니다. \n실패가 계속 될 경우 고객센터에 문의부탁드립니다.")
	}
});
</script>

<!-- Start Categories of The Month -->
	<section class="container">
		<div class="row">
			<div class="col-12 col-md-6 p-5 mt-3">
				<a href="board/drive"><img style="width:500px; height:300px;" src="/resources/assets/img/driver.jpg"
					class=" img-fluid border"></a>
				<h5 class="text-center mt-3 mb-3">운전하기/탑승자 확인</h5>
			</div>
			<div class="col-12 col-md-6 p-5 mt-3">
				<a href="board/reservation"><img style="width:500px; height:300px;" src="/resources/assets/img/reservation.jpg"
					class=" img-fluid border"></a>
				<h2 class="h5 text-center mt-3 mb-3">예약하기</h2>
			</div>
<!-- 			<div class="col-12 col-md-4 p-5 mt-3"> -->
<!-- 				<a href="#"><img src="/resources/assets/img/category_img_03.jpg" -->
<!-- 					class="rounded-circle img-fluid border"></a> -->
<!-- 				<h2 class="h5 text-center mt-3 mb-3">Accessories</h2> -->
<!-- 				<p class="text-center"> -->
<!-- 					<a class="btn btn-success">Go Shop</a> -->
<!-- 				</p> -->
<!-- 			</div> -->
		</div>
	</section>
	<!-- End Categories of The Month -->

<!-- Start Banner Hero -->
	<div id="template-mo-zay-hero-carousel" class="carousel slide"
		data-bs-ride="carousel">
		<ol class="carousel-indicators">
			<li data-bs-target="#template-mo-zay-hero-carousel"
				data-bs-slide-to="0" class="active"></li>
			<li data-bs-target="#template-mo-zay-hero-carousel"
				data-bs-slide-to="1"></li>
			<li data-bs-target="#template-mo-zay-hero-carousel"
				data-bs-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" style="background-color: white;">
			<div class="carousel-item active">
				<div class="container">
					<!-- 안의 내용 -->
					
					<div class="row p-5">
						<div class="mx-auto col-md-12 col-lg-12 order-lg-last" >
							
							<img class="img-fluid" src="/event/displayImage?filename=${eventList.get(0).event_img}"
								alt="" style="max-height: 610px" width="1100px">
								
						</div>
						<div >
							<div class="text-align-left align-self-center">
							
							</div>
						</div>
						
						<!-- 안의 내용 -->
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="container">
					<div class="row p-5">
						<div class="mx-auto col-md-12 col-lg-12 order-lg-last">
							<img class="img-fluid" src="/event/displayImage?filename=${eventList.get(1).event_img}"
								alt="" style="max-height: 610px" width="1100px">
						</div>
					
							<div class="text-align-left">
								
							</div>
						
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="container">
					
						<div class="mx-auto col-md-12 col-lg-12 order-lg-last">
							<img class="img-fluid" src="/event/displayImage?filename=${eventList.get(2).event_img}"
								alt="" style="max-height: 610px" width="1100px">
						</div>
						
					
				</div>
			</div>
		</div>
		<a class="carousel-control-prev text-decoration-none w-auto ps-3"
			href="#template-mo-zay-hero-carousel" role="button"
			data-bs-slide="prev"> <i class="fas fa-chevron-left"></i>
		</a> <a class="carousel-control-next text-decoration-none w-auto pe-3"
			href="#template-mo-zay-hero-carousel" role="button"
			data-bs-slide="next"> <i class="fas fa-chevron-right"></i>
		</a>
	</div>
	<!-- End Banner Hero -->
	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>