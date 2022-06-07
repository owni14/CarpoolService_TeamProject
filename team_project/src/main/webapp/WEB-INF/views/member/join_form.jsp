<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
.form-group {
	margin-bottom:20px;
}

</style>
<script>
$(document).ready(function() {
	
});
$('.selectpicker').selectpicker({
    style: 'btn-info',
    size: 4
});
</script>
<div class="row">
	<div class="col-md-12">
		<div class="row" style="display: flex; height:1000px;">
			<div class="col-md-4"></div>
			<div class="col-md-4" style="margin-top: 50px;">
				<form role="form">
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
						<input type="radio" name="gender" style="margin-right:10px;" checked><label style="margin-right: 15px;">남자</label>
						<input type="radio" name="gender" style="margin-right:10px;">여자
					</div>
					
					<div class="form-group">
						<label for="m_company">회사</label>
						<select class="selectpicker btn">
							<option>삼성</option>
							<option>현대</option>
							<option>SK</option>
							<option>KAKAO</option>
							<option>NAVER</option>
							<option>NEXEN</option>
							<option>LG</option>
							<option>KT</option>
							<option>한전</option>
							<option>두산</option>
						</select>
					</div>
					<div class="form-group">
						<label for="m_dept">부서</label>
						<input type="text" class="form-control" id="m_dept" name="m_dept" placeholder="ex) 회계부, 홍보부, 생산부" required/>
					</div>
					<div class="form-group">
						<label for="m_address">주소</label>
						<input type="text" class="form-control" id="m_dept" name="m_dept" placeholder="도로명 주소 ex) 울산광역시 북구 아진로75" required/>
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