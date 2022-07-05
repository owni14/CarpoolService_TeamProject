<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
/* 나의 평점보기 css  */
.rHeading {
	font-size: 20px;
	margin-right: 25px;
}

.fa {
	font-size: 25px;
}

.checked {
	color: orange;
}

/* Three column layout */
.side {
	float: left;
	width: 15%;
	margin-top: 10px;
}

.middle {
	float: left;
	width: 70%;
	margin-top: 10px;
}

/* Place text to the right */
.right {
	text-align: right;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* The bar container */
.bar-container {
	width: 100%;
	background-color: #f1f1f1;
	text-align: center;
	color: white;
}

/* Individual bars */
.bar-5 {
	width: 0%;
	height: 18px;
	background-color: #04AA6D;
}

.bar-4 {
	width: 0%;
	height: 18px;
	background-color: #2196F3;
}

.bar-3 {
	width: 0%;
	height: 18px;
	background-color: #00bcd4;
}

.bar-2 {
	width: 0%;
	height: 18px;
	background-color: #ff9800;
}

.bar-1 {
	width: 0%;
	height: 18px;
	background-color: #f44336;
}

/* Responsive layout - make the columns stack on top of each other instead of next to each other */
@media ( max-width : 400px) {
	.side, .middle {
		width: 100%;
	}
	/* Hide the right column on small screens */
	.right {
	display: none;
	}
	

}
</style>
<script>
$(document).ready(function() {
	var m_company = "${loginVo.m_company}";
	var character = "${loginVo.character}";
	var companyImg = $("#companyImg");
	var characterImg = $("#characterImg");
	
	switch(m_company) {
	case "DOOSAN":
		companyImg.attr("src", "/resources/images/companyLogo/doosan.png");
		break;
	case "HANWHA":
		companyImg.attr("src", "/resources/images/companyLogo/hanwha.png");
		break;
	case "HYUNDAI":
		companyImg.attr("src", "/resources/images/companyLogo/hyundai.png");
		break;
	case "KAKAO":
		companyImg.attr("src", "/resources/images/companyLogo/kakao.jpg");
		break;
	case "KT":
		companyImg.attr("src", "/resources/images/companyLogo/kt.png");
		break;
	case "LG":
		companyImg.attr("src", "/resources/images/companyLogo/lg.png");
		break;
	case "NAVER":
		companyImg.attr("src", "/resources/images/companyLogo/naver.png");
		break;
	case "NEXEN":
		companyImg.attr("src", "/resources/images/companyLogo/nexen.jpg");
		break;
	case "SAMSUNG":
		companyImg.attr("src", "/resources/images/companyLogo/samsung.png");
		break;
	case "SK":
		companyImg.attr("src", "/resources/images/companyLogo/sk.png");
		break;
	}
	
	switch(character) {
	case "female":
		characterImg.attr("src", "/resources/images/character/female.png");
		break;
	case "female2":
		characterImg.attr("src", "/resources/images/character/female2.png");
		break;
	case "female3":
		characterImg.attr("src", "/resources/images/character/female3.png");
		break;
	case "male":
		characterImg.attr("src", "/resources/images/character/male.png");
		break;
	case "male2":
		characterImg.attr("src", "/resources/images/character/male2.png");
		break;
	case "male3":
		characterImg.attr("src", "/resources/images/character/male3.png");
		break;
	}
	
	
	// 등급 이미지
	var driver_evl = "${driver_evlVo.g_code}";
	var passenger_evl = "${passenger_evlVo.g_code}";
	var driver_evlImg = $("#driver_evlImg");
	var passenger_evlImg = $("#passenger_evlImg");
	
	switch(driver_evl) {
	case "1001":
		driver_evlImg.attr("src", "/resources/images/evl/vvip.png");
		break;
	case "1002":
		driver_evlImg.attr("src", "/resources/images/evl/vip.jpg");
		break;
	case "1003":
		driver_evlImg.attr("src", "/resources/images/evl/gold.jpg");
		break;
	case "1004":
		driver_evlImg.attr("src", "/resources/images/evl/silver.jpg");
		break;
	case "1005":
		driver_evlImg.attr("src", "/resources/images/evl/white.jpg");
		break;
	}
	
	switch(passenger_evl) {
	case "1006":
		passenger_evlImg.attr("src", "/resources/images/evl/vvip.png");
		break;
	case "1007":
		passenger_evlImg.attr("src", "/resources/images/evl/vip.jpg");
		break;
	case "1008":
		passenger_evlImg.attr("src", "/resources/images/evl/gold.jpg");
		break;
	case "1009":
		passenger_evlImg.attr("src", "/resources/images/evl/silver.jpg");
		break;
	case "1010":
		passenger_evlImg.attr("src", "/resources/images/evl/white.jpg");
		break;
	}
	
});
</script>


<div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
		<div class="row" style="margin: 50px 0px 50px 0px;">
			<div class="col-md-5" >
				<div class="row">
					<div class="col-md-6" style="text-align: center; margin : auto;">
						<div>
							<img id="characterImg" src="/resources/images/character/default.png" width="200px;" height="150px;">
						</div>
						<div >
							<span style="font-size: 25px;">${loginVo.m_name} 
								<c:choose>
									<c:when test="${loginVo.gender eq 'M'}">
										<i class="fa fa-mars" style="color:skyblue;"></i> 
									</c:when>
									<c:otherwise>
										<i class="fa fa-venus" style="color:pink"></i>
									</c:otherwise>
								</c:choose>
							</span><br>
							<span>
								<img id="companyImg" alt="companyLogo.png" src="/resources/images/companyLogo/default.png"	width = "100px;" height="40px;"> 
								${loginVo.m_dept}
							</span><br>
							<span>벌점 : ${loginVo.m_blackpoint}</span><br>
							<span>가입일자 : ${loginVo.m_joindate}</span>
						</div>
					</div>
					<div class="col-md-6">
						<div>
							<p style="text-align: center;"><strong>탑승 정보</strong></p>
							<hr>
							<p><img id="passenger_evlImg" width="200px;" height="75px;"></p>
							<p>총 탑승 횟수 : ${passenger_evlVo.pe_ride_count}회</p>
							<p style="text-align: center;"><strong>포인트 정보</strong></p>
							<hr>
							<p>현재 포인트 : ${loginVo.m_point}point</p>
							<p>다음달 
							<span style="color: red; font-weight: bold;">
							<c:choose>
								<c:when test="${passenger_evlVo.g_code eq '1006'}">
									${pointVo.G_BENEFIT + 500}point
								</c:when>
								<c:otherwise>
									${pointVo.G_BENEFIT}point
								</c:otherwise>
							</c:choose>
							</span>
							
							가 <br>들어올 예정입니다.</p>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-md-7">
				<c:if test="${isDriver == false}">
				<div id="blind" style="text-align: center; position: absolute; width: 100%; height: 100%; ">
					<p style="
						background-color: rgba( 51, 51, 51, 0.8 ); position: relative; width: 100%; height: 100%;
						text-align: center;">
						<span style="font-size: 35px; font-weight: bold; color: white;  ">운전자 등록을 해주세요.</span><br>
					</p>
				</div>
				</c:if>
				<!-- 나의 평점 보기 start -->
				<div class="row" style="text-align: center;">
					<p><strong>운행 정보</strong></p>
						<hr>
					<div class="col-md-5">
						
							<img id="driver_evlImg" width="200px;" height="75px;">
						
					</div>
					<div class="col-md-7">
						<span class="rHeading">${loginVo.m_id}</span>
						<span class="fa fa-star
							<c:if test="${evl_avg >= 1}">
								 checked
							</c:if>"
						></span>
						<span class="fa fa-star 
							<c:if test="${evl_avg >= 2}">
								 checked
							</c:if>"
						></span>
						<span class="fa fa-star 
							<c:if test="${evl_avg >= 3}">
								 checked
							</c:if>"
						></span>
						<span class="fa fa-star 
							<c:if test="${evl_avg >= 4}">
								 checked
							</c:if>"
						></span>
						<span class="fa fa-star 
							<c:if test="${evl_avg >= 5}">
								 checked
							</c:if>"
						></span>
						<p>총 운행수 : ${driver_evlVo.de_drive_count}회 | 평점 : ${evl_avg}점 | 총 평가수: ${driver_evlVo.evl_count}회 </p>
					</div>
					
				</div>
				<hr style="border:3px solid #f1f1f1">

				<div class="row">
					
					<div class="side">
						<div>5점</div>
					</div>
					<div class="middle">
						<div class="bar-container">
							<div class="bar-5" style="width: ${(driver_evlVo.evl5) / (driver_evlVo.evl_count) * 100}%;"></div>
						</div>
					</div>
					<div class="side right">
						<div>${driver_evlVo.evl5}</div>
					</div>
					
					<div class="side">
						<div>4점</div>
					</div>
					<div class="middle">
						<div class="bar-container">
							<div class="bar-4" style="width: ${(driver_evlVo.evl4) / (driver_evlVo.evl_count) * 100}%;"></div>
						</div>
					</div>
					<div class="side right">
						<div>${driver_evlVo.evl4}</div>
					</div>
					<div class="side">
						<div>3점</div>
					</div>
					<div class="middle">
						<div class="bar-container">
							<div class="bar-3" style="width: ${(driver_evlVo.evl3) / (driver_evlVo.evl_count) * 100}%;"></div>
						</div>
					</div>
					<div class="side right">
						<div>${driver_evlVo.evl3}</div>
					</div>
					<div class="side">
						<div>2점</div>
					</div>
					<div class="middle">
						<div class="bar-container">
							<div class="bar-2" style="width: ${(driver_evlVo.evl2) / (driver_evlVo.evl_count) * 100}%;"></div>
						</div>
					</div>
					<div class="side right">
						<div>${driver_evlVo.evl2}</div>
					</div>
					<div class="side">
						<div>1점</div>
					</div>
					<div class="middle">
						<div class="bar-container">
							<div class="bar-1" style="width: ${(driver_evlVo.evl1) / (driver_evlVo.evl_count) * 100}%;"></div>
						</div>
					</div>
					<div class="side right">
						<div>${driver_evlVo.evl1}</div>
					</div>
				</div>
				<!-- 나의 평점보기 end -->
			</div>
		</div>
	</div>
	<div class="col-md-2">
	</div>
</div>