<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.my_card {
	display:flex; align-items: center;
}
</style>
<div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
		<div class="row">
			<div class="col-md-6 my_card">
				<img src="/resources/assets/img/man_default.jpg" class="rounded-circle">
			</div>
			<div class="col-md-6 my_card">
				<div>
				<span style="font-size: 30px;">${loginVo.m_name} 
				<c:choose>
					<c:when test="${loginVo.gender eq 'M'}">
						<i class="fa fa-mars" style="font-size:35px; color:skyblue;"></i> 
					</c:when>
					<c:otherwise>
						<i class="fa fa-venus" style="font-size:35px; color:pink"></i>
					</c:otherwise>
				</c:choose>
				
				- ${loginVo.m_id}</span><br>
				<span>${loginVo.m_company} ${loginVo.m_dept}</span><br>
				<textarea placeholder="자기소개를 작성해주세요" style="width: 100%"></textarea><br>
				<span>평점 : ${loginVo.m_evl }</span><br>
				<span>가입일자 : ${loginVo.m_joindate}</span>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-2">
	</div>
</div>