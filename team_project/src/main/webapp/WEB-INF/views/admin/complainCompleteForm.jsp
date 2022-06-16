<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>
<%@ include file="/WEB-INF/views/include_admin/alert.jsp" %>
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
		var frm=$("#frmComplainPaging");
		$(".trList").click(function(){
			$(this).next("tr").toggle();
			$(this).next("tr").siblings(".trCollapse").hide();
	
		});
		
		$(".trCollapse").click(function(){
			$(this).toggle();
		});	
		
		$("#sel_adminCode").change(function(){
			var admin_code=$(this).val();
			var complain_classification=$("#sel_classify").val();
			
			if(complain_classification == null){
				frm.find("[name=searchType]").val("ac");
			}
			else{
				frm.find("[name=searchType]").val("cls");
			}
			
			frm.find("[name=admin_code]").val(admin_code);
			frm.find("[name=complain_classification]").val(complain_classification);
			frm.submit();
			
		});
		
		$("#sel_classify").change(function(){
			var complain_classification=$(this).val();
			var admin_code=$("#sel_adminCode").val();
			if(admin_code ==null){
				frm.find("[name=searchType]").val("clsnoac");
			}
			else{
				frm.find("[name=searchType]").val("cls");
			}
			frm.find("[name=admin_code]").val(admin_code);
			frm.find("[name=complain_classification]").val(complain_classification);
			frm.submit();
		});
		
		$("#btnSearch").click(function(){
			var admin_code=$("#sel_adminCode").val();
			var complain_classification=$("#sel_classify").val();
			var keyword=$("#txtkeyword").val();
			if(admin_code ==null && complain_classification==null){
				frm.find("[name=searchType]").val("i");
			}
			else if(admin_code !=null && complain_classification ==null ){
				frm.find("[name=searchType]").val("iac");
			}
			else if(admin_code ==null && complain_classification !=null ){
				frm.find("[name=searchType]").val("icls");
			}
			else{
				frm.find("[name=searchType]").val("all");
			}
			frm.find("[name=admin_code]").val(admin_code);
			frm.find("[name=complain_classification]").val(complain_classification);
			frm.find("[name=keyword]").val(keyword);
			frm.submit();
			
		});
	
	});
</script>
<%@ include file="/WEB-INF/views/include_admin/frmComplainPaging.jsp" %>
<!-- start inner header -->
	<div class="pcoded-inner-content">
		<!-- Main-body start -->
		<div class="main-body">
			<div class="page-wrapper">
				<!-- Page-header start -->
				<div class="page-header card">
					<div class="row align-items-end">
						<div class="col-lg-5">
							<div class="page-header-title">
								<i class="ti-face-smile" style="background-color:#54BD54"></i>
								<div class="d-inline">
									<h4>고객 문의 답변 완료 리스트</h4>
									<span></span>
								</div>
							</div>
						<select style="height:26px; float: right; align-items: flex-end; margin: 50px 0px 0px" id="sel_adminCode">
			<option selected="selected" value="" disabled="disabled">관리자 코드를 선택하여 주세요</option>
					<c:forEach items="${amdinCodes}" var="adminVo">
					<option value="${adminVo}"
					<c:if test="${adminVo eq param.admin_code}">
					selected
					</c:if>
					>관리자 코드 &nbsp;${adminVo}</option>
					</c:forEach>
					</select>
						</div>
						<!-- 새로 추가된 div -->
							<div class="col-lg-4" style="text-align: right;">
					
					<select style="height:26px; float:left;" id="sel_classify">
			<option selected="selected" value="" disabled="disabled">=====문의 구분=====</option>
					
					<option value="시스템이용문의"
					<c:if test="${'시스템이용문의' eq param.complain_classification}">
					selected
					</c:if>
					>시스템이용문의</option>
					<option value="포인트"
					<c:if test="${'포인트' eq param.complain_classification}">
					selected
					</c:if>
					>포인트</option>
					<option value="이벤트"
					<c:if test="${'이벤트' eq param.complain_classification}">
					selected
					</c:if>
					>이벤트</option>
					<option value="불편"
					<c:if test="${'불편' eq param.complain_classification}">
					selected
					</c:if>
					>불편</option>
					<option value="기타"
					<c:if test="${'기타' eq param.complain_classification}">
					selected
					</c:if>
					>기타</option>
					
					</select>
					&nbsp;
					<input type="text" id="txtkeyword" style="background-color:white; border-color: #d2d2d2; margin-right:50px" placeholder="유저아이디로 검색합니다">
					<button type="button" id="btnSearch" style="background-color:white; border-color: #d2d2d2;">검색&nbsp;&nbsp;<i class="icofont icofont-search-alt-2"></i></button>
						</div>
					<div class="col-lg-3">
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