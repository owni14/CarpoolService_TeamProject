<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
.inputLogin {
	width:600px;
	height:60px;
	font-size:30px;
	margin-bottom: 20px;
}
</style>
<script>
$(document).ready(function() {
	
});
</script>
<div class="row">
	<div class="col-md-12">
		<div class="row" style="display: flex; height:1000px; text-align: center;">
			<div class="col-md-4"></div>
			<div class="col-md-4" style="margin-top: 100px;">
			
				<form role="form" method="post" action="/member/loginRun">
					<span style="font-size: 50px;">통합회원 로그인</span>
					<div class="m_id">
						<input style="margin-top: 40px; width:100%" type="email" class="form-control inputLogin" value="${cookie.saveid.value}" name="m_id" id="m_id" placeholder="아이디(이메일)을 입력해주세요"/>
					</div>
					<div class="m_pw">
						<input style="width:100%" type="password" class="form-control inputLogin" name="m_pw" id="m_pw" placeholder="비밀번호를 입력해주세요"/>
					</div>
					<div class="checkbox" style="text-align:left;">
						<label>
							<input type="checkbox" name="saveId" 
								<c:if test="${not empty cookie.saveid.value}">
									checked
								</c:if>
							/> 아이디 저장
						</label>
					</div> 
					<button type="submit" class="btn btn-primary" style="width:100%; height:50px; margin-top: 20px; margin-bottom: 20px;">로그인	</button>
					<div>
						<a class="a_style" href="#">아이디 찾기</a> |
						<a class="a_style" href="#">비밀번호 찾기</a> |
						<a class="a_style" href="/member/joinForm">회원가입</a>
					</div>
				</form>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>