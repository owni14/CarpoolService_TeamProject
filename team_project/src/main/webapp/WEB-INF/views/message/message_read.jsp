<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- message_read modal start -->
<div class="col-md-12">
	<div class="modal fade" id="message_read" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">
						쪽지 내용
					</h5>
				</div>
				<div class="modal-body">
					<div class="row" style="text-align:center;">
						<div class="col-lg-4 modal_text">보낸 사람 :</div>
						<div class="col-lg-7 modal_input"><input type="text" class="form-control" id="sender" readonly></div>
					</div>
					<textarea id="message_content" class="form-control" readonly></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" id="reMessage" class="btn btn-success">답장하기</button>
					<a id="readClose" class="btn btn-secondary"> 닫기</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- message_read modal end -->