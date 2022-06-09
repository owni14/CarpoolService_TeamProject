<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
$(document).ready(function() {
	$("#btnSubmit").click(function() {
		
	});
});
</script>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<form role="form" action="/my/submitFile" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="name"> 이름 </label> 
				<input type="text" class="form-control" id="name" placeholder="이름을 입력해주세요"/>
			</div>
			<div class="form-group">
				<label for="bithday"> 생년월일 </label> 
				<input type="text" class="form-control" id="bithday" placeholder="ex)990101"/>
			</div>
			<div class="form-group">
				<label for="driverLicense"> 운전면허증 </label> 
				<input type="file" class="form-control-file" id="driverLicense" name="driverLicense" />
			</div>
			<button id="btnSubmit" type="submit" class="btn btn-primary" style="margin-bottom: 20px">등록하기</button>
		</form>
	</div>
	<div class="col-md-2"></div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>>
