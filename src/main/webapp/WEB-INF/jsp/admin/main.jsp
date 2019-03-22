<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>农贸商城</title>
		<%--<style>
			body {
				width: 100%;
				height: 100%;
				margin: 0;
				overflow: hidden;
				background-color: #FFFFFF;
				font-family: "Microsoft YaHei", sans-serif;
			}
			.pageSidebar{
				width: 240px;
				height:100%;
				padding-bottom: 30px;
				overflow: auto;
				background-color: #e3e3e3;
			}
			.splitter {
				width: 5px;
				height: 100%;
				bottom: 0;
				left: 240px;
				position: absolute;
				overflow: hidden;
				background-color: #fff;
			}
			.pageContent{
				height: 100%;
				min-width: 768px;
				left: 246px;
				top: 0;
				right: 0;
				z-index: 3;
				padding-bottom: 30px;
				position: absolute;
			}
			.pageContainer{
				bottom: 0;
				left:0;
				right: 0;
				top: 53px;
				overflow: auto;
				position: absolute;
				width: 100%;
			}
			.footer {
				width: 100%;
				height: 30px;
				line-height: 30px;
				margin-top: 0;
				left: 0;
				right: 0;
				bottom: 0;
				position: absolute;
				z-index: 10;
				background-color:#DFDFDF;
			}
			.navbar-collapse{
				padding-left: 5px;
				padding-right: 5px;
			}
			.nav>li{
				text-align: center;
			}
			.nav>li>a{
				color:#444;
				margin: 0 5px;
			}
			.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover{
				background-color: #222222;
			}
			.dropdown-menu{
				min-width: 200px;
				margin-left: 40px;
				background-color: #E3E3E3;
			}
			.dropdown-menu>li>a{
				padding: 10px 15px;
			}
		</style>--%>
		<style>
			/*
 * Base structure
 */

			/* Move down content because we have a fixed navbar that is 50px tall */
			body {
				padding-top: 50px;
			}


			/*
             * Global add-ons
             */

			.sub-header {
				padding-bottom: 10px;
				border-bottom: 1px solid #eee;
			}

			/*
             * Top navigation
             * Hide default border to remove 1px line.
             */
			.navbar-fixed-top {
				border: 0;
			}

			/*
             * Sidebar
             */

			/* Hide for mobile, show later */
			.sidebar {
				display: none;
			}
			@media (min-width: 768px) {
				.sidebar {
					position: fixed;
					top: 51px;
					bottom: 0;
					left: 0;
					z-index: 1000;
					display: block;
					padding: 20px;
					overflow-x: hidden;
					overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
					background-color: #f5f5f5;
					border-right: 1px solid #eee;
				}
			}

			/* Sidebar navigation */
			.nav-sidebar {
				margin-right: -21px; /* 20px padding + 1px border */
				margin-bottom: 20px;
				margin-left: -20px;
			}
			.nav-sidebar > li > a {
				padding-right: 20px;
				padding-left: 20px;
			}
			.nav-sidebar > .active > a,
			.nav-sidebar > .active > a:hover,
			.nav-sidebar > .active > a:focus {
				color: #fff;
				background-color: #428bca;
			}


			/*
             * Main content
             */

			.main {
				padding: 20px;
			}
			@media (min-width: 768px) {
				.main {
					padding-right: 40px;
					padding-left: 40px;
				}
			}
			.main .page-header {
				margin-top: 0;
			}


			/*
             * Placeholder dashboard ideas
             */

			.placeholders {
				margin-bottom: 30px;
				text-align: center;
			}
			.placeholders h4 {
				margin-bottom: 0;
			}
			.placeholder {
				margin-bottom: 20px;
			}
			.placeholder img {
				display: inline-block;
				border-radius: 50%;
			}

		</style>
	</head>

	<%--<body>
		<div class="container-fluid">
			<!--顶部导航栏部分-->
			<nav class="navbar navbar-inverse">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" title="logoTitle" href="#">后台管理系统</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li role="presentation">
								<a href="#">当前用户：<span class="badge">${loginUser.username}</span></a>
							</li>
							<li>
								<a href="${ctx}/Admin/logOut">
									<span class="glyphicon glyphicon-lock"></span>退出登录</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- 中间主体内容部分 -->
			<div class="pageContainer">
				<!-- 左侧导航栏 -->
				<div class="pageSidebar">
					<ul class="nav nav-stacked nav-pills">
						<c:if test="${loginUser.type==2}">
							&lt;%&ndash;是卖家&ndash;%&gt;
							<li role="presentation">
								<a href="${pageContext.request.contextPath}/Home/Order" target="mainFrame">我的订单</a>

							</li>
							<li role="presentation">
								<a href="${pageContext.request.contextPath}/Shop" target="mainFrame">我的店铺</a>
							</li>
						</c:if>
						<c:if test="${loginUser.type==0}">
							&lt;%&ndash;是管理员&ndash;%&gt;
							<li role="presentation">
								<a href="#" target="mainFrame">用户管理</a>

							</li>
							<li role="presentation">
								<a href="#" target="mainFrame">商品管理</a>
							</li>
						</c:if>

						&lt;%&ndash;<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">
								导航链接4<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li>
									<a href="nav1.html" target="mainFrame">导航链接4-1</a>
								</li>
								<li>
									<a href="nav2.html" target="mainFrame">导航链接4-2</a>
								</li>
								<li>
									<a href="nav3.html" target="mainFrame">导航链接4-3</a>
								</li>
							</ul>
						</li>&ndash;%&gt;
					</ul>
				</div>
				<!-- 左侧导航和正文内容的分隔线 -->
				<div class="splitter"></div>
				<!-- 正文内容部分 -->
				<div class="pageContent">
					<iframe src="${ctx}/Admin/index" id="mainFrame" name="mainFrame" frameborder="0" width="100%"  height="100%" frameBorder="0"></iframe>
				</div>
			</div>
			<!-- 底部页脚部分 -->
			<div class="footer">
				<p class="text-center">
					农产品产销服务平台后台管理系统
				</p>
			</div>
		</div>
	</body>--%>
	<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${ctx}/Admin/main">后台管理系统</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li role="presentation">
						<a href="#">当前用户：<span class="badge">${loginUser.username}</span></a>
					</li>
					<li>
						<a href="${ctx}/Admin/logOut">
							<span class="glyphicon glyphicon-lock"></span>退出登录</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<c:if test="${loginUser.type==2}">
						<%--是卖家--%>
						<li role="presentation">
							<a href="${pageContext.request.contextPath}/Home/Order" target="mainFrame">我的订单</a>

						</li>
						<li role="presentation">
							<a href="${pageContext.request.contextPath}/Shop" target="mainFrame">我的店铺</a>
						</li>
					</c:if>
					<c:if test="${loginUser.type==0}">
						<%--是管理员--%>
						<li role="presentation">
							<a href="#" target="mainFrame">用户管理</a>

						</li>
						<li role="presentation">
							<a href="#" target="mainFrame">商品管理</a>
						</li>
					</c:if>
				</ul>

			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<iframe src="${ctx}/Admin/index" id="mainFrame" name="mainFrame" frameborder="0" width="100%"  height="100%" frameBorder="0"></iframe>
			</div>
		</div>
	</div>
	</body>
<script>
    $(".nav li").click(function() {
        $(".active").removeClass('active');
        $(this).addClass("active");
    });
</script>
</html>