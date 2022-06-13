<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/customer_header.jsp" %>
<style>
.dropdown { margin-bottom: 30px;}
.tx-counsel { margin-bottom: 20px;}
.btn-success { float: right;}
</style>
${finishList}
<div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
	<!-- dropdown start -->
		<div class="dropdown">
			<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown">
				시스템 이용문의
			</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				 <a class="dropdown-item" href="#">시스템 이용문의</a>
				 <a class="dropdown-item" href="#">불편 사항</a>
				 <a class="dropdown-item" href="#">이벤트</a>
				 <a class="dropdown-item" href="#">포인트</a>
				 <a class="dropdown-item" href="#">기타</a>
			</div>
		</div>
	<!-- dropdown end -->
		
	<!-- textarea content start -->
		<div>
			<textarea class="form-control tx-counsel" style="height: 350px;" placeholder="문의사항을 입력해주세요" name="complain_content"></textarea>
			<button type="button" class="btn btn-success">문의하기</button>
		</div>
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
							<div class="accordion" id="notFinishList">
							<c:forEach items="${notFinishList}" var="complainVo" varStatus="status">
								<div class="accordion-item">
									
									<h2 class="accordion-header" id="notheading${status.count}">
										<button class="accordion-button" type="button"
											data-bs-toggle="collapse" data-bs-target="#notcollapse${status.count}"
											aria-expanded="true" aria-controls="notcollapse${status.count}">
											${complainVo.complain_content}</button>
									</h2>
									<div id="notcollapse${status.count}" class="accordion-collapse collapse"
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
						<th>완료된 문의사항</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<!-- Accordion start -->
							<div class="accordion" id="finishList">
							<c:forEach items="${finishList}" var="complainVo" varStatus="status">
								<div class="accordion-item">
									<h2 class="accordion-header" id="heading${status.count}">
										<button class="accordion-button" type="button"
											data-bs-toggle="collapse" data-bs-target="#collapse${status.count}"
											aria-expanded="true" aria-controls="collapse${status.count}">
											${complainVo.complain_content}</button>
									</h2>
									<div id="collapse${status.count}" class="accordion-collapse collapse"
										aria-labelledby="heading${status.count}"
										data-bs-parent="#finishList">
										<div class="accordion-body">
											<span>${complainVo.complain_regdate }</span>
											${complainVo.complain_answer}
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
	<!-- textarea content end -->
	</div>
	<div class="col-md-2">
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>