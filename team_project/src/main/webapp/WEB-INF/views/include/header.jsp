<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Zay Shop eCommerce HTML CSS Template</title>
    <meta charset="utf-8">
<!--     <meta name="viewport" content="width=device-width, initial-scale=1"> -->

    <link rel="apple-touch-icon" href="/resources/assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/assets/img/favicon.ico">

    <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/assets/css/templatemo.css">
    <link rel="stylesheet" href="/resources/assets/css/custom.css">

	<!-- icofont -->
	<link rel="stylesheet" type="text/css" href="/resources/admin/assets/icon/icofont/css/icofont.css">
	
	<!-- bootstrap-icon -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
	
    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="/resources/assets/css/fontawesome.min.css">
    
    <!-- bootstrap 참조 시작 -->
    													
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">													
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>													
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>													
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>													
    <!-- bootstrap 참조 끝 -->
    
    <!-- services 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ba11103bc3fedcece5c96fbe33782be3&libraries=services"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ba11103bc3fedcece5c96fbe33782be3"></script>
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ba11103bc3fedcece5c96fbe33782be3&libraries=services,clusterer,drawing"></script>
    
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->

<!-- Start Script -->
    <script src="/resources/assets/js/jquery-1.11.0.min.js"></script>
    <script src="/resources/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="/resources/assets/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/assets/js/templatemo.js"></script>
    <script src="/resources/assets/js/custom.js"></script>
    <!-- End Script -->
    
    <!-- popovers start -->
      
    <!-- popovers end -->
    
    <script>
    $(function() {
    	var header = $("#header");
    	
    	$(".main_menu").mouseenter(function() {
    		$(".smenu").hide();
    		var a = $(this).attr("id");
    		console.log(a);
    		if (a != "menu_2") {
		   		header.stop().animate({height:'150px'}, 300);
		   		$("#s"+a).show();
    		} else {
    			$(".smenu").hide();
    	    	header.stop().animate({height:'90px'}, 300);
    		}
    	});
    	
    	 header.mouseleave(function() {
    		 $(".smenu").hide();
    		header.stop().animate({height:'90px'}, 300);
    	});
    	 
    });
    </script>
    <style>
    #header{ 
 	height:90px;
    } 
   
	#headerMenu{
	overflow:hidden;
	}
	
	.smenu {
	position : absolute;
	display:none;
	}
	
	.smenu_a {
	text-decoration: none;
	color: black;
	margin-right: 30px;
	
	}
	
	
	
    </style>
</head>

<body>
  <script>

$(document).ready(function(){
	
// 	마우스 커서 위치에 따른 좌표 start
	$(document).on("mousemove",function(e) {
	   $("#log").text(e.pageX+", "+e.pageY);
	});
// 	마우스 커서 위치에 따른 좌표 end

// 	서브 메뉴 위치 선정 start
	for (var v = 1; v < 5; v++) {
		 var left = $("#a_" + v).offset().left;
		 $("#smenu_"+v).offset({left: left});
	}
	     
   	$(window).resize(function(e){
   		for (var v = 1; v < 5; v++) {
   			var left = $("#a_" + v).offset().left;
 		$("#smenu_"+v).offset({left: left});
   		}
   	});	
// 	서브 메뉴 위치 선정 end

	$("#messageIcon").click(function(){
		var url = "/message/lastMessageList";
		$.post(url, function(rData) {
			$("#lastTable tr").remove();
			console.log(rData);
			$.each(rData, function() {
				console.log($(this));
				var tr = $("#clonetable tr").clone();
				var span = tr.find("span");
				if (this.sender_m_id != null) {
					span.eq(0).text(this.sender_m_id);
				} else {
					span.eq(0).text(this.sender_admin_code);
				}
				span.eq(1).text(this.senddate);
				if(this.content.length >= 25) {
					span.eq(2).text(this.content.substring(0,25) + ".....");
				} else {
					span.eq(2).text(this.content);
				}
				$("#lastTable").append(tr);
			});
		});
	});
});
</script>

    <!-- Header -->
    <header id="header">
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-success logo h1 align-self-center" href="/">
                Zay
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
              <div class="flex-fill" id="headerMenu">
                <div>
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto clearfix"  id="navul">
                        <li class="nav-item main_menu" id="menu_1">
                            <a class="nav-link" id="a_1" href="/my/boardedHistory">마이 카풀</a>
                        </li> 
                        <li class="nav-item main_menu" id="menu_2">
                            <a class="nav-link" id="a_2"  href="/point/point">포인트</a>
                        </li>
                        <li class="nav-item main_menu"  id="menu_3">
                            <a class="nav-link" id="a_3" href="/event/now">이벤트 & 혜택</a>
                        </li>
                        <li class="nav-item main_menu"  id="menu_4">
                            <a class="nav-link" id="a_4" href="/customer/faq">고객센터</a>
                        </li>
                    </ul>
                </div>
               </div>
                
                
                <div class="navbar align-self-center d-flex">
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                        <div class="input-group">
                            <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                            <div class="input-group-text">
                                <i class="fa fa-fw fa-search"></i>
                            </div>
                        </div>
                    </div>
                    <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                        <i class="fa fa-fw fa-search text-dark mr-2"></i>
                    </a>
                    <c:choose>
                    	<c:when test="${not empty loginVo}">
                    		 
							    
							  
							<div class="dropdown">
								<a class="nav-link" type="button" id="messageIcon" data-toggle="dropdown">
									<i class="bi bi-envelope" style="font-size: 25px; margin: 5px;"></i>
								</a>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton" id="message_dropdown" style="width: 300px; height: 300px;" >
									<div style="height: 15%" id="m_dropdown_title">
										<div class="row">
											<div class="col-md-6">
												<span class="span_message" style="margin: 10px;">새 쪽지</span>
											</div>
											<div class="col-md-6" style="text-align: right;">
												<a href="/message/recAdminMessagePage"><span class="span_message" style="margin: 10px;">쪽지함 ></span></a>
											</div>
										</div>
									</div>
									<table class="table" id="lastTable" style="height: 85%">
									
									</table>
								</div>
								<table style="display: none" id="clonetable">
									<tr style="height: 33%;">
										<td>
											<span style="font-size: 14px;"></span>
											<span style="font-size: 12px;"></span><br>
											<span style="font-size: 12px;"></span>
										</td>
									</tr>
								</table>
								
<!-- 									<div style="height: 28.3%;"> -->
<!-- 										<div class="row" style="vertical-align: middle;"> -->
<!-- 											<div class="col-md-3" style="vertical-align:middle; text-align: center;"> -->
<!-- 												<span></span> -->
<!-- 											</div> -->
<!-- 											<div class="col-md-6" style="text-align: center;"> -->
<!-- 												<span></span> -->
<!-- 											</div> -->
<!-- 											<div class="col-md-3" style="text-align: center;"> -->
<!-- 												<span></span> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
								
							</div>
                    		<a href="/member/logout"><i class="icofont icofont-logout" style="font-size: 25px; margin: 5px;"></i></a>
                    		${loginVo.m_name}
                    	</c:when>
	                    <c:otherwise>
	                    	<a href="/member/loginForm"><i class="icofont icofont-login" style="font-size: 25px; margin-right: 10px;"></i></a>
		                    <a href="/member/joinForm"><i class="bi bi-person-plus-fill" style="font-size: 25px;"></i></a>
	                    </c:otherwise>
                    </c:choose>
                </div>
            </div>

        </div>
    </nav>
    <nav>
	    <div class="smenu" id="smenu_1">
	    	<a class="smenu_a" href="/my/boardedHistory">탑승 내역</a>
	    	<a class="smenu_a" href="/my/driveHistory">운전 내역</a>
	    	<a class="smenu_a" href="/my/pointHistory">포인트 내역</a>
	    	<a class="smenu_a" href="/my/registerDriver">운전자 등록</a>
	    </div>
	    
	    <div class="smenu" id="smenu_3">
	   		<a class="smenu_a" href="/event/now">진행중인 이벤트</a>
	    	<a class="smenu_a" href="/event/winner">당첨자 발표</a>
	    	<a class="smenu_a" href="/event/info">등급별 혜택</a>
	    </div>
	    <div class="smenu" id="smenu_4">
	   		<a class="smenu_a" href="/customer/faq">자주 묻는 질문</a>
	    	<a class="smenu_a" href="/customer/counsel">1:1 문의하기</a>
	    	<a class="smenu_a" href="/customer/report">신고내역</a>
	    </div>
	</nav>
    </header>
    <!-- Close Header -->
    
<!-- 좌표 -->
<!-- <div id="log"></div> -->
<!-- /좌표 -->
    <!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="w-100 pt-1 mb-5 text-right">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="get" class="modal-content modal-body border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>



   