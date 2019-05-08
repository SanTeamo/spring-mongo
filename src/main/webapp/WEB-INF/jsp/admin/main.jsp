<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>后台页面</title>
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
							<a href="${ctx}/Admin/userlist" target="mainFrame">用户管理</a>

						</li>
						<li role="presentation">
							<a href="${ctx}/Admin/productlist" target="mainFrame">商品管理</a>
						</li>
					</c:if>
					<li role="presentation">
						<a href="${ctx}/Admin/chart" target="mainFrame">商品销量</a>
					</li>
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