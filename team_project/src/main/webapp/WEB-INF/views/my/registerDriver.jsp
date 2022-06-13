<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
$(document).ready(function() {
	var carImg = $("#carImg");
	$("#ci_name").change(function() {
		var car_name = $(this).val();
		console.log(car_name);
		carImg.attr("src", "/resources/images/carImage/" + car_name + ".png");
	});
});
</script>
<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<form role="form" action="/my/submitFile" method="post" enctype="multipart/form-data">
			<div class="form-group" style="text-align: center;">
				<span style="font-size: 50px;">운전자 등록</span>
			</div>
			<div class="form-group">
				<label>차 선택</label><br>
				<select class="form-control btn" id="ci_name" name="ci_name">
					<option>차량을 선택해주세요</option>
					<option value="GV80">GV80</option>
					<option value="PALISADE">팰리세이드</option>
					<option value="SORENTO">쏘렌토</option>
					<option value="SPORTAGE">스포티지</option>
					<option value="TUCSON">투싼</option>
					<option value="AVANTE">아반떼</option>
				</select>
			</div>
			<div class="form-group">
				<img id="carImg" alt="carImage" src="/resources/images/carImage/DEFAULT.png" width="614px" height="400px">
			</div>
			<div class="form-group">
				<label for="c_no"> 차량번호 </label> 
				<input type="text" class="form-control" name="c_no" placeholder="ex)001가0001">
			</div>
			<div class="form-group">
				<label for="driverLicense"> 운전면허증 </label> 
				<input type="file" class="form-control-file" id="driverLicense" name="driverLicense" />
			</div>
			<button id="btnSubmit" type="submit" class="btn btn-primary" style="margin-bottom: 20px">등록하기</button>
		</form>
	</div>
	<div class="col-md-4"></div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>>
