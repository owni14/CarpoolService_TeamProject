<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>

<script>
//참가인원의 10퍼센트 당첨인원
var transactionResult="${transactionResult}";
if(transactionResult =="true"){
	alert("작업성공");
}
else if(transactionResult=="false"){
	alert("작업실패");
}
var listSize="${participationList.size()}";
var winnerCount=parseInt(listSize/10);
var numS=new Array();

var winnerNums=new Array(); 

for(var v=0; v<listSize; v++){
	numS[v]=v+1;
}
for(var v=0; v<winnerCount; v++){
	
	var randomNum=(parseInt(Math.random()*listSize))+1;
	console.log("for randomNum",randomNum);
	if(numS[randomNum]==""){
		console.log("if 진입",v);
		while(true){
			randomNum=(parseInt(Math.random()*listSize))+1;
			if(! (numS[randomNum]=="") ){
				console.log("while randomNum",randomNum);
				break;
			}
		}
	}
	winnerNums[v]=randomNum;
	numS[randomNum]="";

}
console.log("numS[v]" ,numS);
console.log("winnerCount" ,winnerCount);
console.log("winnerNums" ,winnerNums);
	$(document).ready(function() {
		var frmEventWinner=$("#frmEventWinner");
		$("#select_liveEvent_seq").change(function(){
			
// 			console.log($(this).val());
			var event_seq=$(this).val();
			var form=$("#frmEvent");
			form.find("[name=event_seq]").val(event_seq);
			form.attr("action","/admin/event_participation?event_seq="+event_seq);
			form.submit();
		});
		

	$("#select_endEvent_seq").change(function() {
				var event_seq = $(this).val();
				var form = $("#frmEvent");
				form.find("[name=event_seq]").val(event_seq);
				form.attr("action","/admin/event_end_participation?event_seq="
				+ event_seq);
				form.submit();
		});
	$("#buttonWinner").click(function(){
		var strSpan="당첨 번호 :";
		var strfrmNames;
		var strfrmValues;
		for(var v=0; v<winnerNums.length; v++){
			var winnerName;
			$(".tdCount").each(function(index){
				var tdIndex=$(this).attr("data-count");
				if(tdIndex == winnerNums[v] ){
					winnerName=$(".tdNames").eq(winnerNums[v]-1).attr("data-name");
					console.log("winnerName",winnerName);
				}
			});
			strfrmNames="memberList";
			strfrmValues=winnerName;
			frmEventWinner.find("input[name=event_seq]").after("<input type='hidden' name='"+ strfrmNames+"' value='"+strfrmValues+"'>");
			if(v == winnerNums.length-1 ){
				strSpan += winnerNums[v];
				break;
			}
			strSpan += winnerNums[v]+" ,";
			
		}//end for
		
		$("#winnerSpan").text(strSpan);
		frmEventWinner.submit();
	});

		//쪽지 보내기
		var receiver_m_id;
		$(".sendMsg").click(function(){
			$("#modal-545116").trigger("click");
			receiver_m_id=$(this).attr("data-mid");
			
		});
		//쪽지보내기 완료 클릭
		$("#btnSendMsg").click(function(){
			var content=$("#tareaMsg").val();
			var sender_admin_code = "${admin_code}";
			var sData={
					"receiver_m_id":receiver_m_id,
					"content":content,
					"sender_admin_code":sender_admin_code
			};
			var url="/message/EventIsNoGet";
			$.post(url,sData,function(rData){
				console.log(rData);
				if(rData =="true"){
					alert("성공적으로 보냈습니다");
					$("#tareaMsg").val("");
				}
				else{
					alert("메세지 보내기에 실패했습니다");
					$("#tareaMsg").val("");
				}
			});
		});
		$("#btnCancleMsg").click(function(){
			$("#tareaMsg").val("");
		});
		
});//jquery ENd
	
	
	
	
</script>
<%@ include file="/WEB-INF/views/include_admin/frmEvent.jsp" %>
<!-- modal -->
<div class="row">
		<div class="col-md-12">
			 <a id="modal-545116" href="#modal-container-545116" role="button" class="btn" data-toggle="modal" style="display:none;"></a>
			
			<div class="modal fade" id="modal-container-545116" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								쪽지보내기
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
						<textarea class="form-control" id="tareaMsg"></textarea>
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary" id="btnSendMsg" data-dismiss="modal">
								쪽지 보내기
							</button> 
							<button type="button" class="btn btn-secondary" id="btnCancleMsg" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
<!-- modal -->
<form id="frmEventWinner" action="/admin/event_winnerRun" method="post">
<input type="hidden" name="event_seq" value="${param.event_seq}">
</form>
<!-- start Event inner header -->
<!-- <img src="/admin/displayImage?filename=//192.168.0.232/ServerFolder/editor/multiupload/202206071905312924d017-f20d-49e2-bfda-8a2184b78627.jpg"> -->
<div class="pcoded-inner-content">
	<!-- Main-body start -->
	<div class="main-body">
		<div class="page-wrapper">
			<!-- Page-header start -->
			<div class="page-header card">
				
				<div class="row align-items-end">
					<div class="col-lg-8">
						

						<div class="page-header-title">
							<i class="icofont icofont-trophy bg-c-blue"></i>
								<div class="d-inline">
									<h4>이벤트  목록</h4>
									<select id="select_liveEvent_seq">
							<option disabled="disabled" selected="selected" value="">진행중인 이벤트(번호를 골라주세요)</option>
							<c:forEach items="${liveEventList}" var="eventSeq">
							<option value="${eventSeq}"
							<c:if test="${eventSeq eq param.event_seq}">
							selected</c:if>
							>${eventSeq}번(진행중)</option>
							</c:forEach>
							</select>
							
								<select id="select_endEvent_seq">
							<option disabled="disabled" selected="selected" value="">종료된 이벤트 (번호를 골라주세요)</option>
							<c:forEach items="${endEventList}" var="eventVo">
							<option value="${eventVo.event_seq}"
							<c:if test="${eventVo.event_seq eq param.event_seq}">
							selected</c:if>
							>${eventVo.event_seq}번
							<c:choose>
							<c:when test="${eventVo.event_is_bylot eq 'Y' }">(추첨완료,종료된 이벤트)</c:when>
							<c:otherwise>
							(종료된 이벤트,추첨해주세요)
							</c:otherwise>
							</c:choose>
							
							</option>
							</c:forEach>
							</select>
									<span></span>
								</div>

							<div class="d-inline">
							
							</div>
							
						</div>
					</div>
					<div class="col-lg-4">
						참가인원&nbsp; :&nbsp; ${participationList.size()}&nbsp; /&nbsp;총원&nbsp;: &nbsp;${participationList.get(0).EVENT_MAX_COUNT} 
						(${participation_percentStr})%
						<div class="page-header-breadcrumb">
							
							<ul class="breadcrumb-title">
								<li class="breadcrumb-item"><a href="/admin/home"><i
										class="icofont icofont-home"></i></a></li>
								<li class="breadcrumb-item">이벤트</li>
								<li class="breadcrumb-item"><a href="/admin/event">이벤트 목록</a></li>
							</ul>

						</div>
					</div>
				</div>
			</div>

			<!-- end Event inner header -->



			<!-- Page-body start -->
			<div class="page-body">
				<!-- Basic table card start -->
				<div class="card">
				
					<div class="card-header">
					<c:if test="${participationList.get(0).EVENT_IS_BYLOT eq 'N'}">
					<button class="btn btn-success btn-round" id="buttonWinner" type="button">추첨하기</button>
					</c:if>
					<span id="winnerSpan"></span>
						<table class="table table-hover">
						<thead>
						<tr>
							<th>#</th>
							<th>이벤트 번호</th>
							<th>이벤트 이름</th>
							<th>이벤트 참가자(id)</th>
							<th>당첨여부</th>
						<c:if test="${eventVo.event_is_bylot eq 'Y'}">
							<th>이벤트 물품 수령 여부</th>
							<th>미수령자 쪽지 보내기</th>
						</c:if>	
						</tr>
						</thead>
						<tbody>
						
						<c:forEach items="${participationList}" var="eventParticipationVo" varStatus="i" >
						<tr class=<c:choose>
						<c:when test="${eventParticipationVo.EP_IS_WINNER eq 'Y' }">"table-success trList"</c:when>
						<c:otherwise>"table-warning trList"</c:otherwise>
						</c:choose>
						>
						<td class="tdCount" data-count="${i.count}">${i.count}</td>
						<td>${eventParticipationVo.EVENT_SEQ}</td>
						<td>${eventParticipationVo.EVENT_NAME}</td>
						<td class="tdNames" data-name="${eventParticipationVo.M_ID}">${ eventParticipationVo.M_NAME}(${eventParticipationVo.M_ID})</td>
						<td><c:choose>
						<c:when test="${eventParticipationVo.EP_IS_WINNER eq 'Y' }">당첨</c:when>
						<c:otherwise>미당첨</c:otherwise>
						</c:choose></td>
						<c:if test="${eventVo.event_is_bylot eq 'Y'}">
						<td class="tdIsByLot">
						<c:forEach items="${eventWinnerList}" var="eventWinnerVo" varStatus="j">
						<c:choose>
						
						<c:when test="${eventWinnerVo.m_id eq eventParticipationVo.M_ID }">
						
						<c:choose>
							<c:when test="${eventWinnerVo.e_winner_is_get eq 'Y'}">
							<c:set var="winnerGet" value="수령"/>
							
							</c:when>
							<c:otherwise>
							<c:set var="winnerNoGet" value="미수령"/>
						
							</c:otherwise>
						</c:choose>
						
						</c:when>
						<c:otherwise>
							<c:set var="noApplicable" value="해당없음"/>
							
						</c:otherwise>
						
						</c:choose>
						</c:forEach>
						<c:choose>
						<c:when test="${!empty winnerGet }">
						${winnerGet}
						<c:set var="winnerGet" value=""/>
						<c:set var="winnerNoGet" value=""/>
						<c:set var="noApplicable" value=""/>
						</c:when>
						
						<c:when test="${!empty winnerNoGet}">
						${winnerNoGet}
						<c:set var="winnerGet" value=""/>
						<c:set var="winnerNoGet" value=""/>
						<c:set var="noApplicable" value=""/>
						</c:when>
						
						<c:when test="${!empty noApplicable  && empty winnerNoGet && empty winnerGet }">
						${noApplicable}
						<c:set var="winnerGet" value=""/>
						<c:set var="winnerNoGet" value=""/>
						<c:set var="noApplicable" value=""/>
						</c:when>
						</c:choose>
						</td>
						<td class="tdMessageSend">
						<c:forEach items="${eventWinnerList}" var="eventWinnerVo" varStatus="j">
						<c:choose>
						
						<c:when test="${eventWinnerVo.m_id eq eventParticipationVo.M_ID }">
						
						<c:choose>
							<c:when test="${eventWinnerVo.e_winner_is_get eq 'Y'}">
							<c:set var="winnerGet" value="수령"/>
							
							</c:when>
							<c:otherwise>
							<c:set var="winnerNoGet" value="미수령"/>
						
							</c:otherwise>
						</c:choose>
						
						</c:when>
						<c:otherwise>
							<c:set var="noApplicable" value="해당없음"/>
							
						</c:otherwise>
						
						</c:choose>
						</c:forEach>
						<c:choose>
						<c:when test="${!empty winnerGet }">
						<i class="fa fa-paper-plane sendMsg" data-mid="${eventParticipationVo.M_ID}"></i>
						<c:set var="winnerGet" value=""/>
						<c:set var="winnerNoGet" value=""/>
						<c:set var="noApplicable" value=""/>
						</c:when>
						
						<c:when test="${!empty winnerNoGet}">
						<i class="fa fa-paper-plane sendMsg" data-mid="${eventParticipationVo.M_ID}"></i>
						<c:set var="winnerGet" value=""/>
						<c:set var="winnerNoGet" value=""/>
						<c:set var="noApplicable" value=""/>
						</c:when>
						
						<c:when test="${!empty noApplicable  && empty winnerNoGet && empty winnerGet }">
						${noApplicable}
						<c:set var="winnerGet" value=""/>
						<c:set var="winnerNoGet" value=""/>
						<c:set var="noApplicable" value=""/>
						</c:when>
						</c:choose>
						</td>
						
						</c:if>
						</tr>
						</c:forEach>
						</tbody>
						</table>

					</div>
				</div>
			</div>
			<!-- Basic table card end -->
		</div>
	</div>
</div>





<%@ include file="/WEB-INF/views/include_admin/footer.jsp"%>