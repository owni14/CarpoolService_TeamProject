<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file = "/WEB-INF/views/message/message_sidebar_header.jsp" %>
<style> 

table.send_table td {
height:40px;
overflow: hidden;
table-layout: fixed;
}

#th_receiver {width: 20%;}
#th_content {width: 60%;}
#th_senddate {width: 20%;}
</style>

<div class="border">
	<h3>보낸 쪽지함</h3>
	<table class="table send_table">
		<tr>
			<th >보낸사람</th>
			<th >내용</th>
			<th>받은날짜</th>
		</tr>
		<c:forEach items="${sendMessageList}" var="MessageVo">
		<tr>
			<td id="th_receiver"><span>${MessageVo.receiver_m_id}</span></td>
			<td id="th_content"><span>
			<c:choose>
			<c:when test="${MessageVo.content.length() >=30}">${MessageVo.content.substring(0,30)}...</c:when>
			<c:otherwise>
			${MessageVo.content}
			</c:otherwise>
			
			</c:choose></span></td>
			<td id="th_senddate"><span>${MessageVo.senddate}</span></td>
		</tr>
		</c:forEach>
	</table>
</div>
<%@ include file = "/WEB-INF/views/message/message_sidebar_footer.jsp" %>
			
