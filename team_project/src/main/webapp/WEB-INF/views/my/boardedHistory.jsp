<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/my_header.jsp"%>
<style>
#black_m_id { display: inline-block; width: 300px;}
#black_content { margin-top: 20px; height: 100px;}
</style>
<script>
$(document).ready(function() {
	var frmPaging = $("#frmPaging");
	var black_result = "${black_result}";
	
	if (black_result == "false") {
		alert("신고처리가 정상적으로 되지 못했습니다.\n 다시 시도해 주세요.")
	}
	
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
		frmPaging.find("input[name=perPage]").val(perPage);
		frmPaging.attr("action", "/my/boardedHistory");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
	$("#black").click(function(e) {
		e.preventDefault();
		$("#modal-container-678121").modal('show');
		var driver_id = $("#driver_id").text();
		console.log("driver_id: ", driver_id);
		$("#black_m_id").val(driver_id.trim());
	});
	
	$("#modalClose").click(function() {
		$("#modal-container-678121").modal('hide');
	});
});
</script>
<%@ include file="/WEB-INF/views/include/frmPaging.jsp"%>
<div class="row">

	<!-- modal start -->
	<form action="/customer/black_report" method="post">
 	<input type="hidden" name="m_id" value="${loginVo.m_id}">
	<div class="col-md-12">
		<div class="modal fade" id="modal-container-678121" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">
							신고 하기
						</h5>
					</div>
					<div class="modal-body">
						신고 대상자 : <input type="text" class="form-control" id="black_m_id" name="black_m_id" readonly>
						<textarea id="black_content" class="form-control" name="black_content" placeholder="신고내용을 입력해 주세요"></textarea>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger">신고하기</button>
						<button type="button" id="modalClose" class="btn btn-secondary" data-dismiss="modal">
							닫기
						</button>
					
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
	<!-- modal end -->
	
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
		<div class="tabbable" id="tabs-391804">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link active" href="#">탑승 내역</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/my/driveHistory">운전 내역</a>
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
					<th>운전자 아이디</th>
					<th style="width: 600px;">탑승 위치</th>
					<th>탑승 시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="passengerlogVo" items="${passengerlogList}" > 
				<tr> 
				<td>${passengerlogVo.PASSENGER_SEQ}</td> 
					<td>
					<button class="btn dropdown-toggle" type="button" id="driver_id" data-toggle="dropdown">
						${passengerlogVo.DRIVER_ID}
 					</button>
 					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="#">쪽지보내기</a>
						<a id="black" class="dropdown-item" href="#">신고하기</a>
					</div>
					
					
					</td>
 					<td>${passengerlogVo.PASSENGER_DEPART_LOCATION}</td>
 					<td>${passengerlogVo.PASSENGER_DEPART_TIME}</td>
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