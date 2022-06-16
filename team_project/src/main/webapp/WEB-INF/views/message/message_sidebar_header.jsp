<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
#message_div { margin: 100px;}

#MessageMenu { 
list-style-type: none;
padding-left: 0;
width: 120px;
margin-bottom: 50px;
}

#message_head { margin: 100px;}

#message_send {color: black; font-size: 20px;}

.bi-pen { margin-right : 10px;}

h3 { margin: 25px;}
a {color: black;}
a:hover {text-decoration:none !important }
a_messageMenu:hover {}
.message_font:hover { color: blue; }

.message_font{

font-size: 15px;
}

.bi-arrow-right-circle-fill {
color: gray;
float: right;
vertical-align: middel;
}

.m_content_tr:hover {
	background-color: aliceblue;
	cursor: pointer;
}

/* message start */
#reMessage {display: none;}
#sender {background-color: white;}
#message_content {background-color: white;}

#th_receiver {width: 20%;}
#th_content {width: 60%;}
#th_senddate {width: 20%;}
/* message end */
</style>


<div class="row" id="message_div">
<%@ include file = "/WEB-INF/views/message/message_form.jsp" %>

	<!-- message_read modal start -->
	<div class="col-md-12">
		<div class="modal fade" id="message_read" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">
							쪽지 내용
						</h5>
					</div>
					<div class="modal-body">
						<div class="row" style="text-align:center;">
							<div class="col-lg-4 modal_text">보낸 사람 :</div>
							<div class="col-lg-7 modal_input"><input type="text" class="form-control" id="sender" readonly></div>
						</div>
						<textarea id="message_content" class="form-control" readonly></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" id="reMessage" class="btn btn-success">답장하기</button>
						<button type="button" id="readClose" class="btn btn-secondary" data-dismiss="modal">
							닫기
						</button>
					
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- message_read modal end -->

	<div class="col-md-2">
	</div>
	<div class="col-md-8">
	
		<div class="row">
			<div class="col-md-3">
				
	            <a href="#" id="message_head"><h1>쪽지</h1></a>
	            
	            <ul id="MessageMenu">
	                <li>
	                    <a class="a_messageMenu" href="/message/recAdminMessagePage"><span class="message_font">받은 쪽지함<i class="bi bi-arrow-right-circle-fill"></i></span></a>
	                </li>
	                <li>
	                    <a class="a_messageMenu" href="/message/sendMessagePage"><span class="message_font">보낸 쪽지함<i class="bi bi-arrow-right-circle-fill"></i></span></a>
	                </li>
	                <li>
	                    <a class="a_messageMenu" href="#"><span class="message_font">보관함<i class="bi bi-arrow-right-circle-fill"></i></span></a>
	                </li>
	                <li>
	                    <a class="a_messageMenu" href="#"><span class="message_font">설정<i class="bi bi-arrow-right-circle-fill"></i></span></a>
	                </li>
	            </ul>
	            <a class="message_form" href="#"><span id="message_send"><i class="bi bi-pen"></i>쪽지보내기</span></a>
			</div>
		<div class="col-md-9">