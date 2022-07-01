<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style>
.point_td { text-align: center; }
.coupon_img { width: 243px; height: 153px;}
.modal_content { text-align: center; }
#p_price_comment { color: red; }


.jumbotron {
    margin-bottom: 0px;
    background-image: url(/resources/images/banner/point_home_banner.jpg);
    background-position: center;
    height: 300px;
	background-size: cover;
    background-repeat: no-repeat;
    background-color: #2723A1;
}


</style>
<script>
$(document).ready(function() {
	var message_result = "${message_result}";
	if (message_result) {
		alert("쿠폰이 지급되었습니다.\n 쪽지를 확인해주세요.")
	}
	
	
	
	$(".a_coupon").click(function(e) {
		e.preventDefault();
		$("#modal-container-678121").modal('show');
		var img = $(this).attr("href");
		var price = $(this).attr("data-price");
		var after_point = ${loginVo.m_point} - Number(price);
		var that = $(this);
		var title_tr = $(this).parent().parent().prev();
		var title = title_tr.attr("data-text");
		
		$("#p_title").text(title);
		$(".modal_img").attr("src", img);
		$("#p_price").text(after_point + " point");
		if (after_point < 0) {
			$("#p_price_comment").text("포인트가 부족합니다.");
			$("#modalSuccess").hide();
		} else {
			$("#p_price_comment").text("");
			$("#modalSuccess").show();
		}
		$("#modalSuccess").click(function() {
			var frmPayment = $("#frmPayment");
			frmPayment.find("input[name=m_point]").val(after_point);
			frmPayment.find("input[name=coupon]").val(title);
			frmPayment.find("input[name=price]").val(price);
			frmPayment.submit();
		});
	});
	
	
	
	$("#modalClose").click(function() {
		$("#modal-container-678121").modal('hide');
	});
});
</script>
<div class="row">

<!-- modal start -->
	<div class="col-md-12">
		<form id="frmPayment" action="/point/payment" method="post">
		<input type="hidden" name="m_point">
		<input type="hidden" name="coupon">
		<input type="hidden" name="price">		
		
		
		<div class="modal fade" id="modal-container-678121" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">
							포인트 결제
						</h5>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-6">
								<img class="modal_img coupon_img">
							</div>
							<div class="col-md-6 modal_content">
								<span id="p_title"></span><br>
								<span>-------------------------------</span><br>
								<span>현재 포인트 </span><br>
								<span>${loginVo.m_point} point</span><br>
								<span>교환 후 포인트 </span><br>
								<span id="p_price"></span><br>					
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<p id="p_price_comment"></p>
						<button type="button" id="modalClose" class="btn btn-secondary" data-dismiss="modal">
							취소하기
						</button>
						<button type="button" id="modalSuccess" class="btn btn-success" data-dismiss="modal">
							교환하기
						</button>
					</div>
				</div>
			</div>
		</div>
		</form>
		
	</div>
	<!-- modal end -->
	<div class="jumbotron" style="">
		<p style="position: relative; top: 100%; transform: translateY(-50%); text-align: right; color: white;">현재 내 포인트 : ${loginVo.m_point}</p>
	</div>
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
		
		<table class="table">
			<tr class="point_td" data-text="스타벅스 쿠폰">
				<td colspan="3" class="coupon_title" id="startbugs">
					스타벅스 쿠폰
				</td>
			</tr>
			<tr class="point_td">
				<td>
					<a class="a_coupon" href="/resources/images/coupon/coffee_10000_coupon.png" data-price="10000"><img class="coupon_img" alt="" src="/resources/images/coupon/coffee_10000_coupon.png"><br>
					<span>1만point</span></a>
				</td>
				<td>
					<a class="a_coupon" href="/resources/images/coupon/coffee_30000_coupon.jpg" data-price="30000"><img class="coupon_img" alt="" src="/resources/images/coupon/coffee_30000_coupon.jpg"><br>
					<span>3만point</span></a>
				</td>
				<td>
					<a class="a_coupon" href="/resources/images/coupon/coffee_50000_coupon.png" data-price="50000"><img class="coupon_img" alt="" src="/resources/images/coupon/coffee_50000_coupon.png"><br>
					<span>5만point</span></a>
				</td>
				
			</tr>
			<tr class="point_td" data-text="주유/세차 쿠폰">
				<td colspan="3" class="coupon_title" id="oil_wash">
					주유/세차 쿠폰
				</td>
			</tr>
			<tr class="point_td">
				<td>
					<a class="a_coupon" href="/resources/images/coupon/wash_car_coupon.jpg" data-price="3000"><img class="coupon_img" alt="" src="/resources/images/coupon/wash_car_coupon.jpg"><br>
					<span>3000point</span></a>
				</td>
				<td>
					<a class="a_coupon" href="/resources/images/coupon/oil_30000_coupon.png" data-price="30000"><img class="coupon_img" alt="" src="/resources/images/coupon/oil_30000_coupon.png"><br>
					<span>3만point</span></a>
				</td>
				<td>
					<a class="a_coupon" href="/resources/images/coupon/oil_50000_coupon.jpg" data-price="50000"><img class="coupon_img" alt="" src="/resources/images/coupon/oil_50000_coupon.jpg"><br>
					<span>5만point</span></a>
				</td>
			</tr>
		</table>
	</div>
	<div class="col-md-2">
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>