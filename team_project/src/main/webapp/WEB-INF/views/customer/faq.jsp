<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/customer/customer_header.jsp" %>
<style>
.card-body { margin: 20px; float:left; width: 200px; height: 180px; border-color: orange; }
.card-body:hover { color:white; background-color: orange; cursor: pointer; box-shadow: 2px 2px gray;}
</style>

<script>
$(document).ready(function() {
	var isVisible5 = false;
	var isVisible10 = false;
	$(".card-body").click(function() {
		
		var count = $(this).attr("data-count");
		var content = $(this).attr("data-content");
		if (count <= 5) {
			isVisible5 = true;
			isVisible10 = false;
			if (isVisible5) {
				$("#faq_content5").slideDown();
				$("#faq_content10").slideUp();
			}
			$("#faq_content5").val(content);
		} else {
			isVisible5 = false;
			isVisible10 = true;
			if (isVisible10) {
				$("#faq_content5").slideUp();
				$("#faq_content10").slideDown();
				
			}
			$("#faq_content10").val(content);
		}
	});
});
</script>

<div class="row" style="width:1924px">
	<div class="col-md-2">
	</div>
	<div class="col-md-8" style="overflow: hidden;" >
	<div class="col-xs-12" style="overflow: hidden;" >
	
	<c:forEach var="faqVo" items="${faqList}" varStatus="status">
		<div class="card-body border rounded " style="overflow: hidden" data-count="${status.count}" data-content="${faqVo.faq_content}">
			<span style="font-size: 30px; font-weight: bold;" class=text-muted>${faqVo.faq_seq}</span><br>
			<span >${faqVo.faq_title}</span>
		</div>
		<c:if test="${status.count % 5 == 0}" >
			<textarea class="form-control" id="faq_content${status.count}" style="display: none; background-color: white; height: 500px;" readonly ></textarea>
		</c:if>
	</c:forEach>
	
	</div>
	</div>
	<div class="col-md-2">
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>