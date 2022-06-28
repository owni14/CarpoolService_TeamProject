<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>
<%@ include file="/WEB-INF/views/include_admin/alert.jsp" %>
	<!-- CSS -->
	<link rel="stylesheet" href="/resources/movie/css/bootstrap-reboot.min.css">
	<link rel="stylesheet" href="/resources/movie/css/bootstrap-grid.min.css">
	<link rel="stylesheet" href="/resources/movie/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/resources/movie/css/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" href="/resources/movie/css/nouislider.min.css">
	<link rel="stylesheet" href="/resources/movie/css/ionicons.min.css">
	<link rel="stylesheet" href="/resources/movie/css/plyr.css">
	<link rel="stylesheet" href="/resources/movie/css/photoswipe.css">
	<link rel="stylesheet" href="/resources/movie/css/default-skin.css">
	<link rel="stylesheet" href="/resources/movie/css/main.css">
<script>
	$(document).ready(function () {
		$(".divLicense").click(function() {
			var m_id = $(this).attr("data-m_id");
			$("#frmApprove").attr("action","/admin/approveDriver");
			$("#frmApprove").attr("method","post");
			$("#frmApprove").find("input[name=m_id]").val(m_id);
			$("#frmApprove").submit();
		});
		
		$(".btn-cancel").click(function () {
			var m_id = $(this).attr("data-m_id");
			var sender_admin_code = "${sessionScope.admin_code}";
			var content = "운전자 등록이 취소 되었습니다.";
			$("#frmCancel").attr("action", "/admin/cancelDriver");
			$("#frmCancel").attr("method", "post");
			$("#frmCancel").find("input[name=m_id]").val(m_id);
			$("#frmCancel").find("input[name=sender_admin_code]").val(sender_admin_code);
			$("#frmCancel").find("input[name=content]").val(content);
// 			$("#frmCancel").submit();
		});
	});
</script>
<%@ include file="/WEB-INF/views/include/frmPaging.jsp" %>
<!-- start inner header -->
	<div class="pcoded-inner-content">
		<!-- Main-body start -->
		<div class="main-body">
			<div class="page-wrapper">
				<!-- Page-header start -->
				<div class="page-header card">
					<div class="row align-items-end">
						<div class="col-lg-8">
							<div class="page-header-title">
								<i class="icofont icofont icofont-id bg-c-blue"></i>
								<div class="d-inline">
									<h4>미승인 운전자 리스트</h4>
									<span></span>
								</div>
							</div>
						</div>
					<div class="col-lg-4">
						<div class="page-header-breadcrumb">
							<ul class="breadcrumb-title">
								<li class="breadcrumb-item">
								<a href="/admin/home"><i class="icofont icofont-home"></i></a>
								</li>
								<li class="breadcrumb-item"><a href="#!">회원 관리</a></li>
								<li class="breadcrumb-item"><a href="#!">미승인 운전자 리스트</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- Page-header end -->
			<!-- Page-body start -->
			<div class="page-body">
			<!-- Basic table card start -->
			<div class="card">
			<div class="col-lg-12">
					<div class="card-header">
						<i class="icofont icofont-ui-v-card"></i>
						<h5>미승인 운전자 리스트</h5>
					</div>
					<!-- 새로운 리스트 만들기 start -->

	<!-- catalog -->
	<div class="catalog">
		<div class="container">
			<div class="row">
			<form id="frmApprove">
				<input type="hidden" name="m_id">
				<input type="hidden" name="check_page" value="approveDriver_management">
			</form>
			<form id="frmCancel">
				<input type="hidden" name="m_id">
				<input type="hidden" name="sender_admin_code">
				<input type="hidden" name="content">
			</form>
				<!-- card -->
				<c:forEach items="${notApprovedDriverList}" var="map">
				<div class="col-md-6" style="margin-top:15px;">
						<div class="card__cover divLicense" data-m_id="${map.M_ID}">
							<img src="/admin/displayLicenseImage?ad_license_img=${map.AD_LICENSE_IMG}" alt="면허증 이미지" style="width:100%">
						</div>
						<div class="card__content" style="margin-left: 70px">
							<h3 class="card_title">${map.M_ID}</h3>
							<span>${map.M_NAME}</span>
							<span
				                <c:if test="${map.GENDER == 'M'}">
				                    class="label bg-c-blue m-l-10 f-10"
				                </c:if>
				                    class="label bg-c-pink m-l-10 f-10"
                                >
			                    <c:choose>
				                <c:when test="${map.GENDER == 'M'}">
				                   		 남성회원
				                </c:when>
				                <c:otherwise>
				                     	  여성회원
				                </c:otherwise>
			                    </c:choose>
			                </span>
<!-- 							<span class="card__category" style="margin-top: 15px"> -->
<%-- 								<a href="#">${map.AD_DETAIL}</a> --%>
<!-- 							</span> -->
							<button type="button" class="btn btn-inverse btn-sm btn-cancel" 
							style="margin-right: 70px; float: right" 
								data-m_id = "${map.M_ID}" data-ad_license_img="${map.ad_license_img}">승인취소</button>
						</div>
					</div>
				</c:forEach>
				<!-- end card -->
			</div>
		</div>
	</div>
	<!-- end catalog -->

					<!-- 새로운 리스트 만들기 end -->
			</div>
		</div>
				<!-- Basic table card end -->
	</div>
			<!-- Page-body end -->
</div>
</div>
</div>
<!-- end inner header -->
				
<%@ include file="/WEB-INF/views/include_admin/footer.jsp"%>