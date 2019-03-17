<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--	描述：菜单栏	-->
<div class="container-fluid">
	<%--<nav class="navbar navbar-default navbar-static-top">
	<div class="container">
		...
	</div>
</nav>--%>
	<div class="col-md-2 col-xs-12 col-md-offset-2" >
		<img src="${pageContext.request.contextPath}/img/logo.png" height="100" />
	</div>
	<div class="col-md-6 col-xs-12" style="margin-top: 20px">
		<%--<img src="${pageContext.request.contextPath}/img/header.png" />--%>
		<div class="col-md-10 text-center">
			<%--<div class="input-group">
				<input type="text" class="form-control" placeholder="输入搜索内容">
				<span class="input-group-btn">
        		<button class="btn btn-default" type="button">搜索</button>
      			</span>
			</div>--%>
			<form class="input-group" role="search">
				<input type="text" class="form-control" placeholder="输入搜索内容">
				<span class="input-group-btn">
        		<button class="btn btn-default" type="submit">搜索</button>
      			</span>
			</form>
		</div>
	</div>
	<div class="col-md-2 col-xs-12" style="margin-top: 20px">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<c:if test="${empty loginUser}">
						<a class="navbar-brand" href="${pageContext.request.contextPath}/Home/toLogin">请先登录</a>
					</c:if>
					<c:if test="${not empty loginUser}">
						<a class="navbar-brand">欢迎您,${loginUser.name}</a>
					</c:if>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<c:if test="${not empty loginUser}">
							<li><a href="${pageContext.request.contextPath}/Home/logOut">退出</a></li>
						</c:if>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">菜单 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<%--<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">Separated link</a></li>--%>
								<c:if test="${empty loginUser}">
									<li>
										<a href="${pageContext.request.contextPath}/Home/toLogin">登录</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/Home/toRegist">注册</a>
									</li>
								</c:if>
								<c:if test="${not empty loginUser}">
									<%--是客户--%>
									<c:if test="${loginUser.type==1}">
										<li>
											<a href="${pageContext.request.contextPath}/Home/Cart">购物车</a>

										</li>
										<li>
											<a href="${pageContext.request.contextPath}/Home/Order">我的订单</a>
										</li>
									</c:if>

									<%--是卖家--%>
									<c:if test="${loginUser.type==2}">
										<li>
											<a href="${pageContext.request.contextPath}/Home/Order">我的订单</a>

										</li>
										<li>
											<a href="${pageContext.request.contextPath}/#">我的店铺</a>
										</li>
									</c:if>
								</c:if>
							</ul>
						</li>
					</ul>
				</div><!-- /.navbar-collapse -->
			</div><!-- /.container-fluid -->
		</nav>

	</div>
</div>
<!--	描述：导航条	-->
<div class="container-fluid">
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-2"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"
					href="${pageContext.request.contextPath}/index">首页</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
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