<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
		<div class="row">
			<div class="col-md-4">
				<h1>
	                <a href="#">쪽지</a>
	            </h1>
	            <ul id="NoteBoxMenu">
	                <li>
	                    <a href="/notebox/list/4">받은 쪽지함</a>
	                </li>
	                <li>
	                    <a href="/notebox/list/2">보낸 쪽지함</a>
	                </li>
	                <li>
	                    <a href="/notebox/list/5">보관함</a>
	                </li>
	                <li>
	                    <a href="/noteset/rejectlist ">설정</a>
	                </li>
	            </ul>
	            <a href="#">쪽지보내기</a>
			</div>
			<div class="col-md-8">
			</div>
		</div>
	</div>
	<div class="col-md-2">
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
