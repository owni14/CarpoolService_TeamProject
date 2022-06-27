<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잘못들어 오셨습니다</title>


<script>
var size = {
		  width: window.innerWidth || document.body.clientWidth,
		  height: window.innerHeight || document.body.clientHeight 
		};
var w=parseInt(window.innerWidth)-20;    // 화면(모니터 해상도)의 너비
var exw=screen.availWidth  // 모니터 화면의 작업 표시줄을 제외한 너비

var h=parseInt(window.innerHeight)-21;    // 화면(모니터 해상도)의 높이
var exh=screen.availHeight // 모니터 화면의 작업 표시줄을 제외한 높이

console.log("w",w);
console.log("exw",exw);
console.log("h",h);
console.log("exh",exh);

document.write("<img src='/resources/images/error/error404.jpg' width='"+w +"' height='"+h+"'>");
</script>
</head>
<body>

</body>
</html>