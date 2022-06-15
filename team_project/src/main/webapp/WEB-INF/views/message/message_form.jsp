<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 마이카풀에서도 필요하기 때문에 form을 따로 생성 -->

<style>

.modal_text {
	display : flex; justify-content : right; align-items : center;
}

.modal_input {
	diplay: flex; justify-content: left; margin-bottom: 10px;
}

#modal_content {
	height: 290px;
}

#receiver_m_id::placeholder {
	font-size: 14px;
}
</style>

<script>
$(document).ready(function() { 
	$(".message_form").click(function(e) {
		e.preventDefault();
		$("#message_form_modal").modal('show');
	});
	
	$("#modalClose").click(function() {
		$("#message_form_modal").modal('hide');
	});
});
</script>


<!-- modal start -->
<form action="/message/send" method="post">

<div class="col-md-12">
	<div class="modal fade" id="message_form_modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">
						쪽지 보내기
					</h5>
				</div>
				<div class="modal-body">
					<div class="row" style="text-align:center;">
						<div class="col-lg-4 modal_text">보내는 사람 :</div>
						<div class="col-lg-7 modal_input"><input type="text" class="form-control" id="sender_m_id" name="sender_m_id" readonly value="${loginVo.m_id}"></div>
					</div>
					<div class="row" style="text-align:center;">
						<div class="col-lg-4 modal_text">받는 사람 : </div>
						<div class="col-lg-7 modal_input">
							<input type="email" class="form-control" id="receiver_m_id" name="receiver_m_id" placeholder="아이디(이메일형식)을 입력해 주세요">
						</div>
					</div>
					<textarea id="modal_content" class="form-control" name="content" placeholder="쪽지 내용을 입력해 주세요"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" id="modalClose" class="btn btn-secondary" data-dismiss="modal">
						취소
					</button>
					<button type="submit" class="btn btn-success">보내기</button>
				</div>
			</div>
		</div>
	</div>
</div>
</form>
<!-- modal end -->