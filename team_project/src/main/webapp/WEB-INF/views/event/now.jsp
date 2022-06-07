<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/event_header.jsp" %>
<style>
.e_img { width: 640px; height: 150px;}
.e_content { margin-top: 40px; text-align: center; }
.e_date { text-align: center; }
</style>

<div class="row">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-2">
			</div>
			<div class="col-md-8">
			<table class="table">
			<c:forEach items="${eventList}" var="eventVo">
				<tr>
					
						<td>
							<img class="e_img" src="/resources/assets/img/event.jpg" alt="">
						</td>
						<td>
							<p class="e_content">${eventVo.event_content }</p>
							<p class="e_date">${eventVo.event_startdate} ~ ${eventVo.event_enddate}</p>
						</td>
						<td>
							진행
						</td>
					
				</tr>
				</c:forEach>
			</table>
			
			
			
<!-- 				<div > -->
				
				
<!-- 					<a href="#"> -->
					
<!-- 						<span class="thumb"> -->
							
<!-- 						</span> -->
						
<!-- 						<span class="event_content"> -->
<!-- 							<span class="e_wrap"> -->
<!-- 								<span class="subject">여름맞이 썸머 이벤트! </span> -->
<!-- 							</span> -->
<!-- 							<span class="e_wrap"> -->
<!-- 								<span class="date"> -->
<!-- 									2022-06-01 ~ 2022-06-13 -->
<!-- 								</span> -->
<!-- 							</span> -->
<!-- 						</span> -->
<!-- 						<span class="state proceeding"> -->
<!-- 							진행 -->
<!-- 						</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
				</div>
			<div class="col-md-2">
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>