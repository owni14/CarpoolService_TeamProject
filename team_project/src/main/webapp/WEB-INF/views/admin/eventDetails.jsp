<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>
<script>


	let oEditors = []

	smartEditor = function() {
		console.log("Naver SmartEditor")
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "editorTxt",
			sSkinURI : "/resources/static/smarteditor/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
		})
	}
	
	submitPost = function() {
		  oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", [])
		  let content = document.getElementById("editorTxt").value

		  if(content == '') {
		    alert("내용을 입력해주세요.")
		    oEditors.getById["editorTxt"].exec("FOCUS")
		    return
		  } else {
		    console.log(content)
		  }
		}
	$(document).ready(function() {
		smartEditor()
	})
</script>
<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		
		 <!-- Page-header start -->
                                    <div class="page-header card">
                                        <div class="row align-items-end">
                                            <div class="col-lg-8">
                                                <div class="page-header-title">
                                                    <i class="icofont icofont-table bg-c-blue"></i>
                                                    <div class="d-inline">
                                                        <h4>Bootstrap Basic Tables</h4>
                                                        <span>lorem ipsum dolor sit amet, consectetur adipisicing elit</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="page-header-breadcrumb">
                                                   <ul class="breadcrumb-title">
                                                    <li class="breadcrumb-item">
                                                        <a href="index.html">
                                                            <i class="icofont icofont-home"></i>
                                                        </a>
                                                    </li>
                                                    <li class="breadcrumb-item"><a href="#!">Bootstrap Table</a>
                                                    </li>
                                                    <li class="breadcrumb-item"><a href="#!">Basic Table</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Page-header end -->
		
		
	<div class="page-header card">
		<div class="card-header">
			<div class="card-header-left ">
				<h3>${eventVo.event_name}</h3>
			</div>
			<div class="card-header-right">
			</div>
		</div>
		<div class="card-block p-b-10">
		<form action="#" method="post">
      <div id="smarteditor">
        <textarea name="editorTxt" id="editorTxt" 
                  rows="20" cols="100" 
                  placeholder="내용을 입력해주세요"
                  style="width: 80%"></textarea>
      </div>
      <button class="btn btn-success" type="button" onclick="submitPost();">
      <i class="icofont icofont-check-circled"></i>작성완료</button>
    </form>
			${eventVo.event_content}
		</div>
	</div>

		
		</div>
		<div class="col-md-2">
		</div>
	</div>

<%@ include file="/WEB-INF/views/include_admin/footer.jsp"%>