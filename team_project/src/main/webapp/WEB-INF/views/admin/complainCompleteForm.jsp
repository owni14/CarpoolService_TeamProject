<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>
<style>
.trList:hover{
cursor: pointer;
}
.trCollapse:hover{
cursor: pointer;
}
</style>
<script>
var updateAnswer="${result}";
	if(updateAnswer =="true"){
		alert("답변 전송성공");
	}
	else if(updateAnswer =="false"){
		alert("답변 전송에 문제가 발생했습니다");
	}
	$(document).ready(function () {
		
		$(".trList").click(function(){
			$(this).next("tr").toggle();
			$(this).next("tr").siblings(".trCollapse").hide();
	
		});
		
		$(".trCollapse").click(function(){
			$(this).toggle();
		});	
	
		
	
	});
</script>

<!-- start inner header -->
	<div class="pcoded-inner-content">
		<!-- Main-body start -->
		<div class="main-body">
			<div class="page-wrapper">
				<!-- Page-header start -->
				<div class="page-header card">
					<div class="row align-items-end">
						<div class="col-lg-8">
							<div class="page-header-title">
								<i class="ti-face-smile" style="background-color:#54BD54"></i>
								<div class="d-inline">
									<h4>고객 문의 답변 완료 리스트</h4>
									<span></span>
								</div>
							</div>
						</div>
					<div class="col-lg-4">
						<div class="page-header-breadcrumb">
							<ul class="breadcrumb-title">
								<li class="breadcrumb-item">
								<a href="/admin/home"><i class="icofont icofont-home"></i></a>
								</li>
								<li class="breadcrumb-item">고객문의 답변 완료</li>
								
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- Page-header end -->
			
			<!-- Page-body start -->
			<div class="page-body">
				<!-- Basic table card start -->
				<div class="card">
					<div class="card-header">
						<i class="icofont  icofont-listing-number"></i>
						<h5>답변 완료 리스트</h5>
					</div>
					<div class="card-block table-border-style">
						<div class="table-responsive"> 
						<div class="row">
						
							<!-- 처리 결과 Y table start -->
						
							<div class="col-md-12 col-xl-12" style="margin-left: 20px; padding-right : 40px">
								<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr style="background-color:rgba(54, 162, 235, 0.2)">
											<th>#</th>
											<th style="width:10%">
											분류
											
											</th>
											<th style="width:10%">관리자 코드(아이디)</th>
											<th style="width:10%">유저ID</th>
											<th style="width:50%">문의내용</th>
											<th style="width:10%">처리 결과</th>
											<th style="width:5%">등록 일자</th>
											<th style="width:5%">답변 달기</th>
											
										</tr>
									</thead>
									<tbody>
							
									<c:forEach items="${complainList}" var="complainVo" varStatus="i">	 
									
									<tr class="trList" style="font-size:15px">
									
											<th scope="row" data-seq="${complainVo.complain_seq}">${i.count}</th>
											<th scope="row" data-classification="${complainVo.complain_classification}">${complainVo.complain_classification}	
											</th>
											<td data-admin_code="${complainVo.admin_code }">${complainVo.admin_code }</td>
											<td data-mid="${complainVo.m_id}">${complainVo.m_id }</td>
											
											
											
											<td class="tdContent" data-content="${complainVo.complain_content}">
											<c:choose>
											<c:when test="${complainVo.complain_content.length() >20 }">
											${complainVo.complain_content.substring(0,20)}...</c:when>
											<c:otherwise>${complainVo.complain_content }</c:otherwise>
											 
											</c:choose> 
											</td>
											
											
											<td style="font-size: 40px;color: red"><i class="icofont icofont-check"></i></td>
											<td>${complainVo.complain_regdate}</td>
											<td><button class="btn btn-info">
											상세 내용 조회
											</button></td>
											
										
								</tr>
								<tr class="trCollapse" style="display:none" data-display="N">
								<td colspan="8">
											<div>
											  <div class="Answer">
											  <h5></h5>
											  <br><br>
											  <h4 style="text-align: center;">유저(${complainVo.m_id})글에 대한 답변 &nbsp;&nbsp; 등록일&nbsp;:&nbsp;${complainVo.complain_answer_date}</h4>
											  
											   <textarea class="form-control tareContent"
											   	rows="30" style="font-size: 20px"
											   readonly="readonly"
											   >답변 : &nbsp;${complainVo.complain_answer }</textarea>
											   <br>
											  
											   <br>
											   <button class="btn btn-info btnAnswer" type="button">닫기</button>
											  </div>
												</div>
								</td>
								</tr>
	 							</c:forEach>		
									</tbody>
								</table>
							
							
							</div>
							</div>
						
				
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
				<!-- Basic table card end -->
						
						
					</div>
					
				
				
			</div>
		</div>
	</div>
</div>
</div>
</div>
</div>
<!-- end inner header -->

 
<%@ include file="/WEB-INF/views/include_admin/footer.jsp"%>