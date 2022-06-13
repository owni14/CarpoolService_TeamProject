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
							<div class="accordion" id="accordionExample">
								<div class="accordion-item">
									<h2 class="accordion-header" id="headingOne">
										<button class="accordion-button" type="button"
											data-bs-toggle="collapse" data-bs-target="#collapseOne"
											aria-expanded="true" aria-controls="collapseOne">
											Accordion Item #1</button>
									</h2>
									<div id="collapseOne" class="accordion-collapse collapse show"
										aria-labelledby="headingOne"
										data-bs-parent="#accordionExample">
										<div class="accordion-body">
											<strong>This is the first item's accordion body.</strong> It
											is shown by default, until the collapse plugin adds the
											appropriate classes that we use to style each element. These
											classes control the overall appearance, as well as the
											showing and hiding via CSS transitions. You can modify any of
											this with custom CSS or overriding our default variables.
											It's also worth noting that just about any HTML can go within
											the
											<code>.accordion-body</code>
											, though the transition does limit overflow.
										</div>
									</div>
								</div>
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
						<td></td>
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