<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/event/event_header.jsp" %>
<style>
strong { color: rgb(255, 83, 26); font-size: large; text-shadow: 2px 2px 3px gray;}
.tdtdtdtd {vertical-align: middle;}
</style>
<div class="row">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-2">
			</div>
			<div class="col-md-8">
				<div class="tabbable" id="tabs-391804">
					<ul class="nav nav-tabs">
						<li class="nav-item">
							<a class="nav-link" href="/event/now">진행중인 이벤트</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/event/winner">당첨자 발표</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active" href="#">등급별 혜택</a>
						</li>
					</ul>
				</div>
				
				<table class="table" style="text-align: center;">
					<thead>
						<tr>
							<th>등급</th>
							<th>운전자</th>
							<th>탑승자</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td width="210px;"><img src="/resources/images/evl/vvip.png" width="200px;"></td>
							<td style="vertical-align: middle;">
								<p> 등급 조건 : 1년간 운전 횟수 <strong>65회</strong> 이상, 평점 <strong>4.5</strong> 이상 </p>
								<p> 혜택 : 매달 1일 700point 지급 </p>
								<p style="color: red;"> 블랙리스트 회원 불가 </p>
							</td>
							<td style="vertical-align: middle;">
								<p> 등급 조건 : 1년간 탑승 횟수 <strong>150회</strong> 이상 </p>
								<p> 혜택 : 매달 1일 500point 지급 </p>
								<p style="color: red;"> 블랙리스트 회원 불가 </p>
							</td>
						</tr>
						<tr>
							<td><img src="/resources/images/evl/vip.jpg" width="200px;" height="130px"></td>
							<td style="vertical-align: middle;">
								<p> 등급 조건 : 1년간 운전 횟수 50회 이상, 평점 4 이상 </p>
								<p> 혜택 : 매달 1일 400point 지급 </p>
							</td>
							<td style="vertical-align: middle;">
								<p> 등급 조건 : 1년간 탑승 횟수 100회 이상 </p>
								<p> 혜택 : 등업시 250point 지급 </p>
								</td>
						</tr>
						<tr>
							<td><img src="/resources/images/evl/gold.jpg" width="200px;" height="130px"></td>
							<td style="vertical-align: middle;">
								<p> 등급 조건 : 1년간 운전 횟수 35회 이상, 평점 3.5 이상 </p>
								<p> 혜택 : 매달 1일 300point 지급 </p>
							</td>
							<td style="vertical-align: middle;">
								<p> 등급 조건 : 1년간 탑승 횟수 40회 이상 </p>
								<p> 혜택 : 등업시 150point 지급 </p>
							</td>
						</tr>
						<tr>
							<td><img src="/resources/images/evl/silver.jpg" width="200px;" height="130px"></td>
							<td style="vertical-align: middle;">
								<p> 등급 조건 : 1년간 운전 횟수 8회 이상, 평점 3 이상 </p>
								<p> 혜택 : 매달 1일 1000point 지급 </p>
							</td>
							<td style="vertical-align: middle;">
								<p> 등급 조건 : 1년간 탑승 횟수 8회 이상 </p>
								<p> 혜택 : 등업시 100point 지급 </p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-2">
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>