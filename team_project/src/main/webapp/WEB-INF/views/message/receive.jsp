<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "/WEB-INF/views/message/message_sidebar_header.jsp" %>

<div class="border">
	<h3>받은 쪽지함</h3>
	<div class="tabbable" id="tabs-754123">
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link active" href="#tab1" data-toggle="tab">시스템 쪽지</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#tab2" data-toggle="tab">유저 쪽지</a>
			</li>
		</ul>
		<table class="table">
			<tr>
				<th>보낸사람</th>
				<th>내용</th>
				<th>받은날짜</th>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
</div>
<%@ include file = "/WEB-INF/views/message/message_sidebar_footer.jsp" %>
			
