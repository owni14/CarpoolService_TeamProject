<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>
<script>

</script>
<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		
	<div class="card project-task">
		<div class="card-header">
			<div class="card-header-left ">
				<h3>${eventVo.event_name}</h3>
			</div>
			<div class="card-header-right">
			</div>
		</div>
		<div class="card-block p-b-10">
			${eventVo.event_content}
		</div>
	</div>

		
		</div>
		<div class="col-md-2">
		</div>
	</div>

<%@ include file="/WEB-INF/views/include_admin/footer.jsp"%>