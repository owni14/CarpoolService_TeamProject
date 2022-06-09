<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Latest compiled and minified CSS -->
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
.form-group {
	margin-bottom:20px;
}

</style>
<script>
$(document).ready(function() {
	
});
$("#select").selectpicker();
</script>
<div class="row">
	<div class="col-md-12">
		<div class="row" style="display: flex; height:1000px;">
			<div class="col-md-4"></div>
			<div class="col-md-4" style="margin-top: 50px;">
				<form role="form" action="join_run" method="post">
					<div class="form-group" style="text-align: center;">
						<span style="font-size: 50px;">회원 가입</span>
					</div>
					<div class="form-group">
						<label for="m_id">아이디</label>
						<input type="email" class="form-control" id="m_id" name="m_id" placeholder="ex) hong@email.com" required/>
					</div>
					<div class="form-group">
						<label for="m_pw">비밀번호</label>
						<input type="password" class="form-control" id="m_pw" name="m_pw" placeholder="비밀번호를 입력해 주세요" required/>
					</div>
					<div class="form-group">
						<label for="m_name">이름</label>
						<input type="text" class="form-control" id="m_name" name="m_name" placeholder="ex) 홍길동" required/>
					</div>
					<div class="form-group">
						<label for="m_cellphone">휴대폰 번호</label>
						<input type="text" class="form-control" id="m_cellphone" name="m_cellphone" placeholder="ex) 01012345678" required/>
					</div>
					<div class="form-group">
						<label style="margin-right: 15px;">성별</label>
						<input type="radio" name="gender" style="margin-right:10px;" value="M" checked><label style="margin-right: 15px;">남자</label>
						<input type="radio" name="gender" style="margin-right:10px;" value="W">여자
					</div>
					
					<div class="form-group">
						<label for="m_company">회사</label>
						<select class="form-control btn" name="m_company">
							<option>회사를 선택해주세요</option>
							<option value="samsung">삼성</option>
							<option value="hyundai">현대</option>
							<option value="sk">SK</option>
							<option value="kakao">KAKAO</option>
							<option value="naver">NAVER</option>
							<option value="nexen">NEXEN</option>
							<option value="lg">LG</option>
							<option value="kt">KT</option>
							<option value="hanwha">한화</option>
							<option value="doosan">두산</option>
						</select>
					</div>
					<div class="form-group">
						<label for="m_dept">부서</label>
						<input type="text" class="form-control" id="m_dept" name="m_dept" placeholder="ex) 회계부, 홍보부, 생산부"/>
					</div>
					<div class="form-group">
						<label for="m_address">주소</label>
						<input type="text" class="form-control" id="m_address" name="m_address" placeholder="도로명 주소 ex) 울산광역시 북구 아진로75" required/>
					</div>
					<div class="form-group">
						<label style="margin-right: 15px;">흡연 여부</label>
						<input type="radio" name="m_is_smoke" style="margin-right:10px;" value="Y"><label style="margin-right: 15px;">흡연자</label>
						<input type="radio" name="m_is_smoke" style="margin-right:10px;" value="N" checked>비흡연자
					</div>
					<button type="submit" class="btn btn-primary" style="width:100%; height:50px; margin-top:20px;">
						회원 가입
					</button>
				</form>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>