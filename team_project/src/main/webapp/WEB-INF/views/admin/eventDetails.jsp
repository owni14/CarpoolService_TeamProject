<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>
<script>
	var event_seq="${eventVo.event_seq}";

	let oEditors = [];

	smartEditor = function() {
		console.log("Naver SmartEditor")
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

		  if(content == '') {
		    alert("내용을 입력해주세요.");
		    oEditors.getById["editorTxt"].exec("FOCUS");
		    return
		  } else {
		    console.log(content);
		    let post = {
		    	"event_seq": event_seq,
      			 "event_content": content,
      			 "event_name":"${eventVo.event_name}",
      			 "event_enddate":"${eventVo.event_enddate}",
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
		
	})
</script>

<!-- start Event inner header -->

<div class="pcoded-inner-content">
	<!-- Main-body start -->
	<div class="main-body">
		<div class="page-wrapper">
			<!-- Page-header start -->
			<div class="page-header card">
				<div class="row align-items-end">
					<div class="col-lg-8">
						<div class="page-header-title">
							<i class="icofont icofont-gift bg-c-blue"></i>
							<div class="d-inline">
								<h4>${eventVo.event_name}</h4>

							</div>
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
							<button class="btn btn-success" id="btnUpdateEvent"type="button"
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