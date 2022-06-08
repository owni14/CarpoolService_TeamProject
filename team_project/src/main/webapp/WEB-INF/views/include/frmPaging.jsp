<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="frmPaging">
	<input type="hidden" name="page" id="page" value="${pagingDto.page}">
	<input type="hidden" name="perPage" id="perPage" value="${pagingDto.perPage}">
	<input type="hidden" name="searchType" id="searchType" value="${pagingDto.searchType}">
	<input type="hidden" name="keyword" id="keyword" value="${pagingDto.keyword}">
</form>