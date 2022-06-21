<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#black_m_id { display: inline-block; width: 300px;}
#black_content { margin-top: 20px; height: 100px;}
</style>
<script>
$(document).ready(function() {
	$(".black").click(function(e) {
		console.log("들어옴");
		e.preventDefault();
		$("#black_modal").modal('show');
		var driver_id = $(this).attr("data-driver_id");
		$("#black_m_id").val(driver_id.trim());
	});
	
	$(".modalClose").click(function() {
		$("#black_modal").modal('hide');
	});
});

</script>
<!-- 신고 modal start -->
<form action="/customer/black_report" method="post">
 	<input type="hidden" name="m_id" value="${loginVo.m_id}">
	<div class="col-md-12">
		<div class="modal fade" id="black_modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">
							신고 하기
						</h5>
					</div>
					<div class="modal-body">
						신고 대상자 : <input type="text" class="form-control" id="black_m_id" name="black_m_id" readonly>
						<textarea id="black_content" class="form-control" name="black_content" placeholder="신고내용을 입력해 주세요" required></textarea>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger">신고하기</button>
						<button type="button" class="btn btn-secondary modalClose" data-dismiss="modal">
							닫기
						</button>
					
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
	<!-- modal end -->