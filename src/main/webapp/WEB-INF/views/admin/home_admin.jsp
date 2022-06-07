<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include_admin/header.jsp" %>


                           <div class="main-body">
                                <div class="page-wrapper">

                                    <div class="page-body">
                                        <div class="row">
                                            <!-- card1 start -->
                                            <div class="col-md-6 col-xl-3">
                                                <div class="card widget-card-1">
                                                    <div class="card-block-small">
                                                        <i class="ti-pie-chart card1-icon bg-c-blue"></i>
                                                        <span class="text-c-blue f-w-600">오늘의 접속자수</span>
                                                        <h4> 43(수를 기입)</h4>
                                                        <div>
                                                            <span class="f-left m-t-10 text-muted">
                                                           
                                                            <i class="text-c-yellow f-16 icofont icofont-refresh m-r-10"></i>update userConnectCount 
<!--                                                                 <i class="text-c-blue f-16 icofont icofont-warning m-r-10"></i>Get more space -->
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- card1 end -->
                                            <!-- card1 start -->
                                            <div class="col-md-6 col-xl-3">
                                                <div class="card widget-card-1">
                                                    <div class="card-block-small">
                                                        <i class="ti-car bg-c-pink card1-icon"></i>
                                                        <span class="text-c-pink f-w-600">이용현황</span>
                                                        <h4>운전자수 33</h4>
                                                        <div>
                                                            <span class="f-left m-t-10 text-muted">
                                                            <i class="text-c-yellow f-16 icofont icofont-refresh m-r-10"></i>driver count
<!--                                                                 <i class="text-c-pink f-16 icofont icofont-calendar m-r-10"></i>Last 24 hours -->
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- card1 end -->
                                            <!-- card1 start -->
                                            <div class="col-md-6 col-xl-3">
                                                <div class="card widget-card-1">
                                                    <div class="card-block-small">
                                                        <i class="ti-check-box bg-c-green card1-icon"></i>
                                                        <span class="text-c-green f-w-600">이벤트 경품 미수령자</span>
                                                        <h4>45</h4>
                                                        <div>
                                                            <span class="f-left m-t-10 text-muted">
                                                              <i class="text-c-yellow f-16 icofont icofont-refresh m-r-10"></i>event non-receiver 
<!--                                                                 <i class="text-c-green f-16 icofont icofont-tag m-r-10"></i>Tracked via microsoft -->
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- card1 end -->
                                            <!-- card1 start -->
                                            <div class="col-md-6 col-xl-3">
                                                <div class="card widget-card-1">
                                                    <div class="card-block-small">
                                                        <i class="ti-comment-alt bg-c-yellow card1-icon"></i>
                                                        <span class="text-c-yellow f-w-600">미답변 문의 글 수</span>
                                                        <h4>15</h4>
                                                        <div>
                                                            <span class="f-left m-t-10 text-muted">
                                                             <i class="text-c-yellow f-16 icofont icofont-refresh m-r-10"></i>count unanswered
<!--                                                                 <i class="text-c-yellow f-16 icofont icofont-refresh m-r-10"></i>Just update -->
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- card1 end -->
                                            <!-- Statestics Start -->
                                            <div class="col-md-12 col-xl-8">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5>운전현황</h5>
                                                        <div class="card-header-left ">
                                                        </div>
                                                        <div class="card-header-right">
<!--                                                             <ul class="list-unstyled card-option"> -->
<!--                                                                 <li><i class="icofont icofont-simple-left "></i></li> -->
<!--                                                                 <li><i class="icofont icofont-maximize full-card"></i></li> -->
<!--                                                                 <li><i class="icofont icofont-minus minimize-card"></i></li> -->
<!--                                                                 <li><i class="icofont icofont-refresh reload-card"></i></li> -->
<!--                                                                 <li><i class="icofont icofont-error close-card"></i></li> -->
<!--                                                             </ul> -->
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="card-block">
<!--                                                         <div id="statestics-chart" style="height:517px;"></div> -->
													<div style="height:517px;">
	<!--차트가 그려질 부분-->
	<canvas id="myChart"></canvas>
</div>		




<script>
const labels = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
];

const data = {
  labels: labels,
  datasets: [{
	fill: false,
    label: 'My First dataset',
    backgroundColor: 'rgb(255, 99, 132)',
    borderColor: 'rgb(255, 99, 132)',
    data: [0, 10, 5, 2, 20, 30, 45],
  }]
  
};

const config = {
  type: 'line',
  data: data,
  options: {}
};
const myChart = new Chart(
		  document.getElementById('myChart'),
		  config
		);
</script>

      
<!-- script -->
                                                    </div>
                                                </div>
                                            </div>



                                            <div class="col-md-12 col-xl-4">
                                    			<!-- Donut chart start -->
                                           		<canvas id="doughnut-chart" width="600" height="450"></canvas>
                                           		<script>
												new Chart(document.getElementById("doughnut-chart"), {
												    type: 'doughnut',
												    data: {
												      labels: ["hong", "kim", "lee", "kang", "park"],
												      datasets: [
												        {
												          label: "Population (millions)",
												          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
												          data: [2478,5267,734,784,433]
												        }
												      ]
												    },
												    options: {
												      title: {
												        display: true,
												        text: '운전자 매너 온도'
												      }
												    }
												});
												</script> 
                                            <!-- Donut chart Ends -->		
                                            </div>
                                           
                                            <!-- Email Sent End -->
                                            <!-- Data widget start -->
                                            <div class="col-md-12 col-xl-6">
                                                <div class="card project-task">
                                                    <div class="card-header">
                                                        <div class="card-header-left ">
                                                            <h3>신고자 리스트</h3>
                                                        </div>
                                                        <div class="card-header-right">
<!--                                                             <ul class="list-unstyled card-option"> -->
<!--                                                                 <li><i class="icofont icofont-simple-left "></i></li> -->
<!--                                                                 <li><i class="icofont icofont-maximize full-card"></i></li> -->
<!--                                                                 <li><i class="icofont icofont-minus minimize-card"></i></li> -->
<!--                                                                 <li><i class="icofont icofont-refresh reload-card"></i></li> -->
<!--                                                                 <li><i class="icofont icofont-error close-card"></i></li> -->
<!--                                                             </ul> -->
                                                        </div>
                                                    </div>
                                                    <div class="card-block p-b-10">
                                                        <div class="table-responsive">
                                                            <table class="table table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th>신고 처리 대상</th>
                                                                        <th>신고 내용</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="task-contain">
                                                                                <h6 class="bg-c-blue d-inline-block text-center">3</h6>
                                                                                <p class="d-inline-block m-l-20">김형동</p>
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <p class="d-inline-block m-r-20">이거 너무 한거아니냐고</p>
<!--                                                                             <div class="progress d-inline-block"> -->
<!--                                                                                 <div class="progress-bar bg-c-blue" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:80%"> -->
<!--                                                                                 </div> -->
<!--                                                                             </div> -->
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="task-contain">
                                                                                <h6 class="bg-c-pink d-inline-block text-center">5</h6>
                                                                                <p class="d-inline-block m-l-20">이재곤</p>
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <p class="d-inline-block m-r-20">담배를 너무 많이 피어요</p>
<!--                                                                             <div class="progress d-inline-block"> -->
<!--                                                                                 <div class="progress-bar bg-c-pink" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:60%"> -->
<!--                                                                                 </div> -->
<!--                                                                             </div> -->
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="task-contain">
                                                                                <h6 class="bg-c-yellow d-inline-block text-center">4</h6>
                                                                                <p class="d-inline-block m-l-20">김민우</p>
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <p class="d-inline-block m-r-20">운전중 자꾸 한숨을 쉬어요</p>
<!--                                                                             <div class="progress d-inline-block"> -->
<!--                                                                                 <div class="progress-bar bg-c-yellow" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:50%"> -->
<!--                                                                                 </div> -->
<!--                                                                             </div> -->
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="task-contain">
                                                                                <h6 class="bg-c-green d-inline-block text-center">1</h6>
                                                                                <p class="d-inline-block m-l-20">화장실 빌런</p>
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <p class="d-inline-block m-r-20">화장실이 가고 싶은데 출근이 급하다고 안내려줘요</p>
<!--                                                                             <div class="progress d-inline-block"> -->
<!--                                                                                 <div class="progress-bar bg-c-green" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:50%"> -->
<!--                                                                                 </div> -->
<!--                                                                             </div> -->
                                                                        </td>
                                                                    </tr>
<!--                                                                     <tr> -->
<!--                                                                         <td> -->
<!--                                                                             <div class="task-contain"> -->
<!--                                                                                 <h6 class="bg-c-blue d-inline-block text-center">L</h6> -->
<!--                                                                                 <p class="d-inline-block m-l-20">Logo Design</p> -->
<!--                                                                             </div> -->
<!--                                                                         </td> -->
<!--                                                                         <td> -->
<!--                                                                             <p class="d-inline-block m-r-20">4 : 36</p> -->
<!--                                                                             <div class="progress d-inline-block"> -->
<!--                                                                                 <div class="progress-bar bg-c-blue" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:50%"> -->
<!--                                                                                 </div> -->
<!--                                                                             </div> -->
<!--                                                                         </td> -->
<!--                                                                     </tr> -->
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-xl-6">
                                                <div class="card add-task-card">
                                                    <div class="card-header">
                                                        <div class="card-header-left">
                                                            <h3>운전자 신청 승인 리스트</h3>
                                                        </div>
                                                        <div class="card-header-right">
                                                            <button class="btn btn-card btn-primary">모두 승인하기(이버튼 많은 책임을 동원합니다)</button>
                                                        </div>
                                                    </div>
                                                    <div class="card-block">
                                                        <div class="to-do-list">
                                                            <div class="checkbox-fade fade-in-primary d-block">
                                                                <label class="check-task d-block">
<!--                                                                     <input type="checkbox" value=""> -->
<!--                                                                     <span class="cr"> -->
<!--                                                                         <i class="cr-icon icofont icofont-ui-check txt-default"></i> -->
<!--                                                                     </span> -->
                                                                    <span><h6>김홍구 <span class="label bg-c-green m-l-10 f-10">남성</span></h6></span>
                                                                    <div class="task-card-img m-l-40">
                                                                        <a href="#!"><img src="#"  alt="면허증이미지" class="img-40"></a>
<!--                                                                         <a href="#!"><img src="/resources/admin/assets/images/avatar-3.jpg" data-toggle="tooltip" title="Alia" alt="" class="img-40 m-l-10"></a> -->
                                                                    </div>
                                                                </label>
                                                            </div>
                                                        </div>
<!--                                                         <div class="to-do-list"> -->
<!--                                                             <div class="checkbox-fade fade-in-primary d-block"> -->
<!--                                                                 <label class="check-task d-block"> -->
<!--                                                                     <input type="checkbox" value=""> -->
<!--                                                                     <span class="cr"> -->
<!--                                                                         <i class="cr-icon icofont icofont-ui-check txt-default"></i> -->
<!--                                                                     </span> -->
<!--                                                                     <span><h6>Meeting With HOD's and borad</h6><p class="text-muted m-l-40">23 january 2003</p></span> -->
<!--                                                                 </label> -->
<!--                                                             </div> -->
<!--                                                         </div> -->
                                                        <div class="to-do-list">
                                                            <div class="checkbox-fade fade-in-primary d-block">
                                                                <label class="check-task d-block">
<!--                                                                     <input type="checkbox" value=""> -->
<!--                                                                     <span class="cr"> -->
<!--                                                                         <i class="cr-icon icofont icofont-ui-check txt-default"></i> -->
<!--                                                                     </span> -->
                                                                    <span><h6>김희애<span class="label bg-c-pink m-l-10">여성</span></h6></span>
                                                                    <div class="task-card-img m-l-40">
<!--                                                                         <a href="#!"><img src="/resources/admin/assets/images/avatar-2.jpg" data-toggle="tooltip" title="Alia" alt="" class="img-40"></a> -->
<!--                                                                         <a href="#!"><img src="/resources/admin/assets/images/avatar-3.jpg" data-toggle="tooltip" title="Suzen" alt="" class="img-40 m-l-10"></a> -->
<!--                                                                         <a href="#!"><img src="/resources/admin/assets/images/avatar-4.jpg" data-toggle="tooltip" title="Lary Doe" alt="" class="img-40 m-l-10"></a> -->
                                                                        <a href="#!"><img src="#"   alt="면허증" class="img-40 m-l-10"></a>
                                                                    </div>
                                                                </label>
                                                            </div>
                                                        </div>
<!--                                                         <div class="to-do-list"> -->
<!--                                                             <div class="checkbox-fade fade-in-primary d-block"> -->
<!--                                                                 <label class="check-task d-block"> -->
<!--                                                                     <input type="checkbox" value=""> -->
<!--                                                                     <span class="cr"> -->
<!--                                                                         <i class="cr-icon icofont icofont-ui-check txt-default"></i> -->
<!--                                                                     </span> -->
<!--                                                                     <span><h6>Meeting With HOD's and borad</h6> -->
<!--                                                                         <p class="text-muted m-l-40">23 january 2003</p></span> -->
<!--                                                                         <div class="task-card-img m-l-40"> -->
<!--                                                                             <a href="#!"><img src="/resources/admin/assets/images/avatar-2.jpg" data-toggle="tooltip" title="Lary Doe" alt="" class="img-40"></a> -->
<!--                                                                             <a href="#!"><img src="/resources/admin/assets/images/avatar-3.jpg" data-toggle="tooltip" title="Alia" alt="" class="img-40 m-l-10"></a> -->
<!--                                                                             <a href="#!"><img src="/resources/admin/assets/images/avatar-2.jpg" data-toggle="tooltip" title="Josephin Doe" alt="" class="img-40 m-l-10"></a> -->
<!--                                                                         </div> -->
<!--                                                                     </label> -->
<!--                                                                 </div> -->
<!--                                                             </div> -->
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Data widget End -->
                                                
                                            </div>
                                        </div>
                                    </div>

                                    <div id="styleSelector">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="fixed-button">
                    <a href="https://codedthemes.com/item/guru-able-admin-template/" target="_blank" class="btn btn-md btn-primary">
                      <i class="fa fa-shopping-cart" aria-hidden="true"></i> Upgrade To Pro
                    </a>
                </div>
            </div>
        </div>

        <!-- Warning Section Starts -->
        <!-- Older IE warning message -->
    <!--[if lt IE 9]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="/resources/admin/assets/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="/resources/admin/assets/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="/resources/admin/assets/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="/resources/admin/assets/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="/resources/admin/assets/images/browser/ie.png" alt="">
                    <div>IE (9 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->
<!-- Warning Section Ends -->
<!-- Required Jquery -->

</body>

</html>

