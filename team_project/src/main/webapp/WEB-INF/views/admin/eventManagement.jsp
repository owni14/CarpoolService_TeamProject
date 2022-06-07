<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>
<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		
	<div class="card project-task">
		<div class="card-header">
			<div class="card-header-left ">
				<h3>이벤트 목록</h3>
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
							<th>#</th>
							<th>이벤트 이름</th>
							<th>진행날짜</th>
							<th>참석자수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div class="task-contain">
									<h6 class="bg-c-blue d-inline-block text-center">1</h6>
									
								</div>
							</td>
							<td>
								<p class="d-inline-block m-r-20">포이트따블로!</p>                              
							</td>
							<td>
								<p class="d-inline-block m-r-20">2022 06 03~ 2022 07 07</p>                              
							</td>
							<td>
								<p class="d-inline-block m-r-20">15/54</p>                              
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
								<p class="d-inline-block m-r-20">담배를 너무 많이 피어요</p> <!--                                                                             <div class="progress d-inline-block"> -->
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
								<p class="d-inline-block m-r-20">운전중 자꾸 한숨을 쉬어요</p> <!--                                                                             <div class="progress d-inline-block"> -->
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
		<div class="col-md-2">
		</div>
	</div>

<%@ include file="/WEB-INF/views/include_admin/footer.jsp"%>