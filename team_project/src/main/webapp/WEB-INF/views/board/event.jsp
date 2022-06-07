<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>
					이벤트 &amp; 혜택
				</h2>
				<p>
					다양한 이벤트에서 참여해보세요!!
				</p>
				<p>
					<a class="btn btn-primary btn-large" href="#">Learn more</a>
				</p>
			</div>
			<div class="tabbable" id="tabs-517661">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link" href="#tab1" data-toggle="tab">진행중인 이벤트</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active show" href="#tab2" data-toggle="tab">당첨자 발표</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-3098">
						<p>
							I'm in Section 1.
						</p>
					</div>
					<div class="tab-pane" id="tab2">
						<p>
							Howdy, I'm in Section 2.
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>