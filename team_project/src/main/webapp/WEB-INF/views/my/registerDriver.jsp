<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<form role="form">
			<div class="form-group">
				<label for="exampleInputEmail1"> 성명 </label> 
				<input type="email" class="form-control" id="exampleInputEmail1" placeholder="이름을 입력해주세요"/>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1"> 생년월일 </label> 
				<input type="password" class="form-control" id="exampleInputPassword1" placeholder="ex)990101"/>
			</div>
			<div class="form-group">
				<label for="exampleInputFile"> 운전면허증 </label> 
				<input type="file" class="form-control-file" id="exampleInputFile" />
			</div>
			<button type="submit" class="btn btn-primary" style="margin-bottom: 20px">등록하기</button>
		</form>
	</div>
	<div class="col-md-2"></div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>>
