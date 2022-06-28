<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>
<%@ include file="/WEB-INF/views/include_admin/alert.jsp" %>
<style>
.tdContents:hover {cursor: pointer;}
tbody > tr:hover {background-color: aliceblue;}  
#trNoHover:hover {background-color: white;}
#spanClose:hover {cursor: pointer;}
</style>
<script>
	$(document).ready(function () {
		var frmPaging = $("#frmPaging"); 
		$("#perPageSelector").change(function () {
			var perPageValue = $(this).val();
			var perPage = frmPaging.find("input[name=perPage]");
			perPage.val(perPageValue);
			frmPaging.attr("action","/admin/member_management");
			frmPaging.attr("method","get");
			frmPaging.submit();
		});
		
		$("a.page-link").click(function (e) {
			e.preventDefault();
			var pageValue = $(this).attr("href");
			var page = frmPaging.find("input[name=page]");
			page.val(pageValue);
			frmPaging.attr("action","/admin/checkSendToMeMessage");
			frmPaging.attr("method","get");
			frmPaging.submit();
		});
		
		$("#btnSearch").click(function () {
			var searchTypeValue = $("#searchTypeSelector").val();
			var keywordValue = $("#adminKeyword").val();
			
			var searchType = frmPaging.find("input[name=searchType]");
			searchType.val(searchTypeValue);
			var keyword = frmPaging.find("input[name=keyword]");
			keyword.val(keywordValue);
			frmPaging.find("input[name=page]").val(1);
			frmPaging.attr("action","/admin/checkSendToMeMessage");
			frmPaging.attr("method","get");
			frmPaging.submit();
		});
		
		$.get("/admin/getMemberUpdateList",function (rData) {
			console.log(rData);
			$.each(rData, function () {
				var tr = $("#table_clone tr").clone();
				var tds = tr.find("td");
				tds.eq(0).text(this.m_id);
				tds.eq(1).text(this.update_reason);
				tds.eq(2).text(this.admin_code);
				tds.eq(3).text(this.update_date);
				$("#table_memberUpdate_list tbody").append(tr);
			});
		}); 
		
// 		var trs = $("#memberTable tbody").find("tr");
// 		$(trs).click(function () {
// 			$("#modal-113407").trigger("click");
// 			var m_id = $(this).attr("data-mid");
// 			var m_address = $(this).attr("data-mAddress");
// 			var m_cellphone = $(this).attr("data-mCellphone");
// 			var m_is_drop = $(this).attr("data-mIsDrop");
// 			$("#tdMid").text(m_id);
// 			$("#inputAddress").val(m_address);
// 			$("#inputCellphone").val(m_cellphone);
// 			$("#inputMisDrop").val(m_is_drop);
			
// 		});

		
		$("#btnAdminscode").click(function () {
			$("#modal-113407").trigger("click");
			
			
		});
		
		$("#btnModifyMember").click(function () {
			var m_id = $("#tdMid").text();
			var m_address = $("#inputAddress").val();
			var m_cellphone = $("#inputCellphone").val();
			var m_is_drop = $("#inputMisDrop").val();
			var update_reason = $("#inputReason").val();
			var admin_code = "${sessionScope.admin_code}";
// 			console.log(m_id);
// 			console.log(m_address);
// 			console.log(m_cellphone);
// 			console.log(m_is_drop);
// 			console.log(update_reason);
// 			console.log(admin_code);
			var url = "/admin/memberInfoUpdate";
			var sData = {
				"m_id" : m_id,
				"m_address" : m_address,
				"m_cellphone" : m_cellphone,
				"m_is_drop" : m_is_drop,
				"update_reason" : update_reason,
				"admin_code" : admin_code
			};
			$.post(url, sData, function (rData) {
				console.log(rData);
				if (rData == "true") {
					frmPaging.attr("action","/admin/member_management");
					frmPaging.attr("method","get");
					frmPaging.submit();
				}
			});
		});
		
		$("#chkSendToMe").click(function () {
			console.log("click");
			var admin_code = "${sessionScope.admin_code}";
			if($("#checkBoxSendToMe").is(":checked") == false) {
				console.log("체크 된 상태");
				$("#inputSendToMe").val(admin_code);
			} else {
				console.log("체크 해제 된 상태");
				$("#inputSendToMe").val("");
			}
		});
		
		$("#taMessage").keyup(function (e) {
			var content = $(this).val();
			var contentLength = content.length;
// 			console.log("글자 : " + content);
// 			console.log("글자수 : " + contentLength);
			if (contentLength < 500) {
				$("#nowLength").text(contentLength);
				$("#nowLength").css("color","green");
			} else if (contentLength = 500) {
				$("#nowLength").text(contentLength);
				$("#nowLength").css("color","red");
			}
		});
		
		$("#btnSendMessageToMe").click(function () {
			$("#chkSendToMe").trigger("click");
			
		});
		
		$("#btnSendMessage").click(function () {
			$("#frmMessage").submit();
		});
		
		$("#selectAdminCode").change(function () {
			var selectAdmin = $(this).val();
			$("#taAdminCodeOne").val(selectAdmin);
		});
		
		$("#btnPlus").click(function () {
			var selectedAdmin = $("#taAdminCodeOne").val();
			console.log("selectedAdmin : " + selectedAdmin);
			
			var result = true;
			var adminsTest = $("#adminPlus").val();
			var adminsTestSplit = adminsTest.split(",");
			console.log(adminsTestSplit);
			for (var i=0; i < adminsTestSplit.length - 1; i++) {
				console.log(adminsTestSplit[i]);
				if (selectedAdmin == adminsTestSplit[i]) {
					result = false;
				}
			}	
			console.log("result : " + result);
			if (result == true) {
				$("#adminPlus").append(selectedAdmin + ",");
				$("#taAdminCodes").append(selectedAdmin + ",");
				var admins = $("#taAdminCodes").val();
				console.log("admins : " + admins);
				var adminSplit = admins.split(",");
				console.log("count : " + adminSplit.length);
				if (adminSplit.length < 6) {
					$("#spanCount").text(adminSplit.length -1).css("color","green");
				} else if (adminSplit.length == 6) {
					$("#spanCount").text(adminSplit.length -1).css("color","red");
				}
			}
		});
		
		$("#btnMinus").click(function () {
			console.log("click");
			var admins = $("#taAdminCodes").val();
			console.log("admins : " + admins);
			var lastCommaIndex = admins.lastIndexOf(",");
			var commaIndex = admins.lastIndexOf(",",lastCommaIndex - 1);
			var newAdmins = admins.substring(0, commaIndex + 1);
			console.log("newAdmins : " + newAdmins);
			$("#adminPlus").text("");
			$("#taAdminCodes").text("");
			$("#adminPlus").append(newAdmins);
			$("#taAdminCodes").append(newAdmins);
			
		});
		
		$("#btnAdmins").click(function () {
			var admins = $("#taAdminCodes").val();
			var commaIndex = admins.lastIndexOf(",");
			$("#inputSendToMe").val(admins.substring(0,commaIndex));
		});
		$("#btnCancel").click(function () {
			$("#adminPlus").text("");
			$("#taAdminCodes").text("");
			$("#spanCount").text(0).css("color","black");
			
		});
		
		$(".tdContents").click(function () {
			var content = $(this).attr("data-content");
			$("#divMessage").show("slow");
			$("#spanMessage").text("");
			$("#spanMessage").text(content);
		}); 
		
		$("#spanClose").click(function () {
			$("#divMessage").hide("slow");
		});
		
	});
</script>
<%@ include file="/WEB-INF/views/include/frmPaging.jsp" %>
<!-- modal start -->
<div class="row" >
	<div class="col-md-12">
		<a id="modal-113407" href="#modal-container-113407" role="button"
			class="btn" data-toggle="modal" style="display:none">Launch demo modal</a>

		<div class="modal fade" id="modal-container-113407" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">쪽지 주소록</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<!-- 주소록 만들기  start -->
						<div class="row">
							<div class="col-md-5">
								<label><b>전체 관리자 코드</b></label>
								<div>
								<select class="form-control" id="selectAdminCode">
									<c:forEach items="${adminList}" var="admin">
									<option value="${admin}">${admin}</option>
									</c:forEach>
								</select>
								</div>
								<textarea id="taAdminCodeOne" style="width: 100%; height: 110px; margin-top: 2px; text-align: center; background-color: white" disabled="disabled">1001</textarea>
							</div>
							<div class="col-md-2" style="align-self: center;">
								<button id="btnPlus"  class="btn btn-inverse btn-sm" ><i style="margin: auto;" class="icofont icofont-curved-right" ></i></button>
								<button id="btnMinus" class="btn btn-inverse btn-sm" style="margin-top:2px; text-align: center"><i style="margin: auto;" class="icofont icofont-curved-left"></i></button>
							</div>
							
							
							<div class="col-md-5">
							<div class="row" style=" margin-left: 4px">
								<label><b>받는 사람 </b><span id="spanCount">0</span>/ 5</label>
							</div>
								<textarea style="display:none" id="adminPlus"></textarea>
								<textarea id="taAdminCodes" style="width: 100%; height: 150px; background-color: white; text-align: center" disabled="disabled"></textarea>
							</div>
						</div>
						<!-- 주소록 만들기  start -->
					</div>
					<div class="modal-footer">

						<button id="btnAdmins" type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
						<button id="btnCancel" type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
					</div>
				</div>

			</div>

		</div>

	</div>
</div>
<!-- modal end -->
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
								 <button id="btnSendMessage" class="btn hor-grd btn-grd-inverse">쪽지쓰기</button>
								 <button id="btnSendMessageToMe" class="btn hor-grd btn-grd-inverse">내게쓰기</button>
								 <!-- dropdown start -->
												<button class="btn dropdown-toggle" type="button" style="background-color:white; color:black"
													id="dropdownMenuButton3" data-toggle="dropdown">
													쪽지 보관함</button>
												<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
													<a class="dropdown-item" href="/admin/checkMyMessage#tag1">받은쪽지함</a> 
													<a class="dropdown-item" href="/admin/checkMySendMessage#tag2">보낸쪽지함</a> 
													<a class="dropdown-item" href="/admin/checkSendToMeMessage#tag3">내게쓴쪽지함</a> 
												</div> 
								<!-- dropdown end -->
						</div>
						</div>
					<div class="col-lg-4">
						<div class="page-header-breadcrumb">
							<ul class="breadcrumb-title">
								<li class="breadcrumb-item">
								<a href="/admin/home"><i class="icofont icofont-home"></i></a>
								</li>
								<li class="breadcrumb-item"><a href="#!">관리자 페이지</a></li>
								<li class="breadcrumb-item"><a href="#!">내게쓴쪽지함</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- Page-header end -->
			<!-- Page-body start -->
			<div class="page-body">
			<!-- 쪽지 보내기 card start -->
			<div class="row">
			<div class="col-md-12 col-xl-5">
				<div class="card">
				<div class="card-header">
				<form id="frmMessage" action="/message/sendMessageBetweenAdmins" method="post">
				<input type="hidden" name="sender_admin_code" value="${admin_code}">
				<table style="margin-left:20px; border-top=1px; border-collapse: collapse;">
					<tr style=" height: 40px; border-bottom: 1px;">
						<td colspan="5" style="background-color:#34495E;"><h5 style="color:white; margin-left:10px">새 쪽지</h5></td>
					</tr>
					<tr id="trNoHover">
						<td><h5>받는 사람</h5></td>
						<td style="padding-left:15px">
						<div class="checkbox-fade fade-in-primary d-block" style="margin-right:0px">
							<label class="check-task d-block">
							<input type="checkbox" value="" id="checkBoxSendToMe">
						    <span class="cr">
						       <i class="cr-icon icofont icofont-ui-check txt-default chkApprove" id="chkSendToMe"></i>
						    </span>
						    </label>
						</div>
					    </td>
					    <td><h5>내게쓰기</h5></td>
					    <td><input id="inputSendToMe" name="receiver_admin_code" type="text" class="form-control" style="height:25px; width:220px" placeholder="관리자 코드를 입력해 주세요"></td>
				    	<td><button id="btnAdminscode" type="button" class="btn btn-inverse btn-round"
				    		style="background-color: white; font-size: 12px; color: black; text-align: center">주소록</button></td>
				    </tr>
			    </table>
<!-- 			    <textarea id="taMessage" name="content" style="width:403px; height: 300px; margin-left:20px" maxlength="500"></textarea> -->
			    <textarea id="taMessage" name="content" style="width:480px; height: 300px; margin-left:20px; margin-top: 1px" maxlength="500"></textarea>
			    </form>
			    <div style="margin-left:20px">
			    	<span id="nowLength" style="display:inline;">0</span><span style="display:inline">/500자</span>
				</div>
				</div>
				</div>
			</div>
			<!-- 쪽지 보내기 card end -->
			<!-- 쪽지 읽기 card start -->
			<div  class="col-md-12 col-xl-3" >
				<div class="card">
					<div id="divMessage" class="card-header" 
						style="
						background-image:url(/resources/images/managerimage/smartPhone.jpg); background-repeat:no-repeat;
						background-size: 90% 100%;
						background-position: center center;
						height:456px;
						background-color:white; display: none; ">
						<div style="display: inline-block; position: absolute; top: 40px; width: 50%; left: 90px">
						<h5>내용</h5>
						<span id="spanClose" style="float: right; margin-right: 5px"><b>x</b></span>
<!-- 						<div style="position: absolute; top: 50px;"> -->
<!-- 						<a id="aSender"><span id="spanSender"></span></a> -->
<!-- 						</div> -->
						<div style="position: absolute; top: 80px;">
						<span id="spanMessage"></span>
						</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			<!-- 쪽지 읽기 card end -->
			<!-- Basic table card start -->
			<div class="card">
					<div class="card-header">
						<h5>내게쓴쪽지함</h5>
						<h5>
							<select id="searchTypeSelector" name="searchTypeSelector" style="height:25px">
								<option value="c"
									<c:if test="${pagingDto.searchType == 'c'}">
										selected
									</c:if>
								>내용</option>
							</select>
						
							<input type="text" id="adminKeyword" name="adminKeyword" style="height:25px">
							<button id="btnSearch" style="background-color:white; border-color: #d2d2d2">검색&nbsp;&nbsp;<i class="icofont icofont-search-alt-2"></i></button>
						</h5>
					</div>
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<a id="tag3"></a>
							<table class="table" id="memberTable">
								<thead>
									<tr>
										<th>#</th>
										<th>내용</th>
										<th>날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="messageVo" items="${sendToMeMessageList}" varStatus="status">
									<tr>	
										<th scope="row">${status.count}</th>
										<td class="tdContents" data-content="${messageVo.content}">
										<c:choose>
											<c:when test="${messageVo.content.length() < 30}">
												${messageVo.content}
											</c:when>
											<c:otherwise>
												${messageVo.content.substring(0,30)} ......
											</c:otherwise>
										</c:choose>
										</td>
										<td>${messageVo.senddate}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				
				<!-- start pagination -->
				<div class="row" style="padding-bottom: 25px; padding-top: 50px">
					<div class="col-md-12">
						<nav>
							<ul class="pagination justify-content-center" >
								<c:if test="${pagingDto.startPage != 1}">
								<li class="page-item">
									<a class="page-link" href="${pagingDto.startPage - 1}">이전</a>
								</li>
								</c:if>
								<c:forEach var="v" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
								<li 
									<c:choose>
										<c:when test="${v == param.page}">
											class="page-item active"
										</c:when>
										<c:otherwise>
											class="page-item"
										</c:otherwise>
									</c:choose>
								>
									<a class="page-link" href="${v}">${v}</a>
								</li>
								</c:forEach>
								<c:if test="${pagingDto.endPage != pagingDto.totalPage}">
								<li class="page-item">
									<a class="page-link" href="${pagingDto.endPage + 1}">다음</a>
								</li>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>
				
				
				</div>
				<!-- Basic table card end -->
				
			</div>
			<!-- Page-body end -->
		</div>
	</div>
</div>
<!-- end inner header -->
				
<%@ include file="/WEB-INF/views/include_admin/footer.jsp"%>