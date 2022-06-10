<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
.jumbotron { background-color: rgba(54, 162, 235, 0.2);}
.jumb_text { margin-left: 20%; }
.card-body { width : 200px; height: 150px; background-color: orange;}
</style>
<div class="row">
	<div class="col-md-12">
		<div class="jumbotron">
			<h2 class="jumb_text">고객 센터</h2>
			<p class="jumb_text">문의 사항을 처리해 드립니다.</p>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
	<div class="card-body">
	</div>
	</div>
	<div class="col-md-2">
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>