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
								<i class="icofont icofont-warning bg-c-pink"></i>
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
						<i class="icofont icofont-sand-clock"></i>
						<h5>날짜 별 신고 현황</h5>
					</div>
					<div class="card-block table-border-style">
						<div class="table-responsive"> 
						<div class="row">
						<div class="col-md-12 col-xl-3" style="margin-left:20px">
							<!-- chart Start -->
							<canvas id="canvas" height="300"></canvas>
							<script>
							new Chart(document.getElementById("canvas"), {
							    type: 'bar',
							    data: {
							        labels: ['완료', '미완료', '10일 경과'],
							        datasets: [{
							            label: '신고 완료 처리',
							            data: [
							                10,
							                23,
							                2
							            ],
							            backgroundColor: [
							            	"rgba(54, 162, 235, 0.2)",
							            	"rgba(255, 205, 86, 0.2)",
							            	"rgba(255, 99, 132, 0.2)"
							            	],
							            borderColor: [
							            	"rgba(54, 162, 235, 1)",
							            	"rgba(255, 205, 86, 1)",
							            	"rgba(255, 99, 132, 1)"
							            	],
							            fill: true,
							        }]
							    },
							    options: {
							        responsive: true,
							        title: {
							            display: true,
							            text: '신고 리스트 관리 현황'
							        },
							        tooltips: {
							            mode: 'index',
							            intersect: false,
							            callbacks: {
							                title: function(tooltipItems, data) {
							                    return data.labels[tooltipItems[0].datasetIndex];
							                }
							            }
							        },
							        hover: {
							            mode: 'nearest',
							            intersect: true
							        },
							        scales: {
							            xAxes: [{
							                display: true,
							                scaleLabel: {
							                    display: false,
							                    labelString: 'x축'
							                },
							                ticks: {
							                    autoSkip: false
							                }
							            }],
							            yAxes: [{
							                display: true,
							                ticks: {
							                    suggestedMin: 0,
							                },
							                scaleLabel: {
							                    display: false,
							                    labelString: 'y축'
							                }
							            }]
							        }
							    }
							});
							</script>
							<!-- chart Ends -->
						</div>
						<div class="col-md-12 col-xl-8" style="margin-top:10px">
						<!-- Basic table card start -->
<!-- 					<div class="card"> -->
<!-- 					<div class="card-block table-border-style"> -->
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>신고자 아이디</th>
										<th>신고 받은 회원 아이디</th>
										<th>신고 내용</th>
										<th>처리 결과</th>
										<th>등록 일자</th>
									</tr>
								</thead>
								<tbody>
<%-- 									<c:forEach var="memberVo" items="${memberList}" varStatus="status"> --%>
<!-- 									<tr>	 -->
<%-- 										<th scope="row">${status.count}</th> --%>
<%-- 										<td>${memberVo.m_id}</td> --%>
<%-- 										<td>${memberVo.m_name}</td> --%>
<%-- 										<td>${memberVo.gender}</td> --%>
<%-- 										<td>${memberVo.m_company}</td> --%>
<%-- 										<td>${memberVo.m_address}</td> --%>
<%-- 										<td>${memberVo.m_cellphone}</td> --%>
<%-- 										<td>${memberVo.m_point}</td> --%>
<%-- 										<td>${memberVo.m_evl}</td> --%>
<%-- 										<td>${memberVo.m_blackpoint}</td> --%>
<%-- 										<td>${memberVo.m_is_drop}</td> --%>
<!-- 									</tr> -->
<%-- 									</c:forEach> --%>
								</tbody>
							</table>
						</div>
<!-- 					</div> -->
<!-- 				</div> -->
				<!-- start pagination -->

				<!-- end pagination  -->
				<!-- Basic table card end -->
						</div>
						</div>
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