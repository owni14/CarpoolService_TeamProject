<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>

<script>

	$(document).ready(function() {
		$("#select_liveEvent_seq").change(function(){
			
// 			console.log($(this).val());
			var event_seq=$(this).val();
			var form=$("#frmEvent");
			form.find("[name=event_seq]").val(event_seq);
			form.attr("action","/admin/event_participation?event_seq="+event_seq);
			form.submit();
		});
		

	$("#select_endEvent_seq").change(function() {
				var event_seq = $(this).val();
				var form = $("#frmEvent");
				form.find("[name=event_seq]").val(event_seq);
				form.attr("action","/admin/event_end_participation?event_seq="
				+ event_seq);
				form.submit();
						});
			});
</script>
<%@ include file="/WEB-INF/views/include_admin/frmEvent.jsp" %>

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
									<h4>이벤트  목록</h4>
									<select id="select_liveEvent_seq">
							<option disabled="disabled" selected="selected" value="">진행중인 이벤트(번호를 골라주세요)</option>
							<c:forEach items="${liveEventList}" var="eventSeq">
							<option value="${eventSeq}"
							<c:if test="${eventSeq eq param.event_seq}">
							selected</c:if>
							>${eventSeq}번(진행중)</option>
							</c:forEach>
							</select>
							
								<select id="select_endEvent_seq">
							<option disabled="disabled" selected="selected" value="">종료된 이벤트 (번호를 골라주세요)</option>
							<c:forEach items="${endEventList}" var="eventVo">
							<option value="${eventVo.event_seq}"
							<c:if test="${eventVo.event_seq eq param.event_seq}">
							selected</c:if>
							>${eventVo.event_seq}번(종료)</option>
							</c:forEach>
							</select>
									<span></span>
								</div>

							<div class="d-inline">
							
							</div>
							
						</div>
					</div>
					<div class="col-lg-4">
						참가인원&nbsp; :&nbsp; ${participationList.size()}&nbsp; /&nbsp;총원&nbsp;: &nbsp;${participationList.get(0).EVENT_MAX_COUNT} 
						(${participation_percentStr})%
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
						<tr class="table table-info">
							<th>#</th>
							<th>이벤트 번호</th>
							<th>이벤트 이름</th>
							<th>이벤트 참가자(id)</th>
							
						</tr>
						</thead>
						<tbody>
						
						<c:forEach items="${participationList}" var="eventParticipationVo" varStatus="i" >
						<tr >
						<td>${i.count}</td>
						<td>${eventParticipationVo.EVENT_SEQ}</td>
						<td>${eventParticipationVo.EVENT_NAME}</td>
						<td>${ eventParticipationVo.M_NAME}(${eventParticipationVo.M_ID})</td>
						
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