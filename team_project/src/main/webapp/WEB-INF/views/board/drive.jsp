<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
	$(document).ready(function() {
		
	// 카카오 지도 api
	var address = $("#startLoct").val();
	console.log("startLocation:" + address); // 출발 위치 확인
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    }; // mapOption

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);
    
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(address, function(result, status) { 

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">출발 위치</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	}); // geocoder.addressSearch()   
}); // $(document).ready(function(){})
</script>
<!-- 카카오 지도 api -->
<div class="row" style="margin-top: 20px; margin-bottom: 20px;">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div id="map" style="height: 700px; width: 100%;"></div>
	</div>
	<div class="col-md-2"></div>
</div>
<!-- // 카카오 지도 api -->

<!-- 운전자 등록폼 -->
<div class="row" style="margin-bottom: 20px;">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<form role="form">
			<div class="form-group" style="margin-bottom: 10px;">
				<label for="startLocation"> 출발 위치 </label> 
				<input type="text" class="form-control" id="startLoct" name="startLocation" readonly="readonly" value="${loginVo.m_address}"/>
			</div>
			<div class="form-group" style="margin-bottom: 10px;">
				<label for="isSmoke"> 흡연 여부 </label><br>
				<input type="radio" id="isSmoke" name="isSmoke" value="true"> 흡연
				<input type="radio" id="isSmoke" name="isSmoke" value="false"> 비흡연
			</div>
			<div class="form-group" style="margin-bottom: 10px;">
				<label for="exampleInputEmail1"> 요구 사항 </label> 
				<input type="email" class="form-control" id="exampleInputEmail1" />
			</div>
			<div class="form-group" style="margin-bottom: 10px;">
				<label for="startTime"> 출발 시간 </label> 
				<select id="startHour" name="startHour">
					<option value="6">06:00
					<option value="7">07:00
					<option value="8">08:00
				</select>
				<select id="startMin" name="startMin">
					<option value="00">00
					<option value="10">10
					<option value="20">20
					<option value="30">30
					<option value="40">40
					<option value="50">50
				</select>
			</div>
			<button id="btnCheck" type="button" class="btn btn-primary">확인</button>
		</form>
	</div>
	<div class="col-md-2"></div>
</div>
<!-- // 운전자 등록폼 -->

<!-- 동승자 리스트 -->
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>동승자</th>
						<th>부서</th>
						<th>주소</th>
						<th>예약확인</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>#</td>
							<td>#</td>
							<td>#</td>
							<td>#</td>
							<td><button class="btn btn-success btn-sm" class="checkResv">예약확인</button></td>
						</tr>	
				</tbody>
			</table>
		</div>
	</div>
	</div>
	<div class="col-md-2"></div>
</div>
<!-- // 동승자 리스트 -->
<%@ include file="/WEB-INF/views/include/footer.jsp"%>