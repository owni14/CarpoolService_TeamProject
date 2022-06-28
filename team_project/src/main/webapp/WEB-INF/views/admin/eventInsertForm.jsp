<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>
<%@ include file="/WEB-INF/views/include_admin/alert.jsp" %>
<script src="/resources/adminJs/extCheck.js"></script>
<script>
	let oEditors = [];

	smartEditor = function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "editorTxt",
			sSkinURI : "/resources/static/smarteditor/SmartEditor2Skin.html",
			fCreator : "createSEditor2",
			htParams :{
		
			}
		});
	}

	
	 function getData(){
		 oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
		  let content = document.getElementById("editorTxt").value;
		  return content;
	 }
	
	
	$(document).ready(function() {
		smartEditor();
		var valPoint;
	
		//날짜계산
		var item=$("#select_date").find("option:gt(0)");
		$.each(item,function(index){	
			var date = new Date();
			date.setDate(date.getDate()+index);
			var strDay=date.getDate();
			var strMonth=(date.getMonth()+1);
			var strYear=date.getFullYear();
			if(strMonth <10){
				strMonth = "0"+strMonth;
			}
			if(strDay <10){
				strDay = "0"+strDay;
			}
			var fnldate=strYear+"-"+strMonth+"-"+strDay;
			item.eq(index).val(fnldate);
			item.eq(index).text(fnldate);
			
		});
		$("#btnEventInsert").click(function(){
			var content=getData();
			if(content ==null || content ==""){
				content="빈칸";
			}
			console.log("c");
			var event_enddate=$("#select_date").val();
			if(event_enddate ==null){
				alert('날짜를 골라주세요');
				return;
			}
			if($("#eventName").val()==""){
				alert('제목을 적어주세요');
				return;
			}
			var form=$("#frmEvent");
			var event_max_count=$("#select_event_count").val();
			var pc_code=$("#select_point_code").val();

			if(event_max_count ==null){
				event_max_count="${Math.ceil(memberCount*0.05) }";
			}
			if(pc_code ==null){
				pc_code="1002";
				valPoint="500포인트";
			}
			var thumbnail_txt=form.find("[name=file]").val();
			console.log("thumbnail_txt",thumbnail_txt);
			//확장자체크
			if(thumbnail_txt !=null && thumbnail_txt !="" ){
				var isExtension=isExt(thumbnail_txt);
				if(! isExtension){
					alert('지원하지 않는 확장자 입니다 파일을 확인해주세요');
					return;
				}
			}
			// 확장자체크 끝
			event_max_count=parseInt(event_max_count);
			form.find("[name=event_name]").val($("#eventName").val());
			form.find("[name=event_content]").val(content);
			form.find("[name=event_enddate]").val(event_enddate);
			form.find("[name=event_max_count]").val(event_max_count);
			form.find("[name=pc_code]").val(pc_code);
		
		
			var isSubmit=window.confirm("입력하신 내용 끝나는 날짜 :"+event_enddate+"\n 당첨 인원수 :"+event_max_count
					+"명\n포인트 획득 :"+valPoint+"\n맞습니까?");
			if(isSubmit){
				form.submit();
			}
			
			
		});
		//포인트 값 저장해놓기 
		$("#select_point_code").change(function(){
			valPoint=$("#select_point_code option:selected").text();
		});
	});
</script>
<c:set var="today" value="<%=new Date(new Date().getTime()) %>"/>
<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="todayStr"/>

<!-- start Event inner header -->
<!-- <img src="/admin/displayImage?filename=//192.168.0.232/ServerFolder/editor/multiupload/202206071905312924d017-f20d-49e2-bfda-8a2184b78627.jpg"> -->
<form id="frmEvent" method="post" action="/admin/eventInsertRun"
enctype="multipart/form-data">
썸네일 넣기<input type="file" class="form-control-file" id="file" name="file" />
<input type="hidden" name="event_name" >
<input type="hidden" name="event_content" >
<input type="hidden" name="event_enddate" >
<input type="hidden" name="event_max_count" >
<input type="hidden" name="pc_code" >
<input type="hidden" name="fileImg" >
</form>
<div class="pcoded-inner-content">
	<!-- Main-body start -->
	<div class="main-body">
		<div class="page-wrapper">
			<!-- Page-header start -->
			<div class="page-header card">
			<div class="page-header-title" style="margin-bottom: 15px;">
								<i class="icofont icofont-gift bg-c-blue"></i>
								<h2>이벤트 추가하기</h2>
								
							</div>
				이벤트 시작일: &nbsp; ${todayStr} 
				<div class="row align-items-end">
					<div class="col-lg-8">
						<input type="text"
							class="form-control form-control-bold form-control-lg"
							id="eventName" placeholder="이벤트 이름을 입력하세요">

						<div class="page-header-title">
						

							<div class="d-inline">
							<select id="select_date"
					style="margin-top: 15px; margin-bottom: 1.5px">
						
					<option selected="selected" disabled="disabled" value="">이벤트
						끝날 날짜를 입력해주세요</option>
					<c:forEach begin="1" end="30" var="i" step="1">
						<option></option>
					</c:forEach>
				</select>
				<select id="select_point_code"
					style="margin-top: 15px; margin-bottom: 1.5px">
						
					<option selected="selected" disabled="disabled" value="">이벤트 포인트 미선택시[500포인트]</option>
					<option value="1001">10포인트</option>
					<option value="1002">500포인트</option>
					<option value="1003">3000포인트</option>
				</select>
				
				<select id="select_event_count"
					style="margin-top: 15px; margin-bottom: 1.5px">
						
					<option selected="selected" disabled="disabled" value="">이벤트 최대 참석인원 미선택시 (${Math.ceil(memberCount*0.05) })명</option>
						<option value="${Math.ceil(memberCount*0.01) }">1프로(${Math.ceil(memberCount*0.01) })명</option>
						<option value="${Math.ceil(memberCount*0.03) }">3프로(${Math.ceil(memberCount*0.03) })명</option>
						<option value="${Math.ceil(memberCount*0.05) }">5프로(${Math.ceil(memberCount*0.05) })명</option>
						<option value="${Math.ceil(memberCount*0.1) }">10프로(${Math.ceil(memberCount*0.1) })명</option>
						<option value="${Math.ceil(memberCount*0.15) }">15프로(${Math.ceil(memberCount*0.15) })명</option>
					
				</select>
				
				</div>
						</div>
					</div>
					<div class="col-lg-4">

						<div class="page-header-breadcrumb">
							<ul class="breadcrumb-title">
								<li class="breadcrumb-item"><a href="/admin/home"><i
										class="icofont icofont-home"></i></a></li>
								<li class="breadcrumb-item">이벤트</li>
								<li class="breadcrumb-item"><a href="/admin/event">이벤트 목록</a></li>
							</ul>

						</div>
					</div>
				</div>
			</div>

			<!-- end Event inner header -->



			<!-- Page-body start -->
			<div class="page-body">
				<!-- Basic table card start -->
				<div class="card">
					<div class="card-header">
						<form action="#" method="post">
							<div id="smarteditor">
								<textarea name="editorTxt" id="editorTxt" rows="20"
									placeholder="내용을 입력해주세요" style="width: 100%">
									${eventVo.event_content}
									</textarea>
							</div>
							<button class="btn btn-success" id="btnEventInsert" 
							type="button">
								<i class="icofont icofont-check-circled"></i>입력완료
							</button>
						</form>

					</div>
				</div>
			</div>
			<!-- Basic table card end -->
		</div>
	</div>
</div>





<%@ include file="/WEB-INF/views/include_admin/footer.jsp"%>