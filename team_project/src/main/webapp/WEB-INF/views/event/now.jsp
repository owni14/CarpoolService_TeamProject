<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>

.e_td { height: 175px;}
.e_img { width: 640px; height: 150px;}
.e_content { text-align: center;}
.e_date { text-align: center;}
.e_finish { text-align: center; width: 70px;}

.e_tr:hover { background-color: aliceblue; cursor: pointer; }

/* tab css start */
nav > .nav.nav-tabs{

  border: none;
    color:#fff;
    background:#3731C9;
    border-radius:0;

}
nav > div a.nav-item.nav-link,
nav > div a.nav-item.nav-link.active
{
  border: none;
    padding: 18px 25px;
    color:#fff;
    background:#3731C9;
    border-radius:0;
}

nav > div a.nav-item.nav-link.active:after
 {
  content: "";
  position: relative;
  bottom: -60px;
  left: -10%;
  border: 15px solid transparent;
  border-top-color: #3731C9;
}

nav > div a.nav-item.nav-link:hover,
nav > div a.nav-item.nav-link:focus
{
  border: none;
    background: #5c5c8a;
    color:#fff;
    border-radius:0;
    transition:background 0.20s linear;	
}
/* tab css end */
</style>

<script>
$(document).ready(function() {
	var frmPaging = $("#frmPaging"); 
	$("a.page-link").click(function (e) {
		e.preventDefault();
		var pageValue = $(this).attr("href");
		var page = frmPaging.find("input[name=page]");
		page.val(pageValue);
		frmPaging.attr("action","/event/now");
		frmPaging.attr("method","get");
		frmPaging.submit();
	});
	
	$(".e_tr").click(function() {
		var event_seq = $(this).attr("data-seq");
		$("#frm_detail").find("input[name=event_seq]").val(event_seq);
		$("#frm_detail").submit();
	});
	
});
</script>
<%@ include file="/WEB-INF/views/include/frmPaging.jsp" %>
<%@ include file="/WEB-INF/views/event/event_header.jsp" %>
<div class="row">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-2">
			</div>
			<div class="col-md-8">
				<nav style="margin-bottom: 40px;">
					<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
			            <a class="nav-item nav-link active" id="nav-home-tab" href="#" aria-controls="nav-home" aria-selected="true">진행중인 이벤트</a>
			            <a class="nav-item nav-link" id="nav-profile-tab" href="/event/winner" aria-controls="nav-profile" aria-selected="false">당첨자 발표</a>
			            <a class="nav-item nav-link" id="nav-contact-tab" href="/event/info" aria-controls="nav-contact" aria-selected="false">등급별 혜택</a>
		          	</div>
		        </nav>
			
				<div class="tabbable" id="tabs-391804">
					<ul class="nav nav-tabs">
						<li class="nav-item">
							<a class="nav-link active" href="#">진행중인 이벤트</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/event/winner">당첨자 발표</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/event/info">등급별 혜택</a>
						</li>
					</ul>
				</div>
				<form id="frm_detail" action="/event/detail" method="get">
					<input type="hidden" name="event_seq">
				<table class="table">
					<c:forEach items="${eventList}" var="eventVo">
						<tr class="e_tr" data-seq="${eventVo.event_seq}">
							<td class="align-middle">
								<img class="e_img"
								<c:choose>
									<c:when test="${not empty eventVo.event_img}">
										src="/event/displayImage?filename=${eventVo.event_img}" 
									</c:when>
									<c:otherwise>
										src="/resources/images/banner/default_banner.jpg"
									</c:otherwise>
								</c:choose>
								alt="">
							</td>
							<td class="align-middle">
								<p class="e_content">${eventVo.event_name}</p>
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
				</form>
				<nav>
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
			</div>
			<div class="col-md-2">
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>