<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/my_header.jsp"%>

<script>
$(document).ready(function() {
	var frmPaging = $("#frmPaging");
	
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href")
		frmPaging.find("input[name=page]").val(page);
		frmPaging.attr("action", "/my/pointHistory");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
	$("#perPage").change(function() {
		var perPage = $(this).val();
		
// 		console.log(perpage);
		frmPaging.find("input[name=perPage]").val(perPage);
		frmPaging.attr("action", "/my/pointHistory");
		frmPaging.attr("method", "get");
		frmPaging.submit();
		
	});
	
	
});
</script>

<%@ include file="/WEB-INF/views/include/frmPaging.jsp" %>
<div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
	
		<!-- tab start -->
		<div class="tabbable" id="tabs-391804">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link" href="/my/boardedHistory">탑승 내역</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="#">포인트 내역</a>
				</li>
			</ul>
		</div>
		<!-- tab end -->
		
		<!-- table start -->
		<table class="table" style="text-align: center;">
			<thead>
				<tr>
					<th style="text-align: right;" colspan="4">
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
						현재 포인트 : ${loginVo.m_point}
					</th>
				</tr>
				<tr>
					<th>#</th>
					<th style="width: 600px;">내용</th>
					<th>포인트</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="pointVo" items="${pointList}" >
				<tr>
					<td>${pointVo.P_SEQ}</td>
					<td>${pointVo.PC_DESC}</td>
					<td>${pointVo.PC_POINT}</td>
					<td>${pointVo.P_DATE}</td>
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