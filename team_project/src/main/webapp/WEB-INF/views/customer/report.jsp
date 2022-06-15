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
	var black_result = "${black_result}";
	if (black_result == "true") {
		alert("정상적으로 신고 처리되었습니다.");
	}
});
</script>

<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div>
			<table class="table">
				<thead>
					<tr style="text-align: center;">
						<th>신고 내역</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<!-- Accordion start -->
							<div class="accordion accordion-flush" id="notFinishList">
								<c:forEach items="${yBlackList}" var="blackListVo"
									varStatus="status">
									<div class="accordion-item">

										<h2 class="accordion-header" id="notheading${status.count}">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse"
												data-bs-target="#notcollapse${status.count}"
												aria-expanded="false"
												aria-controls="notcollapse${status.count}">
												${blackListVo.black_content}</button>
										</h2>
										<div id="notcollapse${status.count}"
											class="accordion-collapse collapse"
											aria-labelledby="notheading${status.count}"
											data-bs-parent="#notFinishList">
											<div class="accordion-body">
												<p>신고 대상자 : ${blackListVo.black_m_id}</p>
												<p>신고일 : ${blackListVo.black_regdate}</p>
												<p>신고 내용 : ${blackListVo.black_content}</p>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<!-- Accordion ends -->
						</td>
					</tr>
				</tbody>
			</table>


		</div>
		<div>
			<table class="table">
				<thead>
					<tr style="text-align: center;">
						<th>신고 받은 내역</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<!-- Accordion start -->
							<div class="accordion accordion-flush" id="finishList">
								<c:forEach items="${nBlackList}" var="blackListVo"
									varStatus="status">
									<div class="accordion-item">
										<h2 class="accordion-header" id="heading${status.count}">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse"
												data-bs-target="#collapse${status.count}"
												aria-expanded="false"
												aria-controls="collapse${status.count}">
												${blackListVo.black_content}</button>
										</h2>
										<div id="collapse${status.count}"
											class="accordion-collapse collapse"
											aria-labelledby="heading${status.count}"
											data-bs-parent="#finishList">
											<div class="accordion-body">
												<p>신고 번호 : ${blackListVo.blacklist_seq}</p>
												<p>신고 대상자 : ${blackListVo.black_m_id}</p>
												<p>벌점 : 
												<c:choose>
													<c:when test="${blackListVo.black_score == 0}">
														사유 불충분
													</c:when>
													<c:otherwise>
														-${blackListVo.black_score}점
													</c:otherwise>
												</c:choose>
												</p>
												<p>신고 내용 : ${blackListVo.black_content}</p>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<!-- Accordion ends -->
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</div>
	<div class="col-md-2"></div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>