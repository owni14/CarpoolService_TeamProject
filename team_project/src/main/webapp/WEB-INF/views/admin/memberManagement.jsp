<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>
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
									<h4>회원 테이블</h4>
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
								<li class="breadcrumb-item"><a href="#!">회원관리</a></li>
								<li class="breadcrumb-item"><a href="#!">회원테이블</a></li>
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
						<h5>회원 테이블</h5>
						<div class="card-header-right">
							<ul class="list-unstyled card-option">
								<li><i class="icofont icofont-simple-left "></i></li>
								<li><i class="icofont icofont-maximize full-card"></i></li>
								<li><i class="icofont icofont-minus minimize-card"></i></li>
								<li><i class="icofont icofont-refresh reload-card"></i></li>
								<li><i class="icofont icofont-error close-card"></i></li>
							</ul>
						</div>
					</div>
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>회원 아이디</th>
										<th>이름</th>
										<th>성별</th>
										<th>회사</th>
										<th>주소</th>
										<th>연락처</th>
										<th>포인트</th>
										<th>평점</th>
										<th>벌점</th>
										<th>회원 탈퇴 여부</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="memberVo" items="${memberList}" varStatus="status">
									<tr>	
										<th scope="row">${status.count}</th>
										<td>${memberVo.m_id}</td>
										<td>${memberVo.m_name}</td>
										<td>${memberVo.gender}</td>
										<td>${memberVo.m_company}</td>
										<td>${memberVo.m_address}</td>
										<td>${memberVo.m_cellphone}</td>
										<td>${memberVo.m_point}</td>
										<td>${memberVo.m_evl}</td>
										<td>${memberVo.m_blackpoint}</td>
										<td>${memberVo.m_is_drop}</td>
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
</div>
<!-- end inner header -->
				
<%@ include file="/WEB-INF/views/include_admin/footer.jsp"%>