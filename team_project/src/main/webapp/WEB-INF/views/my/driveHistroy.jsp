<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/my/my_header.jsp"%>
<style>
tr.tr_table {
	cursor: pointer;
}

tr.tr_table:hover {
	background-color: aliceblue;
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
// 			console.log(rData);
			$("#modal_body tr").remove();
			$.each(rData, function() {
					var tr = $("#table_clone tr").clone();
					var tds = tr.find("td");
					$("#driver_drop").text(this.m_id);
					tds.eq(1).text(this.passenger_depart_location);
					tds.eq(2).text(this.passenger_depart_time);
					$("#modal_body").append(tr);
					tds.attr("data-receiver", this.m_id);
			});
		});
	});
	
	$("#modalClose").click(function() {
		$("#modal-container-678121").modal('hide');
	});
});

$(document).on("click", ".black", function(e) {
	e.preventDefault();
	$("#modal-container-678121").modal("hide");
	$("#black_modal").modal("show");
	var receiver = $(".tds").attr("data-receiver");
	$("#black_m_id").val(receiver);
});

$(document).on("click", ".message_form", function(e) {
	e.preventDefault();
	$("#modal-container-678121").modal("hide");
	$("#message_form_modal").modal("show");
	var receiver = $(".tds").attr("data-receiver");
	$("#receiver_m_id").val(receiver);
});
</script>
<%@ include file="/WEB-INF/views/include/frmPaging.jsp"%>
<%@ include file ="/WEB-INF/views/message/message_form.jsp"%>
<%@ include file ="/WEB-INF/views/customer/report_form.jsp" %>
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
								<td class="tds">
									<button id="driver_drop" class="btn dropdown-toggle" type="button" data-toggle="dropdown">
										
				 					</button>
				 					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<a class="dropdown-item message_form" href="#" id="send_message" data-receiver="${passengerlogVo.DRIVER_ID}">쪽지보내기</a>
										<a class="dropdown-item black" href="#" data-driver_id="${passengerlogVo.DRIVER_ID}">신고하기</a>
									</div>
								</td>
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
		<nav style="margin: 20px;">
          <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
            <a class="nav-item nav-link" id="nav-home-tab" href="/my/boardedHistory" aria-controls="nav-home" aria-selected="true">탑승 내역</a>
            <a class="nav-item nav-link active" id="nav-profile-tab" href="#" aria-controls="nav-profile" aria-selected="true">운전 내역</a>
            <a class="nav-item nav-link" id="nav-contact-tab" href="/my/pointHistory" aria-controls="nav-contact" aria-selected="false">포인트 내역</a>
          </div>
        </nav>
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