<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
$(document).ready(function() {
	$("#btnCheck").click(function() {
		console.log("clicked");
	});
});
</script>
<!-- 카카오 지도 api -->
<div class="row" style="margin-top: 20px; margin-bottom: 20px;">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div id="map" style="height: 700px; width: 1400px;"></div>
		<script>
		$(document).ready(function() {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div     
			mapOption = {         
					center: new kakao.maps.LatLng(35.53501167687277, 129.31083525476953), // 지도의 중심좌표        
					level: 3 // 지도의 확대 레벨    
			}; 
			
			// 지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption);
			
			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl(); // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			
			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT); // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
			// 지도를 클릭한 위치에 표출할 마커입니다
			var marker = new kakao.maps.Marker({ 
			    // 지도 중심좌표에 마커를 생성합니다 
			    position: map.getCenter();
			}); 
			
			// 지도에 마커를 표시합니다
			marker.setMap(map);
			
			// 지도에 클릭 이벤트를 등록합니다
			// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
			    
			    // 클릭한 위도, 경도 정보를 가져옵니다 
			    var latlng = mouseEvent.latLng;
			    
			    // 마커 위치를 클릭한 위치로 옮깁니다
			    marker.setPosition(latlng);
			    console.log("위도 및 경도:" + latlng);
			    
			});
			
			var geocoder = new kakao.maps.services.Geocoder();
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	    		searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
			        if (status === kakao.maps.services.Status.OK) {
			            document.getElementById("startLoct").value = result[0].address.address_name;;
			        }   
			    });
			});
			
			function searchDetailAddrFromCoords(coords, callback) {
			    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
			}
		});
	</script>
	</div>
	<div class="col-md-2"></div>
</div>
<!-- // 카카오 지도 api -->

<!-- 운전자 등록폼 -->
<div class="row" style="margin-bottom: 20px;">
	<div class="col-md-2"></div>
	<div class="col-md-8">
	<h3 style="text-align: center;">지도에서 출발 위치를 클릭해주세요.</h3>
		<form role="form">
			<div class="form-group" style="margin-bottom: 10px;">
				<label for="startLocation"> 출발 위치 </label> 
				<input type="text" class="form-control" id="startLoct" name="startLocation" readonly="readonly"/>
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

<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<h5>동승자 예약 리스트 출력</h5>
	</div>
	<div class="col-md-2"></div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>