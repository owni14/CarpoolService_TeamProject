<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.my_card {
	display:flex; align-items: center;
}
#p_logout {
	font-size: 30px;
}
</style>
<script>
$(document).ready(function() {
	var m_company = "${loginVo.m_company}";
	var img = $("#companyImg");
	switch(m_company) {
	case "DOOSAN":
		img.attr("src", "/resources/images/companyLogo/DOOSAN.png");
		break;
	case "HANWHA":
		img.attr("src", "/resources/images/companyLogo/HANWHA.png");
		break;
	case "HYUNDAI":
		img.attr("src", "/resources/images/companyLogo/HYUNDAI.png");
		break;
	case "KAKAO":
		img.attr("src", "/resources/images/companyLogo/KAKAO.jpg");
		break;
	case "KT":
		img.attr("src", "/resources/images/companyLogo/KT.png");
		break;
	case "LG":
		img.attr("src", "/resources/images/companyLogo/LG.png");
		break;
	case "NAVER":
		img.attr("src", "/resources/images/companyLogo/NAVER.png");
		break;
	case "NEXEN":
		img.attr("src", "/resources/images/companyLogo/NEXEN.jpg");
		break;
	case "SAMSUNG":
		img.attr("src", "/resources/images/companyLogo/SAMSUNG.png");
		break;
	case "SK":
		img.attr("src", "/resources/images/companyLogo/SK.png");
		break;
	}
});
</script>
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
					<div style="text-align: center;">
						<img id="companyImg" alt="companyLogo.png" src="/resources/images/companyLogo/DEFAULTLOGO.png" height="150px;" width="350px;">
					</div>
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
				<span>회사 및 부서 : ${loginVo.m_company} ${loginVo.m_dept}</span><br>
				<span>평점 : ${loginVo.m_evl }</span><br>
				<span>가입일자 : ${loginVo.m_joindate}</span>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-2">
	</div>
</div>