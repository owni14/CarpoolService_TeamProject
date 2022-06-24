<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/my/my_header.jsp"%>
<style>
 #putStar { color: black; } 

.star-rating {
  margin-left: 50px;
  display:flex;
  flex-direction: row-reverse;
  font-size:50px;
  justify-content:space-around;
  padding:0 .2em;
  text-align:center;
  width:50px;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#f90;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
  
}

/* tab css start */
nav > .nav.nav-tabs{

  border: none;
    color:#fff;
    background:#aa80ff;
    border-radius:0;

}
nav > div a.nav-item.nav-link,
nav > div a.nav-item.nav-link.active
{
  border: none;
    padding: 18px 25px;
    color:#fff;
    background:#aa80ff;
    border-radius:0;
}

nav > div a.nav-item.nav-link.active:after
 {
  content: "";
  position: relative;
  bottom: -60px;
  left: -10%;
  border: 15px solid transparent;
  border-top-color: #aa80ff ;
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
}
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
	
	
	
	$(".evaluation").click(function(e){
		e.preventDefault();
		
	});
	
	
	
	$(".message_form").click(function(e) {
		e.preventDefault();
		$("#message_form_modal").modal("show");
		var receiver = $(this).attr("data-receiver");
		$("#receiver_m_id").val(receiver);
		
	});
	
	$("#putStar").click(function(e) {
		e.preventDefault();
		$("#frmStar").submit();
	});
});


</script>
<%@ include file="/WEB-INF/views/include/frmPaging.jsp"%>
<%@ include file ="/WEB-INF/views/message/message_form.jsp"%>
<%@ include file ="/WEB-INF/views/customer/report_form.jsp" %>
<div class="row">

	
	
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
		<nav style="margin: 20px;">
          <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
            <a class="nav-item nav-link active" id="nav-home-tab" href="#" aria-controls="nav-home" aria-selected="true">탑승 내역</a>
            <a class="nav-item nav-link" id="nav-profile-tab" href="/my/driveHistory" aria-controls="nav-profile" aria-selected="false">운전 내역</a>
            <a class="nav-item nav-link" id="nav-contact-tab" href="/my/pointHistory" aria-controls="nav-contact" aria-selected="false">포인트 내역</a>
          </div>
        </nav>
		<!-- table start -->
		<table class="table" style="text-align: center;">
			<thead>
				<tr>
					<th style="text-align: right;" colspan="5">
					
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
					<th>평가하기</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="passengerlogVo" items="${passengerlogList}" > 
				<tr> 
				<td>${passengerlogVo.PASSENGER_SEQ}</td> 
					<td>
					<button class="btn dropdown-toggle" type="button" data-toggle="dropdown">
						${passengerlogVo.DRIVER_ID}
 					</button>
 					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item message_form" href="#" id="send_message" data-receiver="${passengerlogVo.DRIVER_ID}">쪽지보내기</a>
						<a class="dropdown-item black" href="#" data-driver_id="${passengerlogVo.DRIVER_ID}">신고하기</a>
						<a class="dropdown-item evaluation" href="#">평가하기</a>
					</div>
					</td>
 					<td>${passengerlogVo.PASSENGER_DEPART_LOCATION}</td>
 					<td>${passengerlogVo.PASSENGER_DEPART_TIME}</td>
 					<td>
 						<c:choose>
 						<c:when test="${passengerlogVo.EVL_FINISH == 'N'}">
	 						<form id="frmStar" action="/my/putStar" method="post">
	 							<input type="hidden" name="driver_m_id" value="${passengerlogVo.DRIVER_ID}">
	 							<input type="hidden" name="driver_seq" value="${passengerlogVo.DRIVER_SEQ}">
								<div class="star-rating">
										<a id="putStar" href="#" style="vertical-align: center; margin-left: 5px;"><i class="bi bi-arrow-right-circle"></i></a>
										<input type="radio" id="5-stars" name="rating" value="5" />
										<label for="5-stars" class="star">&#9733;</label>
										<input type="radio" id="4-stars" name="rating" value="4" />
										<label for="4-stars" class="star">&#9733;</label>
										<input type="radio" id="3-stars" name="rating" value="3" />
										<label for="3-stars" class="star">&#9733;</label>
										<input type="radio" id="2-stars" name="rating" value="2" />
										<label for="2-stars" class="star">&#9733;</label>
										<input type="radio" id="1-star" name="rating" value="1" />
										<label for="1-star" class="star">&#9733;</label>
								</div>
							</form>
						</c:when>
						<c:otherwise>
							<p>평가 완료</p>
						</c:otherwise>
						</c:choose>
					</td>
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