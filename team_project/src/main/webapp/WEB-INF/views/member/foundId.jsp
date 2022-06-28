<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4" style="margin-top: 100px; margin-bottom: 527px;">
		<div class="form-group" style="text-align: center; ">	
			<span style="font-size: 50px;">찾은 아이디</span>
		</div>
		<c:choose>
			<c:when test="${m_id != null}">
				<div style="text-align: center;">회원님의 아이디는 <span style="color: blue;">${m_id}</span> 입니다.</div>
				<a href="/member/loginForm"><i class="fa fa-arrow-left" aria-hidden="true"> 로그인 페이지로 이동</i></a>
			</c:when>
			<c:otherwise>
				<div style="text-align: center;">회원정보가 존재하지 않습니다.</div>
				<a href="/member/loginForm"><i class="fa fa-arrow-left" aria-hidden="true"> 로그인 페이지로 이동</i></a>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="col-md-4"></div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>