<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>

<script>

	var event_seq="${eventVo.event_seq}";

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
	
	submitPost = function() {
		  oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
		  let content = document.getElementById("editorTxt").value;
			var event_name=document.getElementById("eventName").value;
			var event_enddate=document.getElementById("select_date").value;
			
			if(event_enddate =="" || event_enddate.length <=0){
				alert('날짜를 골라주세요');
				return;
			}
			var event_startdate="${eventVo.event_startdate}";
		  if(content == '') {
		    alert("내용을 입력해주세요.");
		    oEditors.getById["editorTxt"].exec("FOCUS");
		    return
		  } else {
		    let post = {
		    	"event_seq": event_seq,
      			 "event_content": content,
      			 "event_name":event_name,
      			 "event_enddate":event_enddate,
      			 "event_is_finish":"${eventVo.event_is_finish}",
      			 "event_max_count":"${eventVo.event_max_count}",
      			 "event_point":"${eventVo.event_point}"
        			}
		    $.ajax({
				 url: "/admin/event_update"
				 	,type:"post"
			          , data: post
			          , success: function(data) {
			            console.log(data);
			            alert('저장하였습니다.');
			            
			          }
			          , error: function(jqXHR, textStatus, errorThrown) {
			            console.log(jqXHR)
			            alert('오류가 발생하였습니다.')
			          }
			});	
			
		  }
	
	}
	
	
	$(document).ready(function() {
		smartEditor();
		
	
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
		
	});
</script>


<!-- start Event inner header -->
<!-- <img src="/admin/displayImage?filename=//192.168.0.232/ServerFolder/editor/multiupload/202206071905312924d017-f20d-49e2-bfda-8a2184b78627.jpg"> -->
<div class="pcoded-inner-content">
	<!-- Main-body start -->
	<div class="main-body">
		<div class="page-wrapper">
			<!-- Page-header start -->
			<div class="page-header card">
				이벤트 시작일: ${eventVo.event_startdate} <select id="select_date"
					style="margin-top: 15px; margin-bottom: 1.5px">

					<option selected="selected" disabled="disabled" value="">이벤트
						끝날 날짜를 입력해주세요</option>
					<c:forEach begin="1" end="30" var="i" step="1">
						<option></option>
					</c:forEach>
				</select>
				<div class="row align-items-end">
					<div class="col-lg-8">
						<input type="text"
							class="form-control form-control-bold form-control-lg"
							id="eventName" value="${eventVo.event_name}">

						<div class="page-header-title">


							<div class="d-inline"></div>
						</div>
					</div>
					<div class="col-lg-4">

						<div class="page-header-breadcrumb">
							<ul class="breadcrumb-title">
								<li class="breadcrumb-item"><a href="/admin/home"><i
										class="icofont icofont-home"></i></a></li>
								<li class="breadcrumb-item"><a href="#!">이벤트</a></li>
								<li class="breadcrumb-item"><a href="#!">이벤트 목록</a></li>
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
							<button class="btn btn-success" id="btnUpdateEvent" type="button"
								onclick="submitPost();">
								<i class="icofont icofont-check-circled"></i>작성완료
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