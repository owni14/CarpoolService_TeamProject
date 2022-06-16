<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
var alertChk="${authorized}";
if(alertChk=="false"){
	alert('권한이 없는 접근입니다 코드를 확인하여 주세요');
}
</script>
<% session.removeAttribute("authorized");%>