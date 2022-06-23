<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
	var isDriver = "${isDriver}";
	var updateResult = "${updateResult}";
	var deleteResult = "${deleteResult}";
	if (updateResult == "true") {
		alert("수정이 완료되었습니다.");
	}
	if (deleteResult == "true") {
		alert("삭제가 완료되었습니다.");
	}
	$(document).ready(function() {
		var m_company = "${loginVo.m_company}";
// 		var driver_seq = "${driver_seq}";
		var approveResult = "${approveResult}";
		var rejectResult = "${rejectResult}";
		if (approveResult == "true") {
			alert ("탑승승인이 정상적으로 처리되었습니다.");
		} else if (approveResult == "false") {
			alert ("탑승승인에 오류가 있습니다. \n고객센터로 문의부탁드립니다.");
		}
		if (rejectResult == "true") {
			alert ("탑승거부가 정상적으로 처리되었습니다.")
		} else if (rejectResult == "false") {
			alert ("탑승거부하는데 오류가 있습니다. \n고객센터로 문의부탁드립니다.")
		}
		console.log("m_company:" + m_company);
// 		console.log("driver_seq:" + driver_seq);
	// 카카오 지도 api
	var address = $("#startLoct").val();
	var m_name = "N";
// 	console.log("startLocation:" + address); // 출발 위치 확인
	
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
	
	// 주소를 받아 지도에 표시할 함수
	searchLocation(address, map, m_name);
	
	// 주소를 받아 지도에 표시할 함수
	function searchLocation(address, map, m_name) {
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(address, function(result, status) { 
	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
	
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
		     	// 마커 이미지의 이미지 주소입니다
		        var imageSrc = "/resources/images/maker/home.png"; 
		     	
		     	// 마커 이미지의 이미지 크기 입니다
		        var imageSize = new kakao.maps.Size(35, 35); 
		        
		        // 마커 이미지를 생성합니다    
		        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords,
		            image : markerImage
		        });
		        
// 		        // 결과값으로 받은 위치를 마커로 표시합니다
// 		        var marker = new kakao.maps.Marker({
// 		            map: map,
// 		            position: coords
// 		        });
	
		        if (m_name != "N") {
		        	var infowindow = new kakao.maps.InfoWindow({
			            content: "<div style='width:150px;text-align:center;'> " + m_name + "님의 위치</div>"
			        });	        	
		        } else {
		        	 // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;">출발 위치</div>'
			        });
		        }
		       
		        infowindow.open(map, marker);
		        
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		        
		        if (m_name != "N") {
		        	setTimeout(function(){ map.relayout();  map.setCenter(coords), map.setLevel(4);}, 200);		        	
		        }
		        map.setDraggable(false); // 지도 이동 금지
		        map.setZoomable(false); // 지도 확대및축소 금지
		    } // if (status === kakao.maps.services.Status.OK) {})
		}); // geocoder.addressSearch()  
	} // function searchLocation(address, map, m_name) {})
	
	// 모달창에 표시할 지도
	function showModalMap(address, m_name) {
		var mapContainer = document.getElementById('mapInModal'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    }; // mapOption

		// 지도를 생성합니다    
		var modalMap = new kakao.maps.Map(mapContainer, mapOption);
	    
		// 주소를 받아 지도에 표시할 함수
		var coords = searchLocation(address, modalMap, m_name);
	} // function showModalMap(address) {})
	
	
	
	// 탑승자 주소 클릭시 실행되는 함수
	$(".btnBoard").click(function() {
		// 탑승자의 주소를 얻습니다.
		var address = $(this).attr("data-location");
		var m_name = $(this).attr("data-m_name");
		// 주소를 지도를 띄울 함수로 보냅니다.
		showModalMap(address, m_name);
	}); // $(".btnBoard").click(function() {})
	
	// 운전하기가 등록되어 있을 경우 기존 운전하기내용을 수정 및 삭제할 수 있는 버튼을 보여줍니다.
	if (isDriver == "true") {
		$("#btnCheck").attr("style", "display:none;")
		$("#btnModify").attr("style", "false");
		$("#btnDelete").attr("style", "false");
		$("#txtList").attr("style", "display: false; text-align: center;");
	}
	
	$("#btnModify").click(function() {
		$("#btnCheck").attr("type", "button");
		$("#frmDriver").attr("action", "/board/updateDriver");
		$(this).attr("type", "submit");
	});
	
}); // $(document).ready(function(){})
</script>
<div
	<c:if test="${passengerList == '[]' || passengerList == null}">
		style="display: none"
	</c:if>
>
	<h3 id="txtList" style="text-align: center;">탑승자 리스트</h3>
	<!-- 탑승자 리스트 -->
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
							<c:if test="${!(v.IS_APPROVE == 'C' || v.IS_APPROVE == 'Y')}">
								<tr>	
									<td>${status.count}</td>
									<td>${v.M_NAME}</td>
									<td>${v.M_DEPT}</td>
									<td>${v.PASSENGER_DEPART_TIME}</td>
									<td><a href="#modal-container-899906" role="button" class="btnBoard" data-toggle="modal" data-m_name="${v.M_NAME}" data-location="${v.PASSENGER_DEPART_LOCATION}">${v.PASSENGER_DEPART_LOCATION}</a></td>
									<td><a href="/board/approvePassenger?m_id=${v.M_ID}&m_name=${v.M_NAME}&depart_time=${v.PASSENGER_DEPART_TIME}&depart_location=${v.PASSENGER_DEPART_LOCATION}" class="btn btn-success btn-sm approve">승인</a></td>
									<td><a href="/board/rejectPassenger?m_id=${v.M_ID}&driverId=${loginVo.m_id}" class="btn btn-danger btn-sm reject">거부</a></td>
								</tr>	
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<!-- // 탑승자 리스트 -->
<div
	<c:if test="${passengerList == '[]' || passengerList == null}">
		style="display: none"
	</c:if>
	<c:forEach items="${passengerList}" var="v">
		<c:if test="${v == '[]' || v.IS_APPROVE != 'Y'}">
			style="display: none"
		</c:if>
	</c:forEach>
>
	<h3 id="txtList" style="text-align: center; color: green;">승인 리스트</h3>
	<!-- 승인 리스트 -->
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
							<th>승인취소</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${passengerList}" var="v" varStatus="status">
							<c:if test="${(v.IS_APPROVE == 'Y')}">
								<tr>	
									<td>${status.count}</td>
									<td>${v.M_NAME}</td>
									<td>${v.M_DEPT}</td>
									<td>${v.PASSENGER_DEPART_TIME}</td>
									<td><a href="#modal-container-899906" role="button" class="btnBoard" data-toggle="modal" data-m_name="${v.M_NAME}" data-location="${v.PASSENGER_DEPART_LOCATION}">${v.PASSENGER_DEPART_LOCATION}</a></td>
									<td><a href="/board/rejectPassenger?m_id=${v.M_ID}&driverId=${loginVo.m_id}" class="btn btn-danger btn-sm reject">취소</a></td>
								</tr>
							</c:if>	
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<!-- // 승인 리스트 -->

<!-- 모달창 -->
 <a id="modal-899906" style="display: none;">modal</a>
	<div class="modal fade" id="modal-container-899906" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel" style="font-weight: bold;">
						탑승자 위치
					</h5>
				</div>
				<div class="modal-body">
					<div id="mapInModal" style="height: 300px; width: 100%;"></div>
				</div>
			</div>
		</div>
	</div>
<!-- // 모달창 -->

<div>
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
			<form id="frmDriver" role="form" action="/board/addDriver" method="post">
			<input type="hidden" name="driver_seq" value="${driver_seq}">
				<div class="form-group" style="margin-bottom: 10px;">
					<label for="startLocation"> 출발 위치 </label> 
					<input type="text" class="form-control" id="startLoct" name="startLoct" readonly="readonly" value="${loginVo.m_address}"/>
				</div>
				<div class="form-group" style="margin-bottom: 10px;">
					<label for="isSmoke"> 흡연 여부 </label><br>
					<input type="radio" id="isSmoke" name="isSmoke" value="Y" 
						<c:if test="${driverVo.driver_is_smoke == 'Y'}">
							checked="checked"
						</c:if>
					> 흡연
					<input type="radio" id="isSmoke" name="isSmoke" value="N"
						<c:choose>
							<c:when test="${driverVo.driver_is_smoke == null}">
								checked="checked"
							</c:when>
							<c:when test="${driverVo.driver_is_smoke == 'N'}">
								checked="checked"
							</c:when>
						</c:choose>
					> 비흡연
				</div>
				<div class="form-group" style="margin-bottom: 10px;">
					<label for="requirements"> 요구 사항 </label> 
					<input type="text" class="form-control" id="requirements" name="requirements" value="${driverVo.driver_comment}"/>
				</div>
				<div class="form-group" style="margin-bottom: 10px;">
					<label for="startTime"> 출발 시간 </label> 
					<select id="startHour" name="startHour">
						<option value="06:" 
							<c:if test="${depart_time_hour == '06:'}">
								selected="selected"
							</c:if>
						>06
						<option value="07:"
							<c:if test="${depart_time_hour == '07:'}">
								selected="selected"
							</c:if>
						>07
						<option value="08:"
							<c:if test="${depart_time_hour == '08:'}">
								selected="selected"
							</c:if>
						>08
					</select>
					<select id="startMin" name="startMin">
						<option value="00"
							<c:if test="${depart_time_min == '00'}">
								selected="selected"
							</c:if>
						>00
						<option value="10"
							<c:if test="${depart_time_min == '10'}">
								selected="selected"
							</c:if>
						>10
						<option value="20"
							<c:if test="${depart_time_min == '20'}">
								selected="selected"
							</c:if>
						>20
						<option value="30"
							<c:if test="${depart_time_min == '30'}">
								selected="selected"
							</c:if>
						>30
						<option value="40"
							<c:if test="${depart_time_min == '40'}">
								selected="selected"
							</c:if>
						>40
						<option value="50"
							<c:if test="${depart_time_min == '50'}">
								selected="selected"
							</c:if>
						>50
					</select>
				</div>
				<button id="btnCheck" type="submit" class="btn btn-primary" style="display: ">확인</button>
<!-- 				<button id="btnModify" type="button" class="btn btn-warning" style="display: none;">운전정보수정</button> -->
				<a href="/board/deleteDriver?driver_seq=${driver_seq}&driver_id=${loginVo.m_id}" id="btnDelete" type="button" class="btn btn-danger btn-sm" style="display: none;">운전취소</a>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<!-- // 운전자 등록폼 -->

<%@ include file="/WEB-INF/views/include/footer.jsp"%>