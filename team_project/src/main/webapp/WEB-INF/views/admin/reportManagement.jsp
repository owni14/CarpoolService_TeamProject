<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>
<script>
	$(document).ready(function () {
		
	});
</script>
<%-- <%@ include file="/WEB-INF/views/include/frmPaging.jsp" %> --%>
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
								<i class="icofont icofont-table bg-c-blue"></i>
								<div class="d-inline">
									<h4>신고 회원 테이블</h4>
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
								<li class="breadcrumb-item"><a href="#!">신고 회원 관리</a></li>
								<li class="breadcrumb-item"><a href="#!">신고 회원 테이블</a></li>
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
					<div class="card-header">
						<i class="icofont icofont-ui-user"></i>
						<h5>회원 테이블</h5>
					</div>
					<div class="card-block table-border-style">
						<div class="table-responsive">
<!-- 							<table class="table"> -->
								<h1>신고 회원 관리 페이지</h1>
<!-- 							</table> -->
						</div>
					</div>
				</div>
				<!-- Basic table card end -->
			</div>
		</div>
	</div>
</div>
<!-- end inner header -->
				
<%@ include file="/WEB-INF/views/include_admin/footer.jsp"%>