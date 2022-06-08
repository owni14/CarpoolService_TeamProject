<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
$(document).ready(function() {
	var count = 1;
	var mapContainer = document.getElementById('map') // 지도를 표시할 div
	
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
	
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
	
	// 비동기로 데이터 가져오기
	var url = "/board/driverList";
	$.get(url, function(rData) {
		$.each(rData, function() {
			var that = this;
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(this.m_address, function(result, status) {
		
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
			            content: "<div style='width:150px;text-align:center;padding:2px 0;'>" + that.m_name + "</div>"
			        });
			        infowindow.open(map, marker);
		
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } // if (status === kakao.maps.services.Status.OK)
			    	
			}); // geocoder.addressSearch(this.m_address, function(result, status){})
			
			var tr = $("#tblDriverClone  tr").clone();
			var tds = tr.find("td");
			tds.eq(0).text(count++);
			tds.eq(1).text(this.m_name);
			tds.eq(2).text(this.m_dept);
			tds.eq(3).text(this.m_address);
			tds.find(".btnBoard").attr("data-m_id", this.m_id);
			$("#tblDriver tbody").append(tr);
			
		}); // $.each(rData, function() {})
		
	}); // $.get(url, function(rData) {})
	
	 function showModalMap(driverName, driverAddr, driverDept) {
		 
		 /* 
		 console.log("driverName:" + driverName);
		 console.log("driverAddr:" + driverAddr);
		 console.log("driverDept:" + driverDept);
		  */
		  
		  $("#driverName").text(driverName);
		  $("#driverDept").text(driverDept);
		  $("#driverLoct").text(driverAddr);
		  var modalMapContainer = document.getElementById('mapInModal') // 지도를 표시할 div
			 modalMapOption = {
				    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				    level: 3 // 지도의 확대 레벨
				};  
			// 지도를 생성합니다    
			var modalMap = new kakao.maps.Map(modalMapContainer, modalMapOption);
			
			// 주소-좌표 변환 객체를 생성합니다
			var modalGeocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			modalGeocoder.addressSearch(driverAddr, function(result, status) {
		
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
		
			        var modalCoords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var modalMarker = new kakao.maps.Marker({
			        	modalMap: modalMap,
			            position: modalCoords
			        });
			
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var modalInfowindow = new kakao.maps.InfoWindow({
			            content: "<div style='width:150px; text-align:center;'>" + driverName + "</div>"
			        });
			        
			        // >>>>>>>>>>>>>>>>>> !!!!!! 마커 위치가 위로 조금 올라와 있음. 추후 한번 확인해서 수정해야함  !!!!!! <<<<<<<<<<<<<<<<<<<<
			        modalInfowindow.open(modalMap, modalMarker);
			        modalMap.setDraggable(false);  
			        setTimeout(function(){ modalMap.relayout();  modalMap.setCenter(modalCoords), modalMap.setLevel(3);}, 100);
			    } // if (status === kakao.maps.services.Status.OK)
			    	
			}); // modalGeocoder.addressSearch(driverAddr, function(result, status) {})
			
	 } // function showModalMap(driverName, driverAddr, driverDept) {})
	 
	 // 탑승 신청버튼 클릭
	 $("#tblDriver").on("click", ".btnBoard", function() {
		 
		 // 멤버 아이디 가져옵니다.
		 var m_id = $(this).attr("data-m_id");
		 
		 var url = "/board/driverInfo?m_id=" + m_id;
		 
		 // 비동기형식으로 데이터 보내고 받아와서 showModalMap함수 실행
		 $.get(url, function(rData) {
			 showModalMap(rData.m_name, rData.m_address, rData.m_dept);
		 });
		 
	 }); //  $("#tblDriver").on("click", ".btnBoard", function() {})
	 
	 // 모달창에서 버튼 클릭
	 $("#btnApply").click(function() {
		 console.log("clicked");
	 });
	 
}); // $(document).ready(function() {})
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
						운전자 정보
					</h5>
				</div>
				<div class="modal-body">
					<div style="font-weight: bold; "> 이름 : <span id="driverName"></span></div> 
					<div style="font-weight: bold; "> 부서 : <span id="driverDept"></span></div> 
					<div style="font-weight: bold; "> 출발 위치 : <span id="driverLoct"></span></div> 
					<div id="mapInModal" style="height: 300px; width: 100%;"></div>
				</div>
				<div class="modal-footer">
					<button type="button" id="btnApply" class="btn btn-success">
						신청하기
					</button> 
					<button type="button" class="btn btn-danger" data-dismiss="modal">
						취소
					</button>
				</div>
			</div>
		</div>
	</div>
<!-- // 모달창 -->

<!-- 탑승자 -->
<div class="row" style="margin-bottom: 20px;">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<form role="form">
			<div class="form-group" style="margin-bottom: 10px;">
				<h3 style="text-align: center">운전자 위치를 확인해주세요</h3>
				<label for="startLocation"> 탑승 위치 </label> 
				<input type="text" class="form-control" id="boardLoct" name="startLocation"/>
			</div>
			<div class="form-group" style="margin-bottom: 10px;">
				<label for="startTime"> 탑승 시간 </label> 
				<select name="startHour">
					<option value="6">06:00
					<option value="7">07:00
					<option value="8">08:00
				</select>
				<select name="startMin">
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
<!-- // 탑승자 -->

<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="row">
		<div class="col-md-12">
			<table id="tblDriverClone" class="table" style="display: none;">
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="tds"><a href="#modal-container-899906" role="button" class="btn btn-info btn-sm btnBoard" data-toggle="modal">탑승신청</a></td>
				</tr>
			</table>
			<table class="table" id="tblDriver" class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>운전자</th>
						<th>부서</th>
						<th>주소</th>
						<th>탑승신청</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>> 페이지 작업 해야함 (하나도 안되어 있음) <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
		<nav>
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<a class="page-link" href="#">Previous</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">1</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">2</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">3</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">4</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">5</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">Next</a>
				</li>
			</ul>
		</nav>
	</div>
	<div class="col-md-2"></div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>