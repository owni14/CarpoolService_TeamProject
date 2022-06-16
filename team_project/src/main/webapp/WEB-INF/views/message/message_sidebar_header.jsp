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

a:hover {color: blue; text-decoration:none !important }

.message_font:hover { color: blue; }

.message_font{
color: black;
font-size: 15px;
}

.bi-arrow-right-circle-fill {
color: gray;
float: right;
vertical-align: middel;
}
</style>


<div class="row" id="message_div">
<%@ include file = "/WEB-INF/views/message/message_form.jsp" %>
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
	
		<div class="row">
			<div class="col-md-3">
				
	            <a href="#" id="message_head"><h1>쪽지</h1></a>
	            
	            <ul id="MessageMenu">
	                <li>
	                    <a href="/message/recAdminMessagePage"><span class="message_font">받은 쪽지함<i class="bi bi-arrow-right-circle-fill"></i></span></a>
	                </li>
	                <li>
	                    <a href="/message/sendMessagePage"><span class="message_font">보낸 쪽지함<i class="bi bi-arrow-right-circle-fill"></i></span></a>
	                </li>
	                <li>
	                    <a href="#"><span class="message_font">보관함<i class="bi bi-arrow-right-circle-fill"></i></span></a>
	                </li>
	                <li>
	                    <a href="#"><span class="message_font">설정<i class="bi bi-arrow-right-circle-fill"></i></span></a>
	                </li>
	            </ul>
	            <a class="message_form" href="#"><span id="message_send"><i class="bi bi-pen"></i>쪽지보내기</span></a>
			</div>
		<div class="col-md-9">