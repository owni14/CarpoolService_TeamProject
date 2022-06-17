<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- paging start -->
<nav>
	<ul class="pagination justify-content-center">
		<c:if test="${pagingDto.startPage != 1}">
			<li class="page-item">
				<a class="page-link" href="${pagingDto.startPage - 1}">&lt;</a>
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
				<a class="page-link" href="${pagingDto.endPage + 1}">&gt;</a>
			</li>
		</c:if>
	</ul>
</nav>
<!-- paging end -->

</div>
		</div>
	</div>
	<div class="col-md-2">
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>