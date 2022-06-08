<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/event_header.jsp" %>
<style>

.e_td { height: 175px;}
.e_img { width: 640px; height: 150px;}
.e_content { text-align: center;}
.e_date { text-align: center;}
.e_finish { text-align: center; width: 70px;}
</style>

<div class="row">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-2">
			</div>
			<div class="col-md-8">
				<table class="table">
					<c:forEach items="${eventList}" var="eventVo">
						<tr class="e_tr">
							<td class="align-middle">
								<img class="e_img" src="/resources/assets/img/event.jpg" alt="">
							</td>
							<td class="align-middle">
								<p class="e_content">${eventVo.event_content}</p>
								<p class="e_date">${eventVo.event_startdate} ~ ${eventVo.event_enddate}</p>
							</td>
							<td class="align-middle">
								<c:choose>
									<c:when test="${eventVo.event_is_finish eq 'N'}">
										<p class="e_finish">진행중</p> 
									</c:when>
									<c:otherwise>
										<p class="e_finish">완료됨</p>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</table>
				<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item">
						<a class="page-link" href="#">Previous</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">1</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">2</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">3</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">4</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">5</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">Next</a>
					</li>
				</ul>
			</nav>
			</div>
			<div class="col-md-2">
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>