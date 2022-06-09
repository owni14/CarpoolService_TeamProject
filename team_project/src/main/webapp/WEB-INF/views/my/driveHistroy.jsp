<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/my_header.jsp"%>
<style>
tr.tr_table {
	cursor: pointer;
}

tr.tr_table:hover {
	background-color: aliceblue;
}
</style>
<script>
$(document).ready(function() {
	var frmPaging = $("#frmPaging");
	
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href")
		frmPaging.find("input[name=page]").val(page);
		frmPaging.attr("action", "/my/boardedHistory");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
	$("#perPage").change(function() {
		var perPage = $(this).val();
		
// 		console.log(perpage);
		frmPaging.find("input[name=perPage]").val(perPage);
		frmPaging.attr("action", "/my/boardedHistory");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
	$(".tr_table").click(function() {
		$("#modal-container-678121").modal('show');
		var driver_seq = $(this).attr("data-seq");
		var url = "/my/driver_passengerlog";
		var sData = {
				"driver_seq" : driver_seq
		};
		$.post(url, sData, function(rData) {
			console.log(rData);
				$("#modal_body tr").remove();
				$.each(rData, function() {
						var tr = $("#table_clone tr").clone();
						var tds = tr.find("td");
						tds.eq(0).text(this.m_id);
						tds.eq(1).text(this.passenger_depart_location);
						tds.eq(2).text(this.passenger_depart_time);
						$("#modal_body").append(tr);
				});
			
		});
	});
	
	$("#modalClose").click(function() {
		$("#modal-container-678121").modal('hide');
	})
});
</script>
<%@ include file="/WEB-INF/views/include/frmPaging.jsp"%>
<div class="row">

	<!-- modal start -->
	<div class="col-md-12">
		
		<div class="modal fade" id="modal-container-678121" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">
							탑승자 상세 정보
						</h5>
					</div>
					<div class="modal-body">
						<table class="table">
							<thead>
								<tr>
									<th>아이디</th>
									<th>탑승 위치</th>
									<th>탑승 시간</th>
								</tr>
							</thead>
							<tbody id="modal_body">
								
							</tbody>
						</table>
						<table style="display:none;" id="table_clone">
							<tr>
								<td></td>
								<td></td>
								<td></td>				
							</tr>
						</table>
						
					</div>
					<div class="modal-footer">
						<button type="button" id="modalClose" class="btn btn-secondary" data-dismiss="modal">
							닫기
						</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<!-- modal end -->
	
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
		<div class="tabbable" id="tabs-391804">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link" href="/my/boardedHistory">탑승 내역</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="#">운전 내역</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/my/pointHistory">포인트 내역</a>
				</li>
			</ul>
		</div>
		<!-- table start -->
		<table class="table" style="text-align: center;">
			<thead>
				<tr>
					<th style="text-align: right;" colspan="4">
					
						<!-- perPage select start -->
						<select name="perPage" id="perPage">
							<c:forEach var="v" begin="5" end="15" step="5">
								<option value="${v}"
									<c:if test="${v == pagingDto.perPage}">
										selected
									</c:if>
								>최근 ${v}개 보기</option>
							</c:forEach>
							<option value="20"
							<c:if test="${20 == pagingDto.perPage}">
								selected
							</c:if>
							>전체보기</option>
						</select>
						<!-- perPage select end -->

					</th>
				</tr>
				<tr>
					<th>#</th>
					<th>출발 날짜/시간</th>
					<th style="width: 600px;">출발 위치</th>
					<th>요구사항</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="driverVo" items="${driverlogList}" >
				<tr class="tr_table" data-seq="${driverVo.driver_seq}"> 
					
					<td>${driverVo.driver_seq}</td>
					<td>${driverVo.driver_depart_time}</td>
					<td>${driverVo.driver_depart_location}</td>
					<td>${driverVo.driver_comment}</td>
					
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- table end -->
		
		<!-- paging 처리 start -->
		<nav
			<c:if test="${pagingDto.perPage != 20}">
				style="display:none;"
			</c:if>
		>
			<ul class="pagination justify-content-center">
				<c:if test="${pagingDto.startPage != 1}">
					<li class="page-item">
						<a class="page-link" href="${pagingDto.startPage - 1}">이전</a>
					</li>
				</c:if>
				<c:forEach var="v" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
					<li class="page-item"
						<c:choose>
							<c:when test="${v == param.page}">
								class="page-item active"
							</c:when>
							<c:otherwise>
								class="page-item"
							</c:otherwise>
						</c:choose>
					>
						<a class="page-link" href="${v}">${v}</a>
					</li>
				</c:forEach>
				<c:if test="${pagingDto.endPage != pagingDto.totalPage}">
					<li class="page-item">
						<a class="page-link" href="${pagingDto.endPage + 1}">다음</a>
					</li>
				</c:if>
			</ul>
		</nav>
		<!-- paging 처리 end -->
	</div>
	<div class="col-md-2">
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>