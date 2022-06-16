<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "/WEB-INF/views/message/message_sidebar_header.jsp" %>

<script>
$(document).ready(function() {
	var frmPaging = $("#frmPaging");
	
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href")
		frmPaging.find("input[name=page]").val(page);
		frmPaging.attr("action", "/message/recAdminMessagePage");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
	$(".perPage").click(function(e) {
		e.preventDefault();
		var perPage = $(this).attr("href");
		
 		console.log(perPage);
		frmPaging.find("input[name=perPage]").val(perPage);
		frmPaging.attr("action", "/message/recAdminMessagePage");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
	$(".m_content_tr").click(function() {
		$("#message_read").modal('show');
		var sender = $(this).children().eq(0).text();
		var content = $(this).children().eq(1).attr("data-mContent");
		$("#sender").val(sender);
		$("#message_content").val(content);
	});
		
	$("#reMessage").click(function() {
		$("#message_read").modal('hide');
		$("#message_form_modal").modal('show');
		$("#receiver_m_id").val($("#sender").val());
		
	});
	
	$("#readClose").click(function() {
		$("#message_read").modal('hide');
	});
	
});
</script>

<%@ include file="/WEB-INF/views/include/frmPaging.jsp" %>
<div class="border">
	<h3>받은 쪽지함</h3>
	<div class="tabbable" id="tabs-754123">
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link active" href="#">시스템 쪽지</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/message/recUserMessagePage">유저 쪽지</a>
			</li>
		</ul>
		
		<!-- perPage Start -->
		<div class="dropdown" style="float: right;">
			<button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown">
				${pagingDto.perPage}개씩 보기
			</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				<c:forEach var="v" begin="5" end="20" step="5">
					<a class="dropdown-item perPage" href="${v}">${v}개 보기</a>
				</c:forEach>
			</div>
		</div>
		<!-- perPage End -->
		
		<table class="table">
			<tr>
				<th>보낸사람</th>
				<th>내용</th>
				<th>받은날짜</th>
			</tr>
			<c:forEach items="${recAdminMessageList}" var="MessageVo">
			<tr class="m_content_tr">
			
				<td id="td_receiver">${MessageVo.ADMIN_WORK}</td>
				<td id="td_content" data-mContent="${MessageVo.CONTENT}">
				<c:choose>
	 				<c:when test="${MessageVo.CONTENT.length() >=30}">${MessageVo.CONTENT.substring(0,30)}...</c:when> 
					<c:otherwise>${MessageVo.CONTENT}</c:otherwise>
				</c:choose></td>
				<td id="td_senddate">${MessageVo.SENDDATE}</td>
			
			</tr>
			</c:forEach>
		</table>
	</div>
</div>
<%@ include file = "/WEB-INF/views/message/message_sidebar_footer.jsp" %>
			
