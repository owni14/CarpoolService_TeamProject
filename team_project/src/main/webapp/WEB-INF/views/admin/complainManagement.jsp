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
var mids=new Array();
var oldVal;

var updateAnswer="${result}";
	if(updateAnswer =="true"){
		alert("답변 전송성공");
	}
	else if(updateAnswer =="false"){
		alert("답변 전송에 문제가 발생했습니다");
	}
	

	$(document).ready(function () {
		var code="${admin_code}";
		
		
			$(".trList").click(function(){
				$(this).next("tr").toggle();
				$(this).next("tr").siblings(".trCollapse").hide();
		
			});
		
		
		
	$(".btnAnswer").click(function(){
		var trTarget=$(this).parents().prev("tr.trList");
		var complain_seq= trTarget.find("th").eq(0).attr("data-seq");
		var complain_classification=trTarget.find("th").eq(1).attr("data-classification");
		var admin_code=trTarget.find("td").eq(0).attr("data-admin_code");
		var m_id=trTarget.find("td").eq(1).attr("data-mid");
		var afterContent=trTarget.find("td").eq(2).attr("data-content");
		var complain_answer=$(this).prev().prev().prev().val();
		//데이터  찾기
		
		//폼 값 변경
		var form=$("#frmAnswer");
		form.find("[name=complain_seq]").val(complain_seq);
		form.find("[name=admin_code]").val(admin_code);
		form.find("[name=m_id]").val(m_id);
		complain_answer += "\n\n\n고객님이 문의주신 내용입니다 \n\n\n원문 : \n\n\n"+afterContent;
		form.find("[name=complain_answer]").val(complain_answer);
		form.submit();
	});	
	
	
	$("#search").on("propertychange change keyup paste input", function() {
		var indexArr=new Array();
	    var currentVal = $(this).val();
	    if(currentVal == oldVal) {
	        return;
	    }
	 	
	    oldVal = currentVal;
	    
	    var flag=false;
	    var tmpIndex=0;
		for(var v=0; v<mids.length; v++){
			flag=mids[v].startsWith(currentVal);
			if(flag){

				indexArr[tmpIndex]=v;
				tmpIndex++;
			}
		}
	  
	    //index 값에 따라 trlist 감추기
	    $(".trList").hide();
	    for(var v=0; v<indexArr.length; v++){
	    	$(".trList").eq(indexArr[v]).show();
	    	$(".trList").eq(indexArr[v]).find("th[data-seq]").text(v+1);
	    }
	});
	//key event
	
	 $(".trList").find("td[data-mid]").each(function(index){
	    	
	    	var m_id=$(this).attr("data-mid");
	    	mids[index]=m_id;	
	    		

	    });
	$("#btnSearch").click(function(){
		var keyword=$("#keyword").val();
		$("#frmPaging").find("[name=searchType]").val("i");
		$("#frmPaging").find("[name=keyword]").val(keyword);
		$("#frmPaging").attr("action","/admin/complainForm");
		$("#frmPaging").attr("method","get");
		$("#frmPaging").submit();
		
	});
	
	});
	//end jquery
</script>
<%@ include file="/WEB-INF/views/include/frmPaging.jsp" %>
<form method="post" action="/admin/complainAnswer" id="frmAnswer">
<input type="hidden" name="complain_seq">
<input type="hidden" name="admin_code">
<input type="hidden" name="m_id">
<input type="hidden" name="complain_answer">
</form>
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
								<i class="ti-help-alt" style="background-color:#54BD54"></i>
								<div class="d-inline" >
									<h4>고객 문의 리스트</h4>
								
									<span></span>
								</div>
							</div>
						
						<!-- 새로 추가된 div -->
						</div>
							<div class="col-lg-4" style="text-align: right;">
								<input type="text" id="keyword" name="keyword" style="height:25px;width:400px;"
					placeholder="아이디로 검색"
					>
					<button type="button" id="btnSearch" style="background-color:white; border-color: #d2d2d2;">검색&nbsp;&nbsp;<i class="icofont icofont-search-alt-2"></i></button>
						</div>
					<div class="col-lg-3">
						<div class="page-header-breadcrumb">
							<ul class="breadcrumb-title">
								<li class="breadcrumb-item">
								<a href="/admin/home"><i class="icofont icofont-home"></i></a>
								</li>
								<li class="breadcrumb-item">고객문의</li>
								
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
						<i class="icofont  icofont-notification"></i>
						<h5>답변 처리 현황</h5>
					<input type="text" id="search" name="search" style="height:25px;width: 300px"
					placeholder="검색 결과내 재검색"
					>
					</div>
					<div class="card-block table-border-style">
						<div class="table-responsive"> 
						<div class="row">
						<div class="col-md-12 col-xl-2" style="margin-left:20px">
							<!-- chart Start -->
							<canvas id="canvas" height="300"></canvas>
							<script>
							new Chart(document.getElementById("canvas"), {
							    type: 'bar',
							    data: {
							        labels: [''],
							        datasets: [{
							            label: '대기중',
							            data: [
							               '${complain_count}'
							            ],
							            backgroundColor: [
							            	"rgba(54, 162, 235, 0.2)",
							            	],
							            borderColor: [
							            	"rgba(54, 162, 235, 1)",
							            	],
							            fill: true,
							        }, {
							        	label: '7일경과',
							            data: [
							                '${agoSevenCount}'
							            ],
							            backgroundColor: [
							            	"rgba(255, 205, 86, 0.2)"
							            	],
							            borderColor: [
							            	"rgba(255, 205, 86, 1)"
							            	]
							        }]
							    },
							    options: {
							        responsive: true,
							        title: {
							            display: true,
							            text: 
							            	'답변 진행 상황'
							        },
							        tooltips: {
							            mode: 'index',
							            intersect: false,
							            callbacks: {
							                title: function(tooltipItems, data) {
							                    return data.labels[tooltipItems[0].datasetIndex];
							                }
							            }
							        },
							        hover: {
							            mode: 'nearest',
							            intersect: true
							        },
							        scales: {
							            xAxes: [{
							                display: true,
							                scaleLabel: {
							                    display: true,
							                    labelString: '총 미처리 답변 갯수 : ${complain_count}' 
							                },
							                ticks: {
							                    autoSkip: false
							                }
							            }],
							            yAxes: [{
							                display: true,
							                ticks: {
							                    suggestedMin: 0,
							                },
							                scaleLabel: {
							                    display: false,
							                    labelString: 'y축'
							                }
							            }]
							        }
							    }
							});
							</script>
							<!-- chart Ends -->
							
							
						</div>
							<!-- 처리 결과 Y table start -->
						
							<div class="col-md-12 col-xl-9" style="margin-left: 20px; padding-right : 40px">
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
									
									<tr class="trList">
									
											<th scope="row" data-seq="${complainVo.complain_seq}">${i.count}</th>
											<th scope="row" data-classification="${complainVo.complain_classification}">${complainVo.complain_classification}	
											</th>
											<td data-admin_code="${complainVo.admin_code }">${complainVo.admin_code }</td>
											<td data-mid="${complainVo.m_id}">${complainVo.m_id }</td>
												<!-- collapse 드갈거 -->
											<td class="tdContent" data-content="${complainVo.complain_content}">
											<c:choose>
											<c:when test="${complainVo.complain_content.length() >20 }">
											${complainVo.complain_content.substring(0,20)}...</c:when>
											<c:otherwise>${complainVo.complain_content }</c:otherwise>
											 
											</c:choose> 
											</td>
											
											<!-- end collapse -->
											<td>${complainVo.complain_is_finish}</td>
											<td>${complainVo.complain_regdate}</td>
											<td><button class="btn btn-info">
											답변 달기
											</button></td>
											
										
								</tr>
								<tr class="trCollapse" style="display:none" data-display="N">
								<td colspan="8">
											<div>
											  <div class="Answer">
											  <h5>문의 상세내용 : &nbsp;${complainVo.complain_content }</h5>
											  <br><br>
											  <h4>유저(${complainVo.m_id})에 대한 답변달기</h4>
											   <textarea class="form-control tareContent" ></textarea>
											   <br>
											   
											   <br>
											   <button class="btn btn-info btnAnswer" type="button">작성완료</button>
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