<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
.jumbotron { background-color: rgba(54, 162, 235, 0.2);}
.jumb_text { margin-left: 20%; }
.card-body { margin: 20px; float:left; width: 200px; height: 180px; border-color: orange; }
.card-body:hover { color:white; background-color: orange; cursor: pointer; box-shadow: 2px 2px gray;}
</style>

<script>
$(document).ready(function() {
	$(".card-body").click(function() {
		$(".faq_content").css("display", "block");
		// 아래위로 textarea가 두개나옴 한개나오게 만들어야됨, 
	});
});
</script>

<div class="affix row">
	<div class="col-md-12">
		<div class="jumbotron">
			<h2 class="jumb_text">고객 센터</h2>
			<p class="jumb_text">문의 사항을 처리해 드립니다.</p>
		</div>
	</div>
</div>
<div class="row" style="width:1924px">
	<div class="col-md-2">
	</div>
	<div class="col-md-8" style="overflow: hidden;" >
	<div class="col-xs-12" style="overflow: hidden;" >
	
	<c:forEach var="faqVo" items="${faqList}" varStatus="status">
		<div class="card-body border rounded " style="overflow: hidden">
			<span style="font-size: 30px; font-weight: bold;" class=text-muted>${faqVo.faq_seq}</span><br>
			<span >${faqVo.faq_title}</span>
		</div>
		<c:if test="${status.count % 5 == 0}">
			<textarea class="form-control faq_content" style="display: none;"></textarea>
		</c:if>
	</c:forEach>
	
	</div>
	</div>
	<div class="col-md-2">
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>