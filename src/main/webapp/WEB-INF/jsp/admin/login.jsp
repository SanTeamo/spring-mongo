<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员登录</title>
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

	<div class="container">
			<form class="form-signin" action="${ctx}/Admin/login" method="post">
				<h2 class="form-signin-heading">后台登录</h2><div>${msg}</div>
				<label for="inputUserName" class="sr-only">用户名</label>
				<input type="text" name="username" id="inputUserName" class="form-control" placeholder="请输入用户名" required="" autofocus="">
				<label for="inputPassword" class="sr-only">Password</label>
				<input type="password" name="password" id="inputPassword" class="form-control" placeholder="请输入密码" required="">
				<button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
			</form>
	</div>
</body>
</html>