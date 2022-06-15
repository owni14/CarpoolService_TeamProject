<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="frmRsrvPaging" action="/board/reservation" method="get">
	<input type="hidden" name="page" value="${pagingDto.page}">
</form>
