<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/customer/customer_header.jsp"%>
<style>


.tx-counsel {
	margin-bottom: 20px;
}

.btn-success {
	float: right;
}
</style>
<script>
$(document).ready(function() {
	var frmComplain = $("#frmComplain");
	var complain_error = "${complain_error}";
	var complain_submit = "${complain_submit}";
	
	if (complain_error == "true") {
		alert("분류 혹은 문의사항 내용을 입력해 주세요");
	}
	
	if (complain_submit == "true") {
		alert("1:1 문의가 등록되었습니다.")
	} else if (complain_submit == "false"){
		alert("오류");
	}
	
	
	
	$(".dropdown-menu li > a").click(function(e) {
		e.preventDefault();
		var menu = $(this).text();
		$(".dropdown-toggle").text(menu);
	});
	
	$("#complain_submit").click(function() {
		var menu = $(".dropdown-toggle").text();
		var content = $("#complain_content").val();
		var complain_classification = frmComplain.find("input[name=complain_classification]");
		var complain_content = frmComplain.find("input[name=complain_content]");
		complain_classification.val(menu);
		complain_content.val(content);
		frmComplain.attr("action", "complain_run");
		frmComplain.attr("method", "post");
		frmComplain.submit();
	});
});
	
</script>
<%@ include file="/WEB-INF/views/customer/frmComplain.jsp" %>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		
		<!-- dropdown start -->
		<div class="txc-textbox">
			<!-- Single button -->
			<div id="example" class="btn-group">
				
				<button type="button" class="btn btn-default dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">분류를 선택해 주세요</button>
				<ul class="dropdown-menu">
					<li><a href="시스템 이용문의">시스템 이용문의</a></li>
					<li><a href="불편 사항">불편 사항</a></li>
					<li><a href="이벤트">이벤트</a></li>
					<li><a href="포인트">포인트</a></li>
					<li><a href="기타">기타</a></li>
				</ul>
			</div>
		</div>

		<!-- dropdown end -->

		<!-- textarea content start -->
		<div>
			<textarea class="form-control tx-counsel" style="height: 350px;"
				placeholder="문의사항을 입력해주세요" id="complain_content"></textarea>
			<button type="button" class="btn btn-success" id="complain_submit">문의하기</button>
		</div>
		<!-- textarea content end -->
		
		<div>
			<table class="table">
				<thead>
					<tr style="text-align: center;">
						<th>진행중인 문의사항</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<!-- Accordion start -->
							<div class="accordion accordion-flush" id="notFinishList">
								<c:forEach items="${notFinishList}" var="complainVo"
									varStatus="status">
									<div class="accordion-item">

										<h2 class="accordion-header" id="notheading${status.count}">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse"
												data-bs-target="#notcollapse${status.count}"
												aria-expanded="false"
												aria-controls="notcollapse${status.count}">
												${complainVo.complain_content}</button>
										</h2>
										<div id="notcollapse${status.count}"
											class="accordion-collapse collapse"
											aria-labelledby="notheading${status.count}"
											data-bs-parent="#notFinishList">
											<div class="accordion-body">
												<p>문의 날짜 : ${complainVo.complain_regdate}</p>
												<p>분류 : ${complainVo.complain_classification}</p>
												<p>상세 내용 : ${complainVo.complain_content}</p>

											</div>
										</div>
									</div>
								</c:forEach>
							</div> <!-- Accordion ends -->
						</td>
					</tr>
				</tbody>
			</table>


		</div>
		<div>
			<table class="table">
				<thead>
					<tr style="text-align: center;">
						<th>완료된 문의사항</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<!-- Accordion start -->
							<div class="accordion accordion-flush" id="finishList">
								<c:forEach items="${finishList}" var="complainVo"
									varStatus="status">
									<div class="accordion-item">
										<h2 class="accordion-header" id="heading${status.count}">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse"
												data-bs-target="#collapse${status.count}"
												aria-expanded="false"
												aria-controls="collapse${status.count}">
												${complainVo.COMPLAIN_CONTENT}</button>
										</h2>
										<div id="collapse${status.count}"
											class="accordion-collapse collapse"
											aria-labelledby="heading${status.count}"
											data-bs-parent="#finishList">
											<div class="accordion-body">
												<p style="text-align: right;">답변시간 :
													${complainVo.COMPLAIN_REGDATE}</p>
												${complainVo.ADMIN_WORK} : ${complainVo.COMPLAIN_ANSWER}

											</div>
										</div>
									</div>
								</c:forEach>
							</div> <!-- Accordion ends -->
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</div>
	<div class="col-md-2"></div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>