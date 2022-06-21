<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4" style="margin-top: 100px; margin-bottom: 245px;">
		<form role="form" action="/member/findId_run" method="post">
			<div class="form-group" style="text-align: center;">	
				<span style="font-size: 50px;">아이디 찾기</span>
			</div>
			<div class="form-group">
				<label for="m_name"> 이름 </label> 
				<input type="text" class="form-control" name="m_name" placeholder="ex)홍길동" required="required"/>
			</div>
			<div class="form-group">
				<label for="m_company">회사</label>
					<select class="form-control btn" name="m_company" required="required">
						<option>회사를 선택해주세요</option>
						<option value="SAMSUNG">삼성</option>
						<option value="HYUNDAI">현대</option>
						<option value="SKI">SK</option>
						<option value="KAKAO">KAKAO</option>
						<option value="NAVER">NAVER</option>
						<option value="NEXEN">NEXEN</option>
						<option value="LG">LG</option>
						<option value="KT">KT</option>
						<option value="HANWHA">한화</option>
						<option value="DOOSAN">두산</option>
					</select>
				</div>
			<div class="form-group">
				<label for="m_cellphone"> 전화번호 </label> 
				<input type="text" class="form-control" name="m_cellphone" placeholder="ex)01012345678" required="required"/>
			</div>
			<a href="/member/loginForm"><i class="fa fa-arrow-left" aria-hidden="true"> 로그인 페이지로 이동</i></a>
			<div style="text-align: center;">
			<button type="submit" class="btn btn-primary form-control">확인</button>
			</div>
		</form>
	</div>
	<div class="col-md-4"></div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>