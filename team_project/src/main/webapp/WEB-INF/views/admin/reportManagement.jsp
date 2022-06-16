<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>
<script>
	$(document).ready(function (e) {
		var frmApproveNotify = $("#frmApproveNotify");
		var frmPaging = $("#frmPaging"); 
		$("a.dropdown-item").click(function (e) {
			e.preventDefault();
			var blacklist_seqValue = $(this).attr("data-blacklistSeq");
			var admin_checkValue = $(this).attr("data-value");
			var blackScoreValue = $(this).attr("data-bScore");
			var black_m_id = $(this).attr("data-blackid");
			console.log(admin_checkValue); // 반려 : C, 반려 취소 : N, 승인 : Y
			frmApproveNotify.find("input[name=refresh]").val(1);
			frmApproveNotify.find("input[name=blacklist_seq]").val(blacklist_seqValue);
			frmApproveNotify.find("input[name=admin_check]").val(admin_checkValue);
			if (admin_checkValue == "N" || admin_checkValue == "C") {
				frmApproveNotify.find("input[name=black_score]").val(0);
				
			} else if (admin_checkValue == "Y") {
				frmApproveNotify.find("input[name=black_m_id]").val(black_m_id);
				frmApproveNotify.find("input[name=black_score]").val(blackScoreValue);
			}
				frmApproveNotify.attr("action","/admin/modifyBlackPoint");
				frmApproveNotify.attr("method","post");
			frmApproveNotify.submit();
		});
		
		$("#btnSearch").click(function () {
			var searchTypeValue = $("#searchTypeSelector").val();
			var keywordValue = $("#adminKeyword").val();
			
			var searchType = frmPaging.find("input[name=searchType]");
			searchType.val(searchTypeValue);
			var keyword = frmPaging.find("input[name=keyword]");
			keyword.val(keywordValue);
// 			frmPaging.find("input[name=page]").val(1);
			frmPaging.attr("action","/admin/report_management");
			frmPaging.attr("method","get");
			frmPaging.submit();
		});
		
	});
</script>
<%@ include file="/WEB-INF/views/include_admin/frmApproveNotify.jsp" %>
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
							        labels: [''],
							        datasets: [{
							            label: '완료',
							            data: [
							                "${totalNotifyCount - (nNotifyCount + cNotifyCount)}"
							            ],
							            backgroundColor: [
							            	"rgba(54, 162, 235, 0.2)",
							            	],
							            borderColor: [
							            	"rgba(54, 162, 235, 1)",
							            	],
							            fill: true,
							        }, {
							        	label: '미완료',
							            data: [
							                "${nNotifyCount}"
							            ],
							            backgroundColor: [
							            	"rgba(255, 205, 86, 0.2)"
							            	],
							            borderColor: [
							            	"rgba(255, 205, 86, 1)"
							            	]
							        }, {
							        	label: '10일 경과',
							            data: [
							            	"${dayNotifyCount}"
							            ],
							            backgroundColor: [
							            	"rgba(255, 99, 132, 0.2)"
							            	],
							            borderColor: [
							            	"rgba(255, 99, 132, 1)"
							            	]
							        }, {
							        	label: '신고 반려',
							            data: [
							            	"${cNotifyCount}"
							            ],
							            backgroundColor: [
							            	"rgba(201, 203, 207, 0.2)"
							            	],
							            borderColor: [
							            	"rgba(201, 203, 207, 1)"
							            	]
							        }]
							    },
							    options: {
							        responsive: true,
							        title: {
							            display: true,
							            text: 
							            	'신고 리스트 관리 현황'
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
							                    labelString: '총 신고 리스트 갯수 : ${totalNotifyCount}건' 
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
						<!-- search start -->
						<h6>
							<select id="searchTypeSelector" name="searchTypeSelector" style="height:25px">
		<!-- notifying id -->	<option value="ni" 
									<c:if test="${pagingDto.searchType == 'ni'}">
										selected
									</c:if>
								>신고자 아이디</option>
		<!-- notifyed id -->	<option value="ndi"
									<c:if test="${pagingDto.searchType == 'ndi'}">
										selected
									</c:if>
								>신고 받은 회원 아이디</option>
								<option value="c"
									<c:if test="${pagingDto.searchType == 'c'}">
										selected
									</c:if>
								>신고 내용</option>
							</select>
						
							<input type="text" id="adminKeyword" name="adminKeyword" style="height:25px">
							<button id="btnSearch" style="background-color:white; border-color: #d2d2d2">검색&nbsp;&nbsp;<i class="icofont icofont-search-alt-2"></i></button>
						</h6>
						<!-- search end -->
						<!-- Basic table card start -->
<!-- 					<div class="card"> -->
<!-- 					<div class="card-block table-border-style"> -->
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr style="background-color:rgba(255, 205, 86, 0.2)">
										<th>#</th>
										<th>신고자 아이디</th>
										<th>신고 받은 회원 아이디</th>
										<th>신고 내용</th>
										<th>처리 결과</th>
										<th>등록 일자</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="blackListVo" items="${nNotifyList}" varStatus="status"> 
								<tr>	 
										<th scope="row">${status.count}</th>
										<td>${blackListVo.m_id}</td>
										<td>${blackListVo.black_m_id}</td>
										<td>${blackListVo.black_content}</td>
										<td>
											<!-- dropdown start -->
											<button class="btn dropdown-toggle" type="button" style="background-color:white; padding-top:0px; color:red"
												id="dropdownMenuButton1" data-toggle="dropdown">
												${blackListVo.black_is_processed}</button>
											<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item" href="#" data-blacklistSeq="${blackListVo.blacklist_seq}" data-value="Y" data-bScore="${blackListVo.black_score}" data-blackid="${blackListVo.black_m_id}">승인</a> 
												<a class="dropdown-item" href="#" data-blacklistSeq="${blackListVo.blacklist_seq}" data-value="C">반려</a>
											</div> 
											<!-- dropdown end -->
										</td>
										<td>${blackListVo.black_regdate}</td>
										
							</tr>
 									</c:forEach> 
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
				<!-- 10일 경과 table start -->
						<div class="row" style="padding-top:35px">
							<div class="col-md-12 col-xl-12" style="margin-left: 20px; padding-right : 140px">
								<div class="table-responsive">
								<table class="table">
									<thead>
										<tr style="background-color:rgba(255, 99, 132, 0.2)">
											<th>#</th>
											<th style="width:10%">신고자 아이디</th>
											<th style="width:10%">신고 받은 회원 아이디</th>
											<th style="width:55%">신고 내용</th>
											<th style="width:10%">처리 결과</th>
											<th style="width:15%">등록 일자</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="blackListVo" items="${dayNotifyList}" varStatus="status"> 
									<tr>	 
											<th scope="row">${status.count}</th>
											<td>${blackListVo.m_id}</td>
											<td>${blackListVo.black_m_id}</td>
											<td>${blackListVo.black_content}</td>
											<td>
											<!-- dropdown start -->
											<button class="btn dropdown-toggle" type="button" style="background-color:white; padding-top:0px; color:red"
												id="dropdownMenuButton2" data-toggle="dropdown">
												${blackListVo.black_is_processed}</button>
											<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item" href="#" data-blacklistSeq="${blackListVo.blacklist_seq}" data-value="Y" data-bScore="${blackListVo.black_score}">승인</a> 
												<a class="dropdown-item" href="#" data-blacklistSeq="${blackListVo.blacklist_seq}" data-value="C">반려</a> 
											</div> 
											<!-- dropdown end -->
											</td>
											<td><span style="color:red">${blackListVo.black_regdate}</span></td>
											
								</tr>
	 									</c:forEach> 
									</tbody>
								</table>
							</div>
							</div>
						</div>
				<!-- 10일 경과 table end -->
				<!-- 반려 table start -->
						<div class="row" style="padding-top:35px">
							<div class="col-md-12 col-xl-12" style="margin-left: 20px; padding-right : 140px">
								<div class="table-responsive">
								<table class="table">
									<thead>
										<tr style="background-color:rgba(201, 203, 207, 0.2)">
											<th>#</th>
											<th style="width:10%">신고자 아이디</th>
											<th style="width:10%">신고 받은 회원 아이디</th>
											<th style="width:55%">신고 내용</th>
											<th style="width:10%">처리 결과</th>
											<th style="width:15%">등록 일자</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="blackListVo" items="${cNotifyList}" varStatus="status"> 
									<tr>	 
											<th scope="row">${status.count}</th>
											<td>${blackListVo.m_id}</td>
											<td>${blackListVo.black_m_id}</td>
											<td>${blackListVo.black_content}</td>
											<td>
												<!-- dropdown start -->
												<button class="btn dropdown-toggle" type="button" style="background-color:white; padding-top:0px; color:rgba(201, 203, 207,10)"
													id="dropdownMenuButton3" data-toggle="dropdown">
													${blackListVo.black_is_processed}</button>
												<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
													<a class="dropdown-item" href="#" data-blacklistSeq="${blackListVo.blacklist_seq}" data-value="N">반려 취소</a> 
												</div> 
												<!-- dropdown end -->
											</td>
											<td>${blackListVo.black_regdate}</td>
											
								</tr>
	 									</c:forEach> 
									</tbody>
								</table>
							</div>
							</div>
						</div>
				<!-- 반려 table end -->
						</div>
					</div>
				</div>
				<!-- Basic table card end -->
			</div>
		</div>
	</div>
</div>
<!-- end inner header -->
