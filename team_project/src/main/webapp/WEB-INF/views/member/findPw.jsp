<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4" style="margin-top: 100px; margin-bottom: 527px;">
		<form role="form" action="/member/foundPw" method="post">
			<div class="form-group" style="text-align: center;">
				<span style="font-size: 50px;">비밀번호 찾기</span>
			</div>
			<div class="form-group">
				<label for="m_name"> 아이디 </label> <input type="text"
					class="form-control" name="m_id" required="required" />
			</div>
			<div class="form-group">
				<label for="m_cellphone"> 전화번호 </label> <input type="text"
					class="form-control" name="m_cellphone" placeholder="ex)01012345678" required="required" />
			</div>
			<a href="/member/loginForm"><i class="fa fa-arrow-left" aria-hidden="true"> 로그인 페이지로 이동</i></a>
			<div style="text-align: center;">
			<button type="submit" class="btn btn-primary form-control">확인</button>
			</div>
		</form>
		<div class="col-md-4"></div>
	</div>
</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>