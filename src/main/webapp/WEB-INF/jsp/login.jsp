<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员登录</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
	<style>
		/*body {
			padding-top: 40px;
			padding-bottom: 40px;
			background-color: #eee;
		}*/

		.form-signin {
			max-width: 330px;
			padding: 15px;
			margin: 0 auto;
		}
		/*.form-signin .form-signin-heading,
		.form-signin .checkbox {
			margin-bottom: 10px;
		}
		.form-signin .checkbox {
			font-weight: normal;
		}*/
		.form-signin .form-control {
			position: relative;
			height: auto;
			-webkit-box-sizing: border-box;
			-moz-box-sizing: border-box;
			box-sizing: border-box;
			padding: 10px;
			font-size: 16px;
		}
		.form-signin .form-control:focus {
			z-index: 2;
		}
		.form-signin input[type="text"] {
			margin-bottom: -1px;
			border-bottom-right-radius: 0;
			border-bottom-left-radius: 0;
		}
		.form-signin input[type="password"] {
			margin-bottom: 10px;
			border-top-left-radius: 0;
			border-top-right-radius: 0;
		}

	</style>
</head>
<body>

	<%@ include file="/WEB-INF/jsp/header.jsp"%>

	<div class="container">
			<%--<div class="col-md-5">
				<div style="width: 95%; border: 1px solid #E7E7E7; padding: 10px; border-radius: 5px; margin-top: 60px; background: #fff;">
					<font>会员登录</font>
					<div>${msg}</div>
					<form class="form-horizontal"
						action="${pageContext.request.contextPath}/Home/login"
						method="post">

						<div class="form-group">
							<label for="username" class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-6">
								<input type="text" name="username" class="form-control"
									id="username" placeholder="请输入用户名">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-6">
								<input type="password" name="password" class="form-control"
									id="inputPassword" placeholder="请输入密码">
							</div>
						</div>
						&lt;%&ndash; <div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">验证码</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="inputPassword3"
									placeholder="请输入验证码">
							</div>
							<div class="col-sm-3">
								<img src="${pageContext.request.contextPath}/img/captcha.jhtml" />
							</div>

						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label> <input type="checkbox"> 自动登录
									</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> <input
										type="checkbox"> 记住用户名
									</label>
								</div>
							</div>
						</div> &ndash;%&gt;
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<input type="submit" width="100" value="登录" name="submit"
									border="0"
									style="background: url('${pageContext.request.contextPath}/img/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
    height:35px;width:100px;color:white;">
							</div>
						</div>
					</form>
				</div>
			</div>--%>
			<form class="form-signin" action="${pageContext.request.contextPath}/Home/login" method="post">
				<h2 class="form-signin-heading">登录</h2><div>${msg}</div>
				<label for="inputUserName" class="sr-only">用户名</label>
				<input type="text" name="username" id="inputUserName" class="form-control" placeholder="请输入用户名" required="" autofocus="">
				<label for="inputPassword" class="sr-only">Password</label>
				<input type="password" name="password" id="inputPassword" class="form-control" placeholder="请输入密码" required="">
				<button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
			</form>
	</div>

	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>