<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>


${participationList}
<!-- start Event inner header -->
<!-- <img src="/admin/displayImage?filename=//192.168.0.232/ServerFolder/editor/multiupload/202206071905312924d017-f20d-49e2-bfda-8a2184b78627.jpg"> -->
<div class="pcoded-inner-content">
	<!-- Main-body start -->
	<div class="main-body">
		<div class="page-wrapper">
			<!-- Page-header start -->
			<div class="page-header card">
				
				<div class="row align-items-end">
					<div class="col-lg-8">
						

						<div class="page-header-title">
							<i class="icofont icofont-trophy bg-c-blue"></i>
								<div class="d-inline">
									<h4>이벤트 당첨자 목록</h4>
									<select id="select_event_seq">
							<option disabled="disabled" selected="selected" value="">이벤트 번호를 골라주세요</option>
							</select>
									<span></span>
								</div>

							<div class="d-inline">
							
							</div>
							
						</div>
					</div>
					<div class="col-lg-4">

						<div class="page-header-breadcrumb">
							<ul class="breadcrumb-title">
								<li class="breadcrumb-item"><a href="/admin/home"><i
										class="icofont icofont-home"></i></a></li>
								<li class="breadcrumb-item">이벤트</li>
								<li class="breadcrumb-item"><a href="/admin/event">이벤트 목록</a></li>
							</ul>

						</div>
					</div>
				</div>
			</div>

			<!-- end Event inner header -->



			<!-- Page-body start -->
			<div class="page-body">
				<!-- Basic table card start -->
				<div class="card">
					<div class="card-header">
						<table class="table table-hover">
						<thead>
						<tr>
							<th>#</th>
							<th>이벤트 번호</th>
							<th>이벤트 이름</th>
							<th>이벤트 수령자(id)</th>
							<th>당첨여부</th>
						</tr>
						</thead>
						<tbody>
						
						<c:forEach items="${participationList}" var="eventParticipationVo" varStatus="i" >
						<tr class=<c:choose>
						<c:when test="${eventParticipationVo.EP_IS_WINNER eq 'Y' }">"table-success"</c:when>
						<c:otherwise>"table-warning"</c:otherwise>
						</c:choose>
						>
						<td>${i.count}</td>
						<td>${eventParticipationVo.EVENT_SEQ}</td>
						<td>${eventParticipationVo.EVENT_NAME}</td>
						<td>${eventParticipationVo.M_ID}</td>
						<td><c:choose>
						<c:when test="${eventParticipationVo.EP_IS_WINNER eq 'Y' }">당첨</c:when>
						<c:otherwise>미당첨</c:otherwise>
						</c:choose></td>
						</tr>
						</c:forEach>
						</tbody>
						</table>

					</div>
				</div>
			</div>
			<!-- Basic table card end -->
		</div>
	</div>
</div>





<%@ include file="/WEB-INF/views/include_admin/footer.jsp"%>