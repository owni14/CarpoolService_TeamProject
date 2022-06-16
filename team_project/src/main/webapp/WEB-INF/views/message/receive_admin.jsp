<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "/WEB-INF/views/message/message_sidebar_header.jsp" %>

<div class="border">
	<h3>받은 쪽지함</h3>
	<div class="tabbable" id="tabs-754123">
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link active" href="#" data-toggle="tab">시스템 쪽지</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/message/recUserMessagePage" data-toggle="tab">유저 쪽지</a>
			</li>
		</ul>
		<table class="table">
			<tr>
				<th>보낸사람</th>
				<th>내용</th>
				<th>받은날짜</th>
			</tr>
			
			
			<c:forEach items="${recAdminMessageList}" var="MessageVo">
			<tr>
				<td id="th_receiver"><span>${MessageVo.sender_admin_code}</span></td>
				<td id="th_content"><span>
				<c:choose>
				<c:when test="${MessageVo.content.length() >=30}">${MessageVo.content.substring(0,30)}...</c:when>
				<c:otherwise>
				${MessageVo.content}
				</c:otherwise>
				</c:choose></span></td>
				<td id="th_senddate"><span>${MessageVo.senddate}</span></td>
			</tr>
			</c:forEach>
		</table>
	</div>
</div>
<%@ include file = "/WEB-INF/views/message/message_sidebar_footer.jsp" %>
			
