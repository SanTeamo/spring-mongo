<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--	描述：菜单栏	-->
<div class="container-fluid">
	<div class="col-md-2 col-xs-12 col-md-offset-2" >
		<img src="${pageContext.request.contextPath}/img/logo.png" height="100" />
	</div>
	<div class="col-md-6 col-xs-12" style="margin-top: 20px">
		<%--<img src="${pageContext.request.contextPath}/img/header.png" />--%>
		<div class="col-md-10 text-center">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="输入搜索内容">
				<span class="input-group-btn">
        		<button class="btn btn-default" type="button">搜索</button>
      			</span>
			</div>
		</div>
	</div>
	<div class="col-md-2 col-xs-12 pull-right" style="line-height: 50px;height: 50px;">
		<ol class="list-inline">

			<c:if test="${empty loginUser}">
				<li><a
					href="${pageContext.request.contextPath}/Home/toLogin">登录</a></li>
				<li><a
					href="${pageContext.request.contextPath}/Home/toRegist">注册</a></li>
			</c:if>

			<c:if test="${not empty loginUser}">
				<li>欢迎您,${loginUser.username}</li>
				<li><a
					href="${pageContext.request.contextPath}/Home/logOut">退出</a></li>
				<li><a href="${pageContext.request.contextPath}/Home/Cart">购物车</a></li>
				<li><a
					href="${pageContext.request.contextPath}/Home/Order">我的订单</a></li>
			</c:if>

		</ol>
	</div>
</div>
<!--	描述：导航条	-->
<div class="container-fluid">
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"
					href="${pageContext.request.contextPath}/index">首页</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav" id="myUL">

				</ul>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
</div>
<script>
$(function(){
	var url="/Category/findAllCats";
	//var obj=none;
	$.post(url,function(data){
		$.each(data,function(i,obj){
			var li="<li><a href='/Product/catId/"+obj.catId+"'>"+obj.catName+"</a></li>";
			$("#myUL").append(li);
		});
		
	},"json");
});
</script>