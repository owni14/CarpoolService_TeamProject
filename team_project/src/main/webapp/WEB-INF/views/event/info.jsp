<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>
<div class="row">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-2">
			</div>
			<div class="col-md-8">
				<div class="jumbotron">
					<h2 style="margin-bottom:50px;">
						이벤트 &amp; 혜택
					</h2>
					<p>
						다양한 이벤트와 등급별 혜택을 만나보세요!!
					</p>
				</div>
				<div class="tabbable" id="tabs-391804">
					<ul class="nav nav-tabs">
						<li class="nav-item">
							<a class="nav-link" href="/event/now">진행중인 이벤트</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/event/winner">당첨자 발표</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active" href="#">등급별 혜택</a>
						</li>
					</ul>
					
				</div>
			</div>
			<div class="col-md-2">
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>