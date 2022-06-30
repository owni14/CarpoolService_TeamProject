<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include_admin/header.jsp" %>
<%@ include file="/WEB-INF/views/include_admin/alert.jsp" %>
<%@ include file="/WEB-INF/views/include_admin/frmApproveNotify.jsp" %>
<script>
	$(document).ready(function () {
		$(".driveLicenseImg").click(function () {
			console.log("click");
			$("#modal-751258").trigger("click");
			var licenseImg =$(this).attr("src");
			$("#magnifyImg").attr("src",licenseImg);
		});
		
		$(".chkApprove").click(function () {
			console.log("click");
			var m_id = $(this).attr("data-m_id");
			$("#frmApproveDriver").attr("action", "/admin/approveDriver");
			$("#frmApproveDriver").attr("method", "post");
			$("#frmApproveDriver").find("input[name=m_id]").val(m_id);
			console.log(m_id);
			$("#frmApproveDriver").submit();
		});
		
		$("#btnApproveList").click(function () {
			location.href = "/admin/approveDriver_management";
		});
		
		var frmApproveNotify = $("#frmApproveNotify");
		var frmPaging = $("#frmPaging"); 
		$("a.dropdown-item").click(function (e) {
			e.preventDefault();
			var blacklist_seqValue = $(this).attr("data-blacklistSeq");
			var admin_checkValue = $(this).attr("data-value");
			var blackScoreValue = $("#spanBlackPoint").attr("data-blackpoint");
			var black_m_id = $(this).attr("data-blackid");
			console.log(admin_checkValue); // 반려 : C, 반려 취소 : N, 승인 : Y
// 			frmApproveNotify.find("input[name=refresh]").val(1);
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
		$("p.content").click(function(){
			location.href="/admin/report_management";
		});
		
		$(".blackPointImg").click(function () {
			var blackPoint = $(this).attr("data-blackpoint");
			if (blackPoint == 5) {
				$("#spanBlackPoint").text(blackPoint).css("color","#2A0A0A");
				$("#spanBlackPoint").attr("data-blackpoint",blackPoint);
			} else if (blackPoint == 4) {
				$("#spanBlackPoint").text(blackPoint).css("color","red");
				$("#spanBlackPoint").attr("data-blackpoint",blackPoint);
			} else if (blackPoint == 3) {
				$("#spanBlackPoint").text(blackPoint).css("color","#D7DF01");
				$("#spanBlackPoint").attr("data-blackpoint",blackPoint);
			} else if (blackPoint == 2) {
				$("#spanBlackPoint").text(blackPoint).css("color","green");
				$("#spanBlackPoint").attr("data-blackpoint",blackPoint);
			} else {
				$("#spanBlackPoint").text(blackPoint).css("color","blue");
				$("#spanBlackPoint").attr("data-blackpoint",blackPoint);
			}
		});
	});
</script>
<!-- modal start -->
<div class="row">
	<div class="col-md-12">
		<a id="modal-751258" href="#modal-container-751258" role="button"
			class="btn" data-toggle="modal" style="display:none">Launch demo modal</a>

		<div class="modal fade" id="modal-container-751258" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">운전면허증 확대 이미지</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<img id="magnifyImg" style="width:100%"/>
					</div>
					<div class="modal-footer">

						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">뒤로가기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- modal end -->
                           <div class="main-body">
                                <div class="page-wrapper">

                                    <div class="page-body">
                                        <div class="row">
                                            <!-- card1 start -->
                                            <div class="col-md-6 col-xl-3">
                                                <div class="card widget-card-1">
                                                    <div class="card-block-small">
                                                        <i class="ti-pie-chart card1-icon bg-c-blue"></i>
                                                        <span class="text-c-blue f-w-600">총 가입 회원 수</span>
                                                        <h4> ${totalMember}명이 이용중입니다</h4>
                                                        <div>
                                                            <span class="f-left m-t-10 text-muted">
                                                           
                                                            <i class="text-c-yellow f-16 icofont icofont-refresh m-r-10"></i>update userConnectCount 
<!--                                                                 <i class="text-c-blue f-16 icofont icofont-warning m-r-10"></i>Get more space -->
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- card1 end -->
                                            <!-- card1 start -->
                                            <div class="col-md-6 col-xl-3">
                                                <div class="card widget-card-1">
                                                    <div class="card-block-small">
                                                        <i class="ti-car bg-c-green card1-icon"></i>
                                                        <span class="text-c-green f-w-600">운전현황</span>
                                                        <h4>운전자수  ${approve_count}명이 있습니다</h4>
                                                        <div>
                                                            <span class="f-left m-t-10 text-muted">
                                                            <i class="text-c-yellow f-16 icofont icofont-refresh m-r-10"></i>driver count
<!--                                                                 <i class="text-c-pink f-16 icofont icofont-calendar m-r-10"></i>Last 24 hours -->
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- card1 end -->
                                            <!-- card1 start -->
                                            <div class="col-md-6 col-xl-3">
                                                <div class="card widget-card-1">
                                                    <div class="card-block-small">
                                                        <i class="ti-check-box bg-c-pink card1-icon"></i>
                                                        <span class="text-c-pink f-w-600">이벤트 경품 미수령자</span>
                                                        <h4>${noEventGetCount}명 있습니다</h4>
                                                        <div>
                                                            <span class="f-left m-t-10 text-muted">
                                                              <i class="text-c-yellow f-16 icofont icofont-refresh m-r-10"></i>event non-receiver 
<!--                                                                 <i class="text-c-green f-16 icofont icofont-tag m-r-10"></i>Tracked via microsoft -->
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- card1 end -->
                                            <!-- card1 start -->
                                            <div class="col-md-6 col-xl-3">
                                                <div class="card widget-card-1">
                                                    <div class="card-block-small">
                                                        <i class="ti-comment-alt bg-c-yellow card1-icon"></i>
                                                        <span class="text-c-yellow f-w-600">미답변 문의 글 수</span>
                                                        <h4>${noAnswer}개 존재합니다</h4>
                                                        <div>
                                                            <span class="f-left m-t-10 text-muted">
                                                             <i class="text-c-yellow f-16 icofont icofont-refresh m-r-10"></i>count unanswered
<!--                                                                 <i class="text-c-yellow f-16 icofont icofont-refresh m-r-10"></i>Just update -->
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- card1 end -->
                                            <!-- Statestics Start -->
                                            <div class="col-md-12 col-xl-8">
                                                <div class="card" style="height:670px">
                                                    <div class="card-header">
                                                        <h5>운전현황</h5>
                                                        <div class="card-header-left ">
                                                        </div>
                                                        <div class="card-header-right">
<!--                                                             <ul class="list-unstyled card-option"> -->
<!--                                                                 <li><i class="icofont icofont-simple-left "></i></li> -->
<!--                                                                 <li><i class="icofont icofont-maximize full-card"></i></li> -->
<!--                                                                 <li><i class="icofont icofont-minus minimize-card"></i></li> -->
<!--                                                                 <li><i class="icofont icofont-refresh reload-card"></i></li> -->
<!--                                                                 <li><i class="icofont icofont-error close-card"></i></li> -->
<!--                                                             </ul> -->
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="card-block">
<!--                                                         <div id="statestics-chart" style="height:517px;"></div> -->
													<div style="height:517px;">
	<!--차트가 그려질 부분-->
	<canvas id="myChart"></canvas>
</div>		




<script>
const labels = [
  '${strList.get(6)}',
  '${strList.get(5)}',
  '${strList.get(4)}',
  '${strList.get(3)}',
  '${strList.get(2)}',
  '${strList.get(1)}',
  '${strList.get(0)}',
  
];


const data = {
  labels: labels,
  datasets: [{
	fill: false,
    label: '예약현황',
    backgroundColor: 'rgb(255, 99, 132)',
    borderColor: 'rgb(255, 99, 132)',
    data: [
    	'${dayPassengerCounts.get(6)}',
    	'${dayPassengerCounts.get(5)}',
    	'${dayPassengerCounts.get(4)}',
    	'${dayPassengerCounts.get(3)}',
    	'${dayPassengerCounts.get(2)}',
    	'${dayPassengerCounts.get(1)}',
    	'${dayPassengerCounts.get(0)}',
    ],
  }  ]
  
};

const config = {
  type: 'line',
  data: data,
  options: {}
};
const myChart = new Chart(
		  document.getElementById('myChart'),
		  config
		);
</script>

      
<!-- script -->
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-md-12 col-xl-4">
                                            	<div class="card" style="height:320px">
                                    			<!-- Donut chart start -->
                                           		<div class="row" style="align-self: center;">
                                           		<canvas id="doughnut-chart1" width="600" height="300"></canvas>
                                           		</div>
                                           		<script>
												new Chart(document.getElementById("doughnut-chart1"), {
												    type: 'doughnut',
												    data: {
												      labels: ["vvip", "vip", "gold", "silver", "white"],
												      datasets: [
												        {
												          label: "Population (millions)",
												          backgroundColor: ["rgba(255, 99, 132, 0.2)",
												        	  "rgba(255, 159, 64, 0.2)",
												        	  "rgba(255, 205, 86, 0.2)",
												        	  "rgba(75, 192, 192, 0.2)",
												        	  "rgba(54, 162, 235, 0.2)"],
												          data: ["${number1}","${number2}","${number3}","${number4}","${number5}"]
												        }
												      ]
												    },
												    options: {
												      title: {
												        display: true,
												        text: '운전자 등급'
												      }
												    }
												});
												</script> 
                                            <!-- Donut chart Ends -->		
                                            </div>
                                            <div class="card" style="height:320px">
                                    			<!-- Donut chart start -->
                                           		<div class="row" style="align-self: center;">
                                           		<canvas id="doughnut-chart2" width="600" height="300"></canvas>
                                           		</div>
                                           		<script>
												new Chart(document.getElementById("doughnut-chart2"), {
												    type: 'doughnut',
												    data: {
												      labels: ["vvip", "vip", "gold", "silver", "white"],
												      datasets: [
												        {
												          label: "Population (millions)",
												          backgroundColor: ["rgba(255, 99, 132, 0.2)",
												        	  "rgba(255, 159, 64, 0.2)",
												        	  "rgba(255, 205, 86, 0.2)",
												        	  "rgba(75, 192, 192, 0.2)",
												        	  "rgba(54, 162, 235, 0.2)"],
												          data: ["${number6}","${number7}","${number8}","${number9}","${number10}"]
												        }
												      ]
												    },
												    options: {
												      title: {
												        display: true,
												        text: '회원 등급(동승자)'
												      }
												    }
												});
												</script> 
                                            <!-- Donut chart Ends -->		
                                            </div>
                                           </div>
                                           
                                            <!-- Email Sent End -->
                                            <!-- Data widget start -->
                                            <div class="col-md-12 col-xl-6">
                                                <div class="card project-task" style="height:480px">
                                                    <div class="card-header">
                                                                              <!-- dropdown start -->
						<button class="btn dropdown-toggle" type="button"
							style="background-color: white;  color: red; float: right;"
							id="dropdownMenuButton1" data-toggle="dropdown">
							벌점</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<img class="dropdown-item blackPointImg" src="/resources/images/blacklist/anger.jpg" height="80px" data-blackpoint="5"><b style="color:#2A0A0A; float:right;">5점</b>
								<img class="dropdown-item blackPointImg" src="/resources/images/blacklist/littleanger.jpg" height="80px" data-blackpoint="4"><b style="color:red; float:right;">4점</b>
								<img class="dropdown-item blackPointImg" src="/resources/images/blacklist/disgust.jpg" height="80px" data-blackpoint="3"><b style="color:#D7DF01; float:right;">3점</b>
								<img class="dropdown-item blackPointImg" src="/resources/images/blacklist/fear.jpg" height="80px" data-blackpoint="2"><b style="color:green; float:right;">2점</b>
								<img class="dropdown-item blackPointImg" src="/resources/images/blacklist/sadness.jpg" height="80px" data-blackpoint="1"><b style="color:blue; float:right;">1점</b>
							</div>
                                                        <div class="card-header-left ">
                                                            <h3 id="test">신고자 리스트</h3>
                                                            
                                                            
                                                        </div>
                                                        <div class="card-header-right">
<!--                                                             <ul class="list-unstyled card-option"> -->
<!--                                                                 <li><i class="icofont icofont-simple-left "></i></li> -->
<!--                                                                 <li><i class="icofont icofont-maximize full-card"></i></li> -->
<!--                                                                 <li><i class="icofont icofont-minus minimize-card"></i></li> -->
<!--                                                                 <li><i class="icofont icofont-refresh reload-card"></i></li> -->
<!--                                                                 <li><i class="icofont icofont-error close-card"></i></li> -->
<!--                                                             </ul> -->
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="card-block p-b-10">
                          
							<div>
								<b style="float:left; font-size: 20px;"><span>벌점 : </span><span id="spanBlackPoint" style="color:black" data-blackpoint="5">5</span><span>점</span></b>
							</div>
						<!-- dropdown end -->
                                                        <div class="table-responsive">
                                                        
                                                            <table class="table table">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="text-center">#</th>
                                                                        <th>신고 처리 대상</th>
                                                                        <th>신고 내용</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    
<!--                                                                     <tr> -->
<!--                                                                         <td> -->
<!--                                                                             <div class="task-contain"> -->
<!--                                                                                 <h6 class="bg-c-pink d-inline-block text-center">3</h6> -->
<!--                                                                                 <p class="d-inline-block m-l-20">이재곤</p> -->
<!--                                                                             </div> -->
<!--                                                                         </td> -->
<!--                                                                         <td> -->
<!--                                                                             <p class="d-inline-block m-r-20">담배를 너무 많이 피어요</p> -->
<!-- <!--                                                                             <div class="progress d-inline-block"> --> 
<!-- <!--                                                                                 <div class="progress-bar bg-c-pink" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:60%"> --> 
<!-- <!--                                                                                 </div> --> 
<!-- <!--                                                                             </div> --> 
<!--                                                                         </td> -->
<!--                                                                     </tr> -->
<!--                                                                     <tr> -->
<!--                                                                         <td> -->
<!--                                                                             <div class="task-contain"> -->
<!--                                                                                 <h6 class="bg-c-yellow d-inline-block text-center">2</h6> -->
<!--                                                                                 <p class="d-inline-block m-l-20">김민우</p> -->
<!--                                                                             </div> -->
<!--                                                                         </td> -->
<!--                                                                         <td> -->
<!--                                                                             <p class="d-inline-block m-r-20">운전중 자꾸 한숨을 쉬어요</p> -->
                                                                            
<!-- 							                                               dropdown start -->
<!-- 							                                             <div style="float: right;"> -->
<!-- 																		<button class="btn dropdown-toggle" type="button" style="background-color:white; padding-top:0px; color:red" -->
<!-- 																			id="dropdownMenuButton1" data-toggle="dropdown"> -->
<%-- 																			${blackListVo.black_is_processed}</button> --%>
<!-- 																		<div class="dropdown-menu" aria-labelledby="dropdownMenuButton"> -->
<%-- 																			<a class="dropdown-item" href="#" data-blacklistSeq="${blackListVo.blacklist_seq}" data-value="Y" data-bScore="${blackListVo.black_score}" data-blackid="${blackListVo.black_m_id}">승인</a>  --%>
<%-- 																			<a class="dropdown-item" href="#" data-blacklistSeq="${blackListVo.blacklist_seq}" data-value="C">반려</a> --%>
<!-- 																		</div> -->
<!-- 																		</div>  -->
<!-- 																		dropdown end -->
																		
<!-- <!--                                                                             <div class="progress d-inline-block"> --> 
<!-- <!--                                                                                 <div class="progress-bar bg-c-yellow" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:50%"> --> 
<!-- <!--                                                                                 </div> --> 
<!-- <!--                                                                             </div> --> 
<!--                                                                         </td> -->
<!--                                                                     </tr> -->
<!--                                                                     <tr> -->
<!--                                                                         <td> -->
<!--                                                                             <div class="task-contain"> -->
<!--                                                                                 <h6 class="bg-c-green d-inline-block text-center">1</h6> -->
<!--                                                                                 <p class="d-inline-block m-l-20">화장실 빌런</p> -->
<!--                                                                             </div> -->
<!--                                                                         </td> -->
<!--                                                                         <td> -->
<!--                                                                             <p class="d-inline-block m-r-20">화장실이 가고 싶은데 출근이 급하다고 안내려줘요</p> -->
<!--                                                                             <div class="progress d-inline-block"> -->
<!--                                                                                 <div class="progress-bar bg-c-green" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:50%"> -->
<!--                                                                                 </div> -->
<!--                                                                             </div> -->
<!--                                                                         </td> -->
<!--                                                                     </tr> -->
<!--                                                                     <tr> -->
<!--                                                                         <td> -->
<!--                                                                             <div class="task-contain"> -->
<!--                                                                                 <h6 class="bg-c-blue d-inline-block text-center">L</h6> -->
<!--                                                                                 <p class="d-inline-block m-l-20">Logo Design</p> -->
<!--                                                                             </div> -->
<!--                                                                         </td> -->
<!--                                                                         <td> -->
<!--                                                                             <p class="d-inline-block m-r-20">4 : 36</p> -->
<!--                                                                             <div class="progress d-inline-block"> -->
<!--                                                                                 <div class="progress-bar bg-c-blue" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:50%"> -->
<!--                                                                                 </div> -->
<!--                                                                             </div> -->
<!--                                                                         </td> -->
<!--                                                                     </tr> -->
								<c:forEach items="${blackLists}" var="blackListVo" begin="0" end="3" step="1" varStatus="i">
																
																<tr class="trBlackLists">
																<td>
																<div class="task-contain">
																<h6 class="bg-c-pink d-inline-block text-center">${i.count}</h6>
																</div>
																</td>
																<td>
                                                               ${blackListVo.black_m_id}
                                                                           
                                                                        </td>
                                                                        <td>
                                                                            <p class="d-inline-block m-r-20 content">
                                                                            <c:choose>
                                                                            <c:when test="${blackListVo.black_content.length() >=25}">
                                                                          
                                                                            ${blackListVo.black_content.substring(0,25)}...</c:when>
                                                                            <c:otherwise> ${blackListVo.black_content}</c:otherwise>
                                                                            </c:choose>
                                                                           </p>
                                                                            
							                                               <!-- dropdown start -->
							                                             <div style="float: right;">
																		<button class="btn dropdown-toggle approve" type="button" style="background-color:white; padding-top:0px; color:red;"
																			id="dropdownMenuButton1" data-toggle="dropdown">
																			처리하기</button>
																		<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
																			<a class="dropdown-item" href="#" data-blacklistSeq="${blackListVo.blacklist_seq}" data-value="Y" data-bScore="${blackListVo.black_score}" data-blackid="${blackListVo.black_m_id}">승인</a> 
																			<a class="dropdown-item" href="#" data-blacklistSeq="${blackListVo.blacklist_seq}" data-value="C">반려</a>
																		</div>
																		</div> 
																</tr>
								</c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-xl-6">
                                                <form id="frmApproveDriver">
                                                  <input type="hidden" name="m_id"/>
                                                </form>
                                                <div class="card add-task-card" style="height:480px">
                                                    <div class="card-header">
                                                        <div class="card-header-left">
                                                            <h3>운전자 신청 승인 리스트</h3>
                                                        </div>
                                                        <div class="card-header-right">
                                                            <button class="btn btn-card btn-primary" id="btnApproveList">전체 리스트 확인</button>
                                                        </div>
                                                    </div>
                                                    <div class="card-block">
                                                        
                                                       <c:forEach items="${notApprovedDriverList}" var="map" varStatus="status">
                                                        <c:if test="${status.index <= 2}">
                                                        <div class="to-do-list">
                                                            <div class="checkbox-fade fade-in-primary d-block">
<!--                                                                     <input type="checkbox" value=""> -->
<!--                                                                     <span class="cr"> -->
<!--                                                                         <i class="cr-icon icofont icofont-ui-check txt-default"></i> -->
<!--                                                                     </span> -->
																	<div class="task-card-img m-1-40">
                                                                    <img src="/admin/displayLicenseImage?ad_license_img=${map.AD_LICENSE_IMG}"  alt="면허증이미지" class="img-100 m-l-10 driveLicenseImg" style="margin-bottom:15px">
                                                                    </div>
                                                                <label class="check-task d-block">
                                                                    <table>
                                                                    	<tr style="width: 100%">
                                                                    		<td style="width:10%; text-align: center">
                                                                    			${map.M_NAME}
                                                                    		</td>
                                                                    		<td style="width:15%; text-align: center">
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
                                                                    		</td>
                                                                    		<td style="width:25%">
                                                                    			${map.M_ID}
                                                                    		</td>
                                                                    		<td style="width:25%; text-align: center">
                                                                    			${map.AD_DETAIL}
                                                                    		</td>
                                                                    		<td style="width:25%; text-align: center">
                                                                    			<fmt:formatDate value="${map.AD_REGDATE}" type="DATE" pattern="yy년 MM월 dd일 HH시"/>
                                                                    			
                                                                    		</td>
                                                                    		<td>
                                                                    			<input type="checkbox" value="" >
			                                                                    <span class="cr">
			                                                                        <i class="cr-icon icofont icofont-ui-check txt-default chkApprove" data-m_id="${map.M_ID}"></i>
			                                                                    </span>
                                                                    		</td>
                                                                    	</tr>
                                                                    </table>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        </c:if>
                                                        </c:forEach>
                                                        
<!--                                                         <div class="to-do-list"> -->
<!--                                                             <div class="checkbox-fade fade-in-primary d-block"> -->
<!--                                                                 <label class="check-task d-block"> -->
<!--                                                                     <input type="checkbox" value=""> -->
<!--                                                                     <span class="cr"> -->
<!--                                                                         <i class="cr-icon icofont icofont-ui-check txt-default"></i> -->
<!--                                                                     </span> -->
<!--                                                                     <span><h6>Meeting With HOD's and borad</h6><p class="text-muted m-l-40">23 january 2003</p></span> -->
<!--                                                                 </label> -->
<!--                                                             </div> -->
<!--                                                         </div> -->
                                                       
<!--                                                         <div class="to-do-list"> -->
<!--                                                             <div class="checkbox-fade fade-in-primary d-block"> -->
<!--                                                                 <label class="check-task d-block"> -->
<!--                                                                     <input type="checkbox" value=""> -->
<!--                                                                     <span class="cr"> -->
<!--                                                                         <i class="cr-icon icofont icofont-ui-check txt-default"></i> -->
<!--                                                                     </span> -->
<!--                                                                     <span><h6>Meeting With HOD's and borad</h6> -->
<!--                                                                         <p class="text-muted m-l-40">23 january 2003</p></span> -->
<!--                                                                         <div class="task-card-img m-l-40"> -->
<!--                                                                             <a href="#!"><img src="/resources/admin/assets/images/avatar-2.jpg" data-toggle="tooltip" title="Lary Doe" alt="" class="img-40"></a> -->
<!--                                                                             <a href="#!"><img src="/resources/admin/assets/images/avatar-3.jpg" data-toggle="tooltip" title="Alia" alt="" class="img-40 m-l-10"></a> -->
<!--                                                                             <a href="#!"><img src="/resources/admin/assets/images/avatar-2.jpg" data-toggle="tooltip" title="Josephin Doe" alt="" class="img-40 m-l-10"></a> -->
<!--                                                                         </div> -->
<!--                                                                     </label> -->
<!--                                                                 </div> -->
<!--                                                             </div> -->
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Data widget End -->
                                                
                                            </div>
                                        </div>
                                    </div>

                                    <div id="styleSelector">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="fixed-button">
                    <a href="https://codedthemes.com/item/guru-able-admin-template/" target="_blank" class="btn btn-md btn-primary">
                      <i class="fa fa-shopping-cart" aria-hidden="true"></i> Upgrade To Pro
                    </a>
                </div>
            </div>
        </div>

        <!-- Warning Section Starts -->
        <!-- Older IE warning message -->
    <!--[if lt IE 9]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="/resources/admin/assets/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="/resources/admin/assets/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="/resources/admin/assets/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="/resources/admin/assets/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="/resources/admin/assets/images/browser/ie.png" alt="">
                    <div>IE (9 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->
<!-- Warning Section Ends -->
<!-- Required Jquery -->

</body>

</html>

