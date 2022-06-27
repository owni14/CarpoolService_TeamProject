<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include_admin/alert.jsp" %>
<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>
<script>
	$(document).ready(function (e) {
		var frmApproveNotify = $("#frmApproveNotify");
		$("a.dropdown-item").click(function (e) {
			e.preventDefault();
			var blacklist_seqValue = $(this).attr("data-blacklistSeq");
			var admin_checkValue = $(this).attr("data-value");
			var blackScoreValue = $(this).attr("data-bScore");
			var black_m_id = $(this).attr("data-blackid");
// 			frmApproveNotify.find("input[name=refresh]").val(1);
			frmApproveNotify.find("input[name=blacklist_seq]").val(blacklist_seqValue);
			frmApproveNotify.find("input[name=admin_check]").val(admin_checkValue);
			frmApproveNotify.find("input[name=black_m_id]").val(black_m_id);
			frmApproveNotify.find("input[name=black_score]").val(-1*blackScoreValue);
			frmApproveNotify.attr("action","/admin/modifyBlackPoint");
			frmApproveNotify.attr("method","post");
			frmApproveNotify.submit();
		});
		
		$(".fa-paper-plane").click(function () {
			$("#modal-97340").trigger("click");
			var reporter = $(this).attr("data-notifyingid");
			var blacklist_seq = $(this).attr("data-blacklistseq");
			var notifiedId = $(this).attr("data-notifiedid");
			var black_content = $(this).attr("data-content");
			console.log(blacklist_seq);
			$("#thReporter").text(reporter);
			$("#thNotifiedId").text(notifiedId);
			$("#btnModalSend").attr("data-blacklistseq",blacklist_seq);
			$("#txtReportContent").val("신고 내용 : " + black_content + "<br>신고 완료가 정상 처리 되었습니다.");
			var str = $("#txtReportContent").val();
			str = str.split("<br>").join("\r\n");
			$("#txtReportContent").val(str);
		});
		
		$("#btnModalSend").click(function () {
			var content = $("#txtReportContent").val();
			var receiver_m_id = $("#thReporter").text();
			var receiver_black_id = $("#thNotifiedId").text();
			var sender_admin_code = "${admin_code}";
			var blacklist_seq = $("#btnModalSend").attr("data-blacklistseq");
			console.log(content);
			console.log(receiver_black_id);
			console.log(sender_admin_code);
			var sData = {"receiver_m_id" : receiver_m_id,
						 "receiver_black_id" : receiver_black_id,
						 "sender_admin_code" : sender_admin_code,
						 "content" : content,
						 "blacklist_seq" : blacklist_seq};
			var url = "/message/notifyComplete";
			$.post(url,sData,function (rData) {
				console.log(rData);
				if(rData == "true") {
					checkSended();
				}
			});
		});
		
		$("#btnCancel").click(function () {
// 			$("#txtReportContent").text("");
		});
		
		function checkSended () {
			var url = "/message/checkSendedMessage";
			$.post(url, function (rData) {
				console.log("rData : " + rData);
				for (var v = 0; v < $(".sendMessage").length; v++) {
					for (var w=0; w < rData.length; w++) {
						console.log("w = " + w);
						console.log(rData[w]);
						console.log("blacklistseq = ", $(".sendMessage").eq(v).attr("data-blacklistseq"));
 						if (rData[w] == $(".sendMessage").eq(v).attr("data-blacklistseq")) {
							console.log("check 같은 값 v = " + v);	
 							$(".sendMessage").eq(v).attr("class","fa fa-check sendMessage");
 							$(".sendMessage").eq(v).parents("tr").find("button").css("visibility","hidden");
 							$(".sendMessage").eq(v).parents("tr").find("td").eq(3).text("신고 처리 완료").css("color","blue");
//  							$(".fa-paper-plane").eq(v).parents("tr").find("td").eq(5).text("신고 알림 완료").css("color","blue");
 						}
					}
				}
				
			});
		}
		
		checkSended();
	});
</script>
<%@ include file="/WEB-INF/views/include_admin/frmApproveNotify.jsp" %>
<!-- modal start -->
<div class="row">
		<div class="col-md-12">
			 <a id="modal-97340" href="#modal-container-97340" role="button" class="btn" data-toggle="modal" style="display:none">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-97340" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								신고 완료 알림 메세지
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<textarea id="txtReportContent" class="form-control" style="height: 100px"></textarea>
							<table style="margin-top: 20px; float: right;">
								<thead>
								<tr>
									<th>받는 사람(신고자)</th>
									<th id="thReporter" style="padding-left:10px"></th>
								</tr>
								<tr>
									<th>받는 사람(피신고자)</th>
									<th id="thNotifiedId" style="padding-left:10px"></th>
								</tr>
								</thead>
							</table>
						
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary" id="btnModalSend" data-dismiss="modal">
								전송
							</button> 
							<button type="button" class="btn btn-secondary" id="btnCancel" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
<!-- modal end -->

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
								<i class="icofont icofont-check bg-c-blue"></i>
								<div class="d-inline">
									<h4>신고 완료 리스트</h4>
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
								<li class="breadcrumb-item"><a href="#!">신고 완료 리스트</a></li>
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
						<div class="col-md-12 col-xl-4" style="margin-left:20px">
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
						
						<div class="col-md-12 col-xl-4" style="margin-left:20px">
							<table>
								<thead>
								<tr>
									<td><b><a href="#">블랙리스트 회원 (총 벌점 10점 이상 회원)</a></b></td>
								</tr>
								</thead>
								<tbody>
								<tr>
								<c:forEach begin="1" end="2" var="v" step="1">
									<c:set var="m_id" value="m_id${v}"></c:set>
									<c:set var="m_idPoint1" value="m_id${v}point1"></c:set>
									<c:set var="m_idPoint2" value="m_id${v}point2"></c:set>
									<c:set var="m_idPoint3" value="m_id${v}point3"></c:set>
									<c:set var="m_idPoint4" value="m_id${v}point4"></c:set>
									<c:set var="m_idPoint5" value="m_id${v}point5"></c:set>
									<td>
									<canvas id="marksChart${v}" width="400" height="400"></canvas>
									<div>
										<span style="font-size: 15px; margin-left: 150px">${requestScope[m_id]}</span>
										<span style="font-size: 15px; margin-left: 10px">총 ${1*requestScope[m_idPoint1] + 2*requestScope[m_idPoint2] + 3*requestScope[m_idPoint3]
										+ 4*requestScope[m_idPoint4] + 5*requestScope[m_idPoint5]}점</span>
									</div>
									<c:choose>
										<c:when test="${v == 1}">
									<script>
										var marksData = {
											  labels: ["1점", "2점", "3점","4점","5점"],
											  datasets: [{
											    label: "벌점",
											    backgroundColor: "rgba(255, 99, 132, 0.2)",
											    borderColor: "rgba(255, 99, 132, 1)",
											    fill: true,
											    radius: 3,
											    pointRadius: 3,
											    pointBorderWidth: 1,
											    pointBackgroundColor: "rgba(255, 99, 132, 1)",
											    pointBorderColor: "rgba(255, 99, 132, 1)",
											    pointHoverRadius: 10,
											    data: ["${requestScope[m_idPoint1]}","${requestScope[m_idPoint2]}","${requestScope[m_idPoint3]}",
											    	"${requestScope[m_idPoint4]}","${requestScope[m_idPoint5]}"]
											  }]
											};
											var chartOptions = {
											  scale: {
											    gridLines: {
											      color: "rgba(201, 203, 207, 0.2)",
											      lineWidth: 2.5
											    },
											    angleLines: {
											      display: true
											    },
											    ticks: {
											      beginAtZero: true,
											      min: 0,
											      max: 5,
											      stepSize: 1
											    },
											    pointLabels: {
											      fontSize: 13,
											      fontColor: "#2A0A0A"
											    }
											  },
											  legend: {
											    position: 'left'
											  }
											};
		
											new Chart(document.getElementById("marksChart${v}"), {
												  type: 'radar',
												  data: marksData,
												  options: chartOptions
												});
							</script>
								</c:when>
								<c:otherwise>
								<script>
										var marksData = {
											  labels: ["1점", "2점", "3점","4점","5점"],
											  datasets: [{
											    label: "벌점",
											    backgroundColor: "rgba(255, 159, 64, 0.2)",
											    borderColor: "rgba(255, 159, 64, 1)",
											    fill: true,
											    radius: 3,
											    pointRadius: 3,
											    pointBorderWidth: 1,
											    pointBackgroundColor: "rgba(255, 159, 64, 1)",
											    pointBorderColor: "rgba(255, 159, 64, 1)",
											    pointHoverRadius: 10,
											    data: ["${requestScope[m_idPoint1]}","${requestScope[m_idPoint2]}","${requestScope[m_idPoint3]}",
											    	"${requestScope[m_idPoint4]}","${requestScope[m_idPoint5]}"]
											  }]
											};
											var chartOptions = {
											  scale: {
											    gridLines: {
											      color: "rgba(201, 203, 207, 0.2)",
											      lineWidth: 2.5
											    },
											    angleLines: {
											      display: true
											    },
											    ticks: {
											      beginAtZero: true,
											      min: 0,
											      max: 5,
											      stepSize: 1
											    },
											    pointLabels: {
											      fontSize: 13,
											      fontColor: "#2A0A0A"
											    }
											  },
											  legend: {
											    position: 'left'
											  }
											};
		
											new Chart(document.getElementById("marksChart${v}"), {
												  type: 'radar',
												  data: marksData,
												  options: chartOptions
												});
							</script>
								</c:otherwise>
							</c:choose>
							</td>
							</c:forEach>
							</tr>
							
							</tbody>
							</table>
						</div>
					
					</div>
				<!-- 처리 결과 Y table start -->
						<div class="row" style="padding-top:35px">
							<div class="col-md-12 col-xl-12" style="margin-left: 20px; padding-right : 140px">
								<div class="table-responsive">
								<table class="table">
									<thead>
										<tr style="background-color:rgba(54, 162, 235, 0.2)">
											<th>#</th>
											<th style="width:10%">신고자 아이디</th>
											<th style="width:10%">신고 받은 회원 아이디</th>
											<th style="width:55%">신고 내용</th>
											<th style="width:10%">처리 결과</th>
											<th style="width:10%">등록 일자</th>
											<th style="width:5%">완료 알림</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="blackListVo" items="${yNotifyList}" varStatus="status"> 
									<tr>	 
											<th scope="row">${status.count}</th>
											<td>${blackListVo.m_id}</td>
											<td>${blackListVo.black_m_id}</td>
											<td>${blackListVo.black_content}</td>
											<td style="text-align: center">
												<!-- dropdown start -->
												<button class="btn dropdown-toggle" type="button" style="background-color:white; padding-top:0px; color:blue"
													id="dropdownMenuButton3" data-toggle="dropdown">
													${blackListVo.black_is_processed}</button>
												<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
													<a class="dropdown-item" href="#" data-blacklistSeq="${blackListVo.blacklist_seq}" data-value="N" data-bScore="${blackListVo.black_score}" data-blackid="${blackListVo.black_m_id}">승인취소</a> 
												</div> 
												<!-- dropdown end -->
											</td>
											<td>${blackListVo.black_regdate}</td>
											<td style="text-align: center"><i class="fa fa-paper-plane sendMessage" data-notifyingid="${blackListVo.m_id}" data-blacklistseq="${blackListVo.blacklist_seq}" 
												data-notifiedid="${blackListVo.black_m_id}" data-content="${blackListVo.black_content}"></i></td>
											
								</tr>
	 									</c:forEach> 
									</tbody>
								</table>
							</div>
							</div>
						</div>
				<!-- 처리 결과 Y table end -->
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