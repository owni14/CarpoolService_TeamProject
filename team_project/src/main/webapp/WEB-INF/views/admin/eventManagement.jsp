<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>
${eventList}
<script>

	$(document).ready(function() {
		$("tr.eventListTr").click(function(e){
			var event_seq=$(this).find("td").eq(0).attr("data-seq");
			console.log(event_seq);
			location.href="/admin/event_details?event_seq="+event_seq;	
		});
	});
</script>

<!-- start Event inner header -->
	<div class="pcoded-inner-content">
		<!-- Main-body start -->
		<div class="main-body">
			<div class="page-wrapper">
				<!-- Page-header start -->
				<div class="page-header card">
					<div class="row align-items-end">
						<div class="col-lg-8">
							<div class="page-header-title">
								<i class="icofont icofont-gift bg-c-blue"></i>
								<div class="d-inline">
									<h4>이벤트 목록</h4>
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
								<li class="breadcrumb-item"><a href="#!">이벤트</a></li>
								<li class="breadcrumb-item"><a href="#!">이벤트 목록</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end Event inner header -->

<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		
	<div class="card project-task">
		<div class="card-header">
			<div class="card-header-left ">
				<h3>이벤트 목록</h3>
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
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>#</th>
							<th>이벤트 이름</th>
							<th>진행날짜</th>
							<th>참석자수</th>
							<th>종료여부</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${eventList}" var="eventVo" varStatus="index">
						<tr class="eventListTr">
							<td data-seq="${eventVo.event_seq}">
								<div class="task-contain">
									<h6 class="bg-c-blue d-inline-block text-center" >${index.count}</h6>
									
								</div>
							</td>
							<td>
								<p class="d-inline-block m-r-20">${eventVo.event_name }</p>                              
							</td>
							<td>
								<p class="d-inline-block m-r-20">
								<fmt:formatDate value="${eventVo.event_startdate}" pattern="yyyy MM dd"/>~
								<fmt:formatDate value="${eventVo.event_enddate}" pattern="yyyy MM dd"/>
								</p>                              
							</td>
							<td>
								<p class="d-inline-block m-r-20">${event_max_count}</p>                              
							</td>
							<td>
								<p class="d-inline-block m-r-20"><c:choose>
								<c:when test="${eventVo.event_is_finish eq 'N'}">종료</c:when>
								<c:otherwise>
								진행중
								</c:otherwise>
								</c:choose></p>                              
							</td>
							
						</tr>
						</c:forEach>
<!-- 						<tr> -->
<!-- 							<td> -->
<!-- 								<div class="task-contain"> -->
<!-- 									<h6 class="bg-c-pink d-inline-block text-center">5</h6> -->
<!-- 									<p class="d-inline-block m-l-20">이재곤</p> -->
<!-- 								</div> -->
<!-- 							</td> -->
<!-- 							<td> -->
<!-- 								<p class="d-inline-block m-r-20">담배를 너무 많이 피어요</p>                                                                             <div class="progress d-inline-block"> -->
<!-- 								                                                                                <div class="progress-bar bg-c-pink" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:60%"> -->
<!-- 								                                                                                </div> -->
<!-- 								                                                                            </div> -->
<!-- 							</td> -->
<!-- 						</tr> -->
						
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
					</tbody>
				</table>
			</div>
		</div>
	</div>

		
		</div>
		<div class="col-md-2">
		</div>
	</div>

<%@ include file="/WEB-INF/views/include_admin/footer.jsp"%>