<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
	$(document).ready(function() {
		var m_company = "${loginVo.m_company}";
		var driver_seq = "${driver_seq}";
		console.log("m_company:" + m_company);
		console.log("driver_seq:" + driver_seq);
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

<!-- 모달창 -->
 <a id="modal-899906" style="display: none;">modal</a>
	<div class="modal fade" id="modal-container-899906" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel" style="font-weight: bold;">
						탑승자 상세위치
					</h5>
				</div>
				<div class="modal-body">
					<h6 style="font-weight: bold; "> 이름 : <span id="driverName"></span></h6> 
					<h6 style="font-weight: bold; "> 성별 : <span id="gender"></span></h6>
					<h6 style="font-weight: bold; "> 부서 : <span id="driverDept"></span></h6> 
					<h6 style="font-weight: bold; "> 출발 위치 : <span id="driverLoct"></span></h6> 
					<h6 style="font-weight: bold; "> 출발 시간 : <span id="driverStartTime"></span></h6> 
					<h6 style="font-weight: bold; color: red;"> 요구 사항 : <span id="driverComment"></span></h6> 
					<hr>
					<h6 style="font-weight: bold; "> 내 위치 : <span id="mBoardLoct"></span></h6>
					<div style="font-weight: bold; text-align: center; color: green;"> 운전자 위치 </div> 
					<div id="mapInModal" style="height: 300px; width: 100%;"></div>
				</div>
				<div class="modal-footer">
					<button type="button" id="btnApply" class="btn btn-success" >
						신청하기
					</button> 
					<button type="button" id="btnCancel" class="btn btn-danger" data-dismiss="modal">
						취소
					</button>
				</div>
			</div>
		</div>
	</div>
<!-- // 모달창 -->

<!-- 운전자 등록폼 -->
<div class="row" style="margin-bottom: 20px;">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<form role="form" action="/board/addDriver" method="post">
			<div class="form-group" style="margin-bottom: 10px;">
				<label for="startLocation"> 출발 위치 </label> 
				<input type="text" class="form-control" id="startLoct" name="startLoct" readonly="readonly" value="${loginVo.m_address}"/>
			</div>
			<div class="form-group" style="margin-bottom: 10px;">
				<label for="isSmoke"> 흡연 여부 </label><br>
				<input type="radio" id="isSmoke" name="isSmoke" value="Y"> 흡연
				<input type="radio" id="isSmoke" name="isSmoke" value="N"> 비흡연
			</div>
			<div class="form-group" style="margin-bottom: 10px;">
				<label for="requirements"> 요구 사항 </label> 
				<input type="text" class="form-control" id="requirements" name="requirements"/>
			</div>
			<div class="form-group" style="margin-bottom: 10px;">
				<label for="startTime"> 출발 시간 </label> 
				<select id="startHour" name="startHour">
					<option value="06:">06
					<option value="07:">07
					<option value="08:">08
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
			<button id="btnCheck" type="submit" class="btn btn-primary">확인</button>
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
						<th>탑승자</th>
						<th>부서</th>
						<th>탑승시간</th>
						<th>탑승위치</th>
						<th>승인</th>
						<th>거부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${passengerList}" var="v" varStatus="status">
						<tr>	
							<td>${status.count}</td>
							<td>${v.M_NAME}</td>
							<td>${v.M_DEPT}</td>
							<td>${v.PASSENGER_DEPART_TIME}</td>
							<td><a href="#modal-container-899906" role="button" class="btnBoard" data-toggle="modal">${v.PASSENGER_DEPART_LOCATION}</a></td>
							<td><button class="btn btn-success btn-sm" class="checkResv">승인</button></td>
							<td><button class="btn btn-danger btn-sm" class="checkResv">거부</button></td>
						</tr>	
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</div>
	<div class="col-md-2"></div>
</div>
<!-- // 동승자 리스트 -->

<%@ include file="/WEB-INF/views/include/footer.jsp"%>