<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>
<style>
.trList:hover{
cursor: pointer;
}
</style>
<script>
	$(document).ready(function (e) {
		$(".aContent").click(function(){
			
			
		});
	});
</script>
<%@ include file="/WEB-INF/views/include_admin/frmApproveNotify.jsp" %>
${complainList}
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
								<i class="ti-help-alt" style="background-color:#54BD54"></i>
								<div class="d-inline">
									<h4>고객 문의 리스트</h4>
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
								<li class="breadcrumb-item">고객문의</li>
								
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
						<i class="icofont  icofont-notification"></i>
						<h5>답변 처리 현황</h5>
					</div>
					<div class="card-block table-border-style">
						<div class="table-responsive"> 
						<div class="row">
						<div class="col-md-12 col-xl-4" style="margin-left:20px">
							<!-- chart Start -->
							<canvas id="canvas" height="300"></canvas>
							<script>
							new Chart(document.getElementById("canvas"), {
							    type: 'bar',
							    data: {
							        labels: [''],
							        datasets: [{
							            label: '대기중',
							            data: [
							               
							            ],
							            backgroundColor: [
							            	"rgba(54, 162, 235, 0.2)",
							            	],
							            borderColor: [
							            	"rgba(54, 162, 235, 1)",
							            	],
							            fill: true,
							        }, {
							        	label: '7일경과',
							            data: [
							                
							            ],
							            backgroundColor: [
							            	"rgba(255, 205, 86, 0.2)"
							            	],
							            borderColor: [
							            	"rgba(255, 205, 86, 1)"
							            	]
							        }]
							    },
							    options: {
							        responsive: true,
							        title: {
							            display: true,
							            text: 
							            	'답변 진행 상황'
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
							                    display: true,
							                    labelString: '총 미처리 답변 갯수 : ${complain_count}' 
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
					</div>
				<!-- 처리 결과 Y table start -->
						<div class="row" style="padding-top:35px">
							<div class="col-md-12 col-xl-12" style="margin-left: 20px; padding-right : 140px">
								<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr style="background-color:rgba(54, 162, 235, 0.2)">
											<th>#</th>
											<th style="width:10%">
											분류
											
											</th>
											<th style="width:10%">관리자 코드(아이디)</th>
											<th style="width:10%">유저이름(id)</th>
											<th style="width:55%">문의내용</th>
											<th style="width:10%">처리 결과</th>
											<th style="width:5%">등록 일자</th>
											
										</tr>
									</thead>
									<tbody>
							
									<c:forEach items="${complainList}" var="complainVo" varStatus="i">	 
									
									<tr>
									
											<th scope="row">${i.count}</th>
											<th scope="row" data-classification="${complainVo.complain_classification}">${complainVo.complain_classification}	
											</th>
											<td data-admin_code="${complainVo.admin_code }">${complainVo.admin_code }</td>
											<td data-mid="${complainVo.m_id}">${complainVo.m_id }</td>
												<!-- collapse 드갈거 -->
											<td class="tdContent">
												<a class="aContent"
												data-toggle="collapse" href="#collapseExample${i.count }" 
												aria-expanded="false" aria-controls="collapseExample">
											  ${complainVo.complain_content }
											</a>
											
											<div class="collapse" id="collapseExample${i.count}">
											  <div class="well">
											   
											    <textarea class="form-control tareContent" data-content=" ${complainVo.complain_content }"></textarea>
											  </div>
												</div>
											</td>
											
											<!-- end collapse -->
											<td>${complainVo.complain_is_finish}</td>
											<td>${complainVo.complain_regdate}</td>
										
								</tr>
								
	 							</c:forEach>		
									</tbody>
								</table>
							
							
							</div>
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