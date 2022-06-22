<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
$(document).ready(function() {
	// 회원의 탑승신청 결과와 탑승취소 결과를 얻어와 알림창으로 출력
	var passengerResult = "${passengerResult}";
	var deletePasgResult = "${deletePasgResult}";
	// 로그인한 회원이 운전하기에 등록되어 있고 예약하기를 할 경우 결과를 받아오늘 변수
	var duplication = "${duplication}";
	if (passengerResult == "true") {
		alert("탑승신청이 완료되었습니다.");
	} else if (passengerResult == "false") {
		alert("탑승신청에 실패하였습니다. \n실패가 계속 될 경우 고객센터로 문의부탁드립니다.");
	}
	if (deletePasgResult == "true") {
		alert("탑승신청이 취소되었습니다.");
	} else if (deletePasgResult == "false") {
		alert("탑승신청취소 오류 \n고객센터로 문의부탁드립니다.");
	}
	if (duplication == "true") {
		alert("익일 운전자로 등록된 회원입니다. \n예약을 원하시면 운전하기를 취소해 주시기바랍니다.");
	}
	
	// 리스트에서 순번을 나타낼 숫자
	// 초기 숫자를 1로 설정하고 count++로 숫자를 증
	var count = 1;
	
	// 현재 로그인 되어있는 회원의 아이디
	var m_id = "${loginVo.m_id}";
	
	// 회원이 탑승신청한 운전자 아이디
	var driverId = "${driverId}";
	
	// 현재 페이지의 정보를 가져옵니다.
	var page = "${pagingDto.page}";
	console.log("page:" + page);	
	
	// 운전자가 탑승자를 승인했는지 여부
	var approveState = "${approveState}";
	
	// 운전자 리스트를 얻어낼 url을 설정
	// page는 현재 설정한 페이지
	var url_list = "/board/driverList?page=" + page;
	
	// 현재 로그인된 회원의 주소를 얻어낼 url을 설정
	// m_id는 현재 로그인 되어있는 아이디
	var url_member = "/board/member?m_id=" + m_id;
	
	// 탑승신청을 했는지 여부를 확인할 url을 설정
	// m_id는 현재 로그인 되어있는 아이디
	var url_isApplication = "/board/isApplicaiton?m_id=" + m_id;
	
	var mapContainer = document.getElementById('map') // 지도를 표시할 div
	
    mapOption = {
        center: new kakao.maps.LatLng(35.535009319843475, 129.31084069895888), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
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
	
	// 비동기 방식으로 운전자 리스트를 가져옵니다.
	$.get(url_list, function(rData) {
		// 가져온 데이터 this를 that변수에 저장(다른곳에서 사용하기 위함)
		
		
		// 가져온 데이터를 데이터의 길이만큼 반복
		$.each(rData, function() {
			var that = this;
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(this.DRIVER_DEPART_LOCATION, function(result, status) {
			
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
		            content: "<div style='width:150px;text-align:center;padding:2px 0;'>" + that.M_NAME + "</div>"
		        });
		        infowindow.open(map, marker);
	
		    } // if (status === kakao.maps.services.Status.OK)
		    	
		}); // geocoder.addressSearch(this.m_address, function(result, status){})
				
		// 차량 최대 탑승인원 및 현재 차량 탑승인원 얻어낼 url을 설정
		// 파라미터로 현재 반복중인 운전자의 아이디를 넘겨줍니다.
		var url_count = "/board/count?m_id=" + that.M_ID;
		
		// 비동기 방식으로 운전자차량의 최대 탑승인원 및 현재 탑승인원을 얻어옵니다. 
		$.get(url_count, function(rData_count) {
			var maxCount = rData_count.maxCount; // 차량 최대 탑승인원
			var currentCount = rData_count.currentCount; // 차량 현재 탑승인원
			var tr = $("#tblDriverClone  tr").clone(); // 테이블 복사
			
			// td들을 찾아서 순서대로 값을 넣습니다. 
			var tds = tr.find("td"); 
			tds.eq(0).text(count++); // 숫자 증가
			tds.eq(0).attr("data-driver_seq", that.DRIVER_SEQ); // 운전자 번호
			tds.eq(1).text(that.M_NAME); // 운전자 이름
			tds.eq(2).text(that.DRIVER_DEPART_LOCATION); // 운전자 출발 위치
			tds.eq(3).text(that.DRIVER_DEPART_TIME); // 운전자 출발 시간
			tds.eq(4).text(currentCount + " / " + maxCount); // 최대 탑승인원 / 현재 탑승인원 설정
			
			// 현재 로그인 된 회원아이디(m_id)와 운전자의 아이디(that.M_ID)를 비교해 같을 경우 테이블에서 제거
			console.log("m_id:" + m_id);
			console.log("that.M_ID:" + that.M_ID);
			console.log("driverId:" + driverId);
			
			if(m_id == that.M_ID) {
				tr.attr("style", "color:#ff8c00; font-weight: bold;");
				tds.eq(5).text("신청 불가"); // 신청상태를 신청 불가로 변경
				tds.eq(5).attr("style", "color: red; font-weight: bold;"); // 신청상태 텍스트 빨간색 및 굵게 변경
				tds.eq(6).children().text("탑승제한"); // 탑승신청 버튼을 탑승제한으로 변경
				tds.eq(6).children().attr("class", "btn btn-danger btn-sm btnBoard disabled"); // 탑승신청 버튼을 빨간색으로 바꾸고 클릭할 수 없게 변경
				tds.eq(6).children().removeAttr("data-toggle"); // 기존에 가지고 있던 data-toggle속성 제거
				tds.eq(6).children().attr("href", "#"); // url제거
			}
			 
			// 차량의 최대 탑승인원과 현재 인원이 동일할 경우
			if(currentCount == maxCount) {
				tds.eq(5).text("신청 불가"); // 신청상태를 신청 불가로 변경
				tds.eq(5).attr("style", "color: red; font-weight: bold;"); // 신청상태 텍스트 빨간색 및 굵게 변경
				tds.eq(6).children().text("탑승마감"); // 탑승신청 버튼을 탑승마감으로 변경
				tds.eq(6).children().attr("class", "btn btn-danger btn-sm btnBoard disabled"); // 탑승신청 버튼을 빨간색으로 바꾸고 클릭할 수 없게 변경
				tds.eq(6).children().removeAttr("data-toggle"); // 기존에 가지고 있던 data-toggle속성 제거
				tds.eq(6).children().attr("href", "#"); // url제거
			}
			
			var is_refuse = "false"
			// 반복문을 돌면서 회원이 탑승신청한 운전자와 가지고 오는 운전자가 같으면 승인 대기상태로 신청상태를 변경
			if (driverId == that.M_ID) {
				switch (approveState) {
				case "W": // 승인대기
					var btnCancel= tds.eq(6).children();
					tds.eq(5).text("승인 대기"); // 신청상태를 승인 대기로 변경
					tds.eq(5).attr("style", "color:green; font-weight: bold;"); // 신청상태 텍스트 녹색 및 굵게 변경
					btnCancel.text("탑승취소"); // 탑승신청 버튼을 탑승취소로 변경
					btnCancel.attr("class", "btn btn-outline-warning btn-sm btnBoard"); // 탑승신청 버튼을 노란색으로 바꿈
					
					// 기존에 있던 role, data-toggle속성 제거
					btnCancel.removeAttr("role");
					btnCancel.removeAttr("data-toggle");
					
					// 회원이 탑승취소버튼을 클릭할 경우 보내질 url을 설정
					// 현재 로그인되어있는 회원의 아이디, 클릭한 행의 운전자 번호 및 아이디를 파라미터로 넘겨줍니다.
					btnCancel.attr("href", "/board/cancelBoarding?m_id=" + "${loginVo.m_id}" + "&driver_seq=" + that.DRIVER_SEQ + "&driver_id=" + that.M_ID + "&is_refuse=" + is_refuse);
					break;
				case "Y": // 승인
					var btnCancel= tds.eq(6).children();
					tds.eq(5).text("승인"); // 신청상태를 승인 대기로 변경
					tds.eq(5).attr("style", "color:blue; font-weight: bold;"); // 신청상태 텍스트 파랑 및 굵게 변경
					btnCancel.text("탑승취소"); // 탑승신청 버튼을 탑승취소로 변경
					btnCancel.attr("class", "btn btn-outline-success btn-sm btnBoard"); // 탑승신청 버튼을 파란색으로 바꿈
					
					// 기존에 있던 role, data-toggle속성 제거
					btnCancel.removeAttr("role");
					btnCancel.removeAttr("data-toggle");
					
					// 회원이 탑승취소버튼을 클릭할 경우 보내질 url을 설정
					// 현재 로그인되어있는 회원의 아이디, 클릭한 행의 운전자 번호 및 아이디를 파라미터로 넘겨줍니다.
					btnCancel.attr("href", "/board/cancelBoarding?m_id=" + "${loginVo.m_id}" + "&driver_seq=" + that.DRIVER_SEQ + "&driver_id=" + that.M_ID + "&is_refuse=" + is_refuse);
					break;
				case "C": // 승인거부
					var btnCancel= tds.eq(6).children();
					tds.eq(5).text("승인 거부"); // 신청상태를 승인 대기로 변경
					tds.eq(5).attr("style", "color:red; font-weight: bold;"); // 신청상태 텍스트 빨강 및 굵게 변경
					btnCancel.text("탑승취소"); // 탑승신청 버튼을 탑승취소로 변경
					btnCancel.attr("class", "btn btn-outline-warning btn-sm btnBoard"); // 탑승신청 버튼을 빨간색으로 바꿈
					
					// 기존에 있던 role, data-toggle속성 제거
					btnCancel.removeAttr("role");
					btnCancel.removeAttr("data-toggle");
					is_refuse = "true";
					// 회원이 탑승취소버튼을 클릭할 경우 보내질 url을 설정
					// 현재 로그인되어있는 회원의 아이디, 클릭한 행의 운전자 번호 및 아이디를 파라미터로 넘겨줍니다.
					btnCancel.attr("href", "/board/cancelBoarding?m_id=" + "${loginVo.m_id}" + "&driver_seq=" + that.DRIVER_SEQ + "&driver_id=" + that.M_ID + "&is_refuse=" + is_refuse);
					break;
				}
			}
			
			// 운전자의 아이디를 td에 data-m_id속성을 이용해 값을 넣어줍니다.
			tds.find(".btnBoard").attr("data-m_id", that.M_ID);
			$("#tblDriver tbody").append(tr); // tr테이블을 'tblDriver tbody' 테이블 뒤에 붙입니다.
			
		}); // $.get(url_count, function(rData_count) {})
		
		}); // $.each(rData, function() {})
		
	}); // $.get(url, function(rData) {})
	
	// 비동기로 로그인된 회원 주소를 가져옵니다.
	$.get(url_member, function(rData) {
		
		// 탑승 위치에 가지고온 데이터를 입력
		$("#boardLoct").val(rData);
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(rData, function(result, status) {
		
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
		        var myMarker = new kakao.maps.Marker({
		            map: map,
		            position: coords,
		            image : markerImage
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var rvbmInfowindow = new kakao.maps.InfoWindow({
		            content: "<div style='width:150px;text-align:center;padding:2px 0;'>내 위치</div>"
		        });
		        rvbmInfowindow.open(map, myMarker);
	
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        setTimeout(function(){ map.relayout();  map.setCenter(coords), map.setLevel(5);}, 200); 
		        
		    } // if (status === kakao.maps.services.Status.OK)
		    
		  	// 지도를 클릭시 발생할 함수
		    clickMap(map, rvbmInfowindow, myMarker);
		    
		}); // geocoder.addressSearch(this.m_address, function(result, status){})
		
	}); // $.get(url_member, function(rData) {})
	
	// 지도 클릭 시 실행하는 함수
	function clickMap(map, rvbmInfowindow, myMarker) {
		// 지도 클릭 시 발생하는 이벤트
	    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	    	
	    	// 기존에 클릭되어 있던 인포윈도우 삭제
	    	rvbmInfowindow.close();
	    	
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng;
		    
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    myMarker.setPosition(latlng);
		    
		 	// 인포윈도우로 장소에 대한 설명을 표시합니다
	        var currentInfowindow = new kakao.maps.InfoWindow({
	            content: "<div style='width:150px;text-align:center;padding:2px 0;'>내 위치</div>"
	        });
	        
		 	// 현재 인포윈도우를 다른곳에 저장
	        rvbmInfowindow = currentInfowindow;
		 	// 현재 인포윈도우를 클릭한 위치에 표시
	        currentInfowindow.open(map, myMarker);
	        
	        // 지도에 클릭할때 마다 탑승위치 텍스트가 변경
	        searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	            if (status === kakao.maps.services.Status.OK) {
	            	// 주소를 도로명 주소로 가져옵니다.
	            	$("#boardLoct").val(result[0].road_address.address_name);
	            }   
	        }); // searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {})
	        
		});	// kakao.maps.event.addListener(map, 'click', function(mouseEvent) {})
		
	} // function clickMap(map, rvbmInfowindow, myMarker) {} )
	
	// 지도 클릭시 클릭할때 마다 인포윈도우 위치 변경할 함수
	function searchDetailAddrFromCoords(coords, callback) {
        geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
    }
	
	// 모달창에서 지도 밑 상세정보를 표시할 함수
	function showModalMap(drvName, gender, drvDepartLocation, drvDept, drvDepartTime, mBoardLoct, driver_comment) {
		 
		 /* 
		 console.log("driverName:" + driverName);
		 console.log("driverAddr:" + driverAddr);
		 console.log("driverDept:" + driverDept);
		  */
		  
		  // 모달창에서 운전자 및 탑승자의 정보를 보여줄 내용을 설정
		  $("#driverName").text(drvName);
		  $("#gender").text(gender);
		  $("#driverDept").text(drvDept);
		  $("#driverLoct").text(drvDepartLocation);
		  $("#driverStartTime").text(drvDepartTime);
		  $("#mBoardLoct").text(mBoardLoct);
		  var defaultComment = "없음";
		  if (driver_comment == null) {
			  $("#driverComment").text(defaultComment);
		  } else {
			  $("#driverComment").text(driver_comment);
		  }
		 
		  
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
			modalGeocoder.addressSearch(drvDepartLocation, function(result, status) {
		
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
		
			        var modalCoords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var modalMarker = new kakao.maps.Marker({
			        	map: modalMap,
			            position: modalCoords
			        });
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var modalInfowindow = new kakao.maps.InfoWindow({
			            content: "<div style='width:150px; text-align:center;'>" + drvName + "</div>"
			        });
			        
			        modalInfowindow.open(modalMap, modalMarker);
			        modalMap.setDraggable(false); // 지도 이동 금지
			        modalMap.setZoomable(false); // 지도 확대및축소 금지
			        
			        // 지도를 0.1초 뒤에 로딩시킵니다.
			        setTimeout(function(){ modalMap.relayout();  modalMap.setCenter(modalCoords), modalMap.setLevel(4);}, 100); 
			        
			    } // if (status === kakao.maps.services.Status.OK)
			    	
			}); // modalGeocoder.addressSearch(driverAddr, function(result, status) {})
			
	 } // function showModalMap(driverName, driverAddr, driverDept) {})
	 
	 // 탑승 신청버튼 클릭
	 $("#tblDriver").on("click", ".btnBoard", function() {
		 
		 // 탑승신청할 url설정
		 var url = "/board/driverInfo";
		 var driver_seq = $(this).parent().parent().find(".classTd").attr("data-driver_seq"); // 운전자의 번호를 가져옵니다.
		 var state = $(this).parent().parent().parent().find(".boardingState"); // 탑승상태를 가져옵니다.
		 
		 // 클릭한 운전자의 번호를 보내 운전자 아이디를 얻어올 url 설정 
		 /* 
		 var url_getDriverId = "/board/getDriverId?driver_seq=" + driver_seq;
		 $.post(url_getDriverId, function(rData) {
			 $("#driver_id").val(rData);
		 });
		  */
		 
		 $("#driver_seq").val(driver_seq);
		  
		 
		 // 버튼 클릭시 행에 있는 멤버 아이디 및 로그인된 회원의 회사 정보
		 var m_id = $(this).attr("data-m_id");
		 var m_company = "${loginVo.m_company}";
		 $("#driver_id").val(m_id);
		 
		 // 보낼 데이터 설정
		 var sData = {
				 "m_id" : m_id,
				 "m_company" : m_company
		 };
		 
		 // 지도에서 클릭한 위치 값
		 var mBoardLoct = $("#boardLoct").val();
		 
		 // 비동기형식으로 데이터 보내고 받아와서 showModalMap함수 실행
		 $.get(url, sData, function(rData) {
			 var gender = rData.GENDER;
			 if (gender = "M") {
				 gender = "남자";
			 } else {
				 gender = "여자";
			 }
			 // 모달 창에서 상세한 정보를 보여줄 함수
			 showModalMap(rData.M_NAME, gender, rData.DRIVER_DEPART_LOCATION, rData.M_DEPT, rData.DRIVER_DEPART_TIME, mBoardLoct, rData.DRIVER_COMMENT);
		 }); // $.get(url, sData, function(rData) {})
		 
	 }); //  $("#tblDriver").on("click", ".btnBoard", function() {})
	 
	 // 모달창에서 탑승신청 버튼 클릭
	 $("#btnApply").click(function() {
		 // 회원이 탑승신청을 두번이상 클릭했는지 유무 확인후 
		 $.get(url_isApplication, function(rData) {
			 // 두번 이상 클릭 했으면 알림창 표시
			 if (rData == "true") {
				 alert("탑승신청은 한번만 가능합니다.");
			 } else if (rData == "false") {
				 $("#frmPassenger").submit(); // 아니면 url로 보냅니다.
			 }
		 }); // $.get(url_isApplication, function(rData) {})
	 }); // $("#btnApply").click(function() {})
	 
	 // 페이지를 클릭할 경우 실행됩니다.
	 $(".page-link").click(function(e) {
		 e.preventDefault();
		 var href = $(this).attr("href");
		 var frmRsrvPaging = $("#frmRsrvPaging");
		 frmRsrvPaging.find("input").attr("value", href);
		 frmRsrvPaging.submit();
	 });
	 
	 // 회원 회사에 따른 회사 로고 설정
	 var company = "${loginVo.m_company}";
	 switch(company) {
	 case "DOOSAN" :
		 $("#companyImg").attr("src", "/resources/images/companyLogo/DOOSAN.png");
		 break;
	 case "HANWHA" :
		 $("#companyImg").attr("src", "/resources/images/companyLogo/HANWHA.png");
		 break;
	 case "HYUNDAI" :
		 $("#companyImg").attr("src", "/resources/images/companyLogo/HYUNDAI.png");
		 break;
	 case "KAKAO" :
		 $("#companyImg").attr("src", "/resources/images/companyLogo/KAKAO.jpg");
		 break;
	 case "KT" :
		 $("#companyImg").attr("src", "/resources/images/companyLogo/KT.png");
		 break;
	 case "LG" :
		 $("#companyImg").attr("src", "/resources/images/companyLogo/LG.png");
		 break;
	 case "NAVER" :
		 $("#companyImg").attr("src", "/resources/images/companyLogo/NAVER.png");
		 break;
	 case "NEXEN" :
		 $("#companyImg").attr("src", "/resources/images/companyLogo/NEXEN.jpg");
		 break;
	 case "SAMSUNG":
		 $("#companyImg").attr("src", "/resources/images/companyLogo/SAMSUNG.png");
		 break;
	 case "SK":
		 $("#companyImg").attr("src", "/resources/images/companyLogo/SK.png");
		 break;
	 }
	 
}); // $(document).ready(function() {})
</script>
<%@ include file="/WEB-INF/views/include/frmRsrvPaging.jsp"%>
<!-- 카카오 지도 -->
<div class="row" style="margin-top: 20px; margin-bottom: 20px;">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div id="map" style="height: 700px; width: 100%;"></div>
	</div>
	<div class="col-md-2"></div>
</div>
<!-- // 카카오 지도 -->

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

<!-- 탑승자 -->
<div class="row" style="margin-bottom: 20px;">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<form id="frmPassenger" role="form" method="post" action="/board/addPasgInfo">
		<input hidden="true" name="m_id" value="${loginVo.m_id}">
		<input hidden="true" id="driver_seq" name="driver_seq" value="">
		<input hidden="true" id="driver_id" name="driver_id" value="">
			<div style="text-align: center;">
				<img id="companyImg" alt="companyImg.jpg" src="/resources/images/companyLogo/DEFAULTLOGO.png" width="500px;" height="200px;">
			</div>
			<div class="form-group" style="margin-bottom: 10px;">
				<h3 style="text-align: center;">운전자 위치를 확인하시고, 탑승할 위치<span style="color: blue;">(도로명 주소기준)</span>를 클릭해주세요.</h3>
				<h4 style="text-align: center;">회원님이 현재 운전자로 등록되어 있는 경우 <span style="color:#ff8c00; font-weight: bold;">주황색</span>으로 표시됩니다.</h4>
					<label for="startLocation"> 탑승 위치 </label> 
				<input type="text" class="form-control" id="boardLoct" name="boardLoct" readonly="readonly"/>
			</div>
			<div class="form-group" style="margin-bottom: 10px;">
				<label for="boardTime"> 탑승 시간 </label> 
				<select name="boardHour">
					<option value="06:">06
					<option value="07:">07
					<option value="08:">08
				</select>
				<select name="boardMin">
					<option value="00">00
					<option value="10">10
					<option value="20">20
					<option value="30">30
					<option value="40">40
					<option value="50">50
				</select>
			</div>
		</form>
	</div>
	<div class="col-md-2"></div>
</div>
<!-- // 탑승자 -->
<h3 style="text-align: center; margin-top: 50px;">운전자 리스트</h3>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="row">
		<div class="col-md-12">
			<table id="tblDriverClone" class="table" style="display: none;">
				<tr>
					<td class="classTd"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="boardingState" style="color: black; font-weight: bold;">미신청</td>
					<td class="tds"><a href="#modal-container-899906" role="button" class="btn btn-outline-info btn-sm btnBoard" data-toggle="modal">탑승신청</a></td>
				</tr>
			</table>
			<table class="table" id="tblDriver" class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>운전자</th>
						<th>출발위치</th>
						<th>출발시간</th>
						<th>탑승인원</th>
						<th>신청상태</th>
						<th>탑승신청</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
		<nav>
			<ul class="pagination justify-content-center">
				<c:if test="${pagingDto.startPage != 1}">
					<li class="page-item">
						<a class="page-link" href="${pagingDto.startPage - 1}">이전</a>
					</li>
				</c:if>
				<c:forEach var="v" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
					<li 
						<c:choose>
							<c:when test="${pagingDto.page == v}">
								class="page-item active"
							</c:when>
							<c:otherwise>
								class="page-item"
							</c:otherwise>
						</c:choose>>
						<a class="page-link" href="${v}">${v}</a>
					</li>				
				</c:forEach>
				<c:if test="${pagingDto.endPage != pagingDto.totalPage}">
					<li class="page-item">
						<a class="page-link" href="${pagingDto.endPage + 1}">다음</a>
					</li>
				</c:if>
			</ul>
		</nav>
	</div>
	<div class="col-md-2"></div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>