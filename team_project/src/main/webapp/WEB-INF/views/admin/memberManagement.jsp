<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>
${pagingDto}
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
						<i class="icofont icofont-ui-user"></i>
						<h5>회원 테이블</h5>
						<div class="card-header-right">
							<ul class="list-unstyled card-option">
								<li><i class="icofont icofont-simple-left "></i></li>
								<li>
									<select name="perPage" id="perPage" style="height:20px; display:inline-block;">
										<option>5줄 보기</option>
										<option>10줄 보기</option>
										<option>15줄 보기</option>
										<option>20줄 보기</option>
									</select>
								</li>
<!-- 								<li> -->
<!-- 									<select name="searchType" id="searchType"> -->
<!-- 										<option>회원 아이디</option> -->
<!-- 										<option>이름</option> -->
<!-- 										<option>성별</option> -->
<!-- 										<option>회사</option> -->
<!-- 										<option>연락처</option> -->
<!-- 										<option>회원 탈퇴 여부</option> -->
<!-- 									</select> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<input type="text" id="keyword" name="keyword"/> -->
<!-- 								</li> -->
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
				<!-- start pagination -->
				<div class="row">
					<div class="col-md-12">
						<nav>
							<ul class="pagination justify-content-center" >
								<c:if test="${pagingDto.startPage != 1}">
								<li class="page-item">
									<a class="page-link" href="/admin/member_management?page=${pagingDto.startPage - 1}">이전</a>
								</li>
								</c:if>
								<c:forEach var="v" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
								<li 
									<c:choose>
										<c:when test="${v == param.page}">
											class="page-item active"
										</c:when>
										<c:otherwise>
											class="page-item"
										</c:otherwise>
									</c:choose>
								>
									<a class="page-link" href="/admin/member_management?page=${v}">${v}</a>
								</li>
								</c:forEach>
								<c:if test="${pagingDto.endPage != pagingDto.totalPage}">
								<li class="page-item">
									<a class="page-link" href="/admin/member_management?page=${pagingDto.endPage + 1}">다음</a>
								</li>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>
				<!-- end pagination  -->
				<!-- Basic table card end -->
			</div>
		</div>
	</div>
</div>
<!-- end inner header -->
				
<%@ include file="/WEB-INF/views/include_admin/footer.jsp"%>