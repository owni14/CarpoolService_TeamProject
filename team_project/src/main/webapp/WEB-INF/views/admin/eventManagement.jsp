<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>
<%@ include file="/WEB-INF/views/include_admin/alert.jsp" %>
<style>
.eventListTr:hover{
cursor: pointer;
}
</style>
<script>
var insert_result="${insert_result}";
if(insert_result){
	alert("입력에 성공하셨습니다");
}
	$(document).ready(function() {
		$("tr.eventListTr").click(function(e){
			var event_seq=$(this).find("td").eq(0).attr("data-seq");
			console.log(event_seq);
			location.href="/admin/event_details?event_seq="+event_seq;	
		});
		$("#btnSearch").click(function(){
			var keyword=$("#txtkeyword").val();
			$("#frmEventSearch").find("[name=keyword]").val(keyword);
			$("#frmEventSearch").submit();
		});
	});
</script>
<form id="frmEventSearch" method="get" action="/admin/event">
<input type="hidden" name="searchType" value="i">
<input type="hidden" name="keyword">
</form>
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
			<!-- Page-body start -->
			<div class="page-body">
				<!-- Basic table card start -->
				<div class="card">
					<div class="card-header">
					<input type="text" id="txtkeyword" style="background-color:white; border-color: #d2d2d2; margin-right:50px;width:150px" placeholder="이벤트 이름">
					<button type="button" id="btnSearch" style="background-color:white; border-color: #d2d2d2;">조회하기&nbsp;&nbsp;<i class="icofont icofont-search-alt-2"></i></button>
						<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>#</th>
							<th>이벤트 이름</th>
							<th>진행날짜</th>
							<th>최대 당첨인원</th>
							<th>종료여부</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${eventList}" var="eventVo" varStatus="index">
						<tr class="eventListTr">
							<td data-seq="${eventVo.event_seq}">
								<div class="task-contain">
									<label class="badge badge-info">${index.count}</label>
									
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
								<p class="d-inline-block m-r-20">${eventVo.event_max_count}</p>                              
							</td>
							<td>
								<p class="d-inline-block m-r-20"><c:choose>
								<c:when test="${eventVo.event_is_finish eq 'Y'}">종료</c:when>
								<c:otherwise>
								진행중
								</c:otherwise>
								</c:choose></p>                              
							</td>
							
						</tr>
						</c:forEach>
						<c:if test="${eventList.size() <=0 }">
						<tr>
						<td colspan="5" style="text-align: center;
						font-size:35px;
						"> "${param.keyword}"에대한 검색결과가 없습니다</td>
						</tr>
						</c:if>
					</tbody>
				</table>
			</div>
						
					</div>
				</div>
			</div>
			<!-- Basic table card end -->
			<!-- end page-wrapper -->
		</div>
	</div>
</div>
<!-- end Event inner header -->



<%@ include file="/WEB-INF/views/include_admin/footer.jsp"%>