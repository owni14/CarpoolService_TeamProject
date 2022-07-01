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
margin-left: 5px;
}

.m_content_tr:hover {
	background-color: aliceblue;
	cursor: pointer;
}

</style>


<div class="row" id="message_div">
<%@ include file="/WEB-INF/views/message/message_form.jsp" %>

<%@ include file="/WEB-INF/views/message/message_read.jsp" %>

	<div class="col-md-2">
	</div>
	<div class="col-md-8">
	
		<div class="row">
			<div class="col-md-3">
				
	            <a href="#" id="message_head"><h1>쪽지</h1></a>
	            
	            <ul id="MessageMenu">
	                <li>
	                    <a class="a_messageMenu" href="/message/recAdminMessagePage"><span class="message_font">받은 쪽지함 <span class="ncount_message">${noneReadMCount}</span><i class="bi bi-arrow-right-circle-fill"></i></span></a>
	                </li>
	                <li>
	                    <a class="a_messageMenu" href="/message/sendMessagePage"><span class="message_font">보낸 쪽지함<i class="bi bi-arrow-right-circle-fill"></i></span></a>
	                </li>
	            </ul>
	            <a class="message_form" href="#"><span id="message_send"><i class="bi bi-pen"></i>쪽지보내기</span></a>
			</div>
		<div class="col-md-9">