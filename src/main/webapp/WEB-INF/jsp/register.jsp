<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>会员注册</title>
	<script src="${ctx}/js/register.js" type="text/javascript"></script>
	<style>
		body {
			margin-top: 20px;
			margin: 0 auto;
		}
		
		.carousel-inner .item img {
			width: 100%;
			height: 300px;
		}
		
		.container .row div {
			/* position:relative;
			 float:left; */
			
		}
		
		font {
			color: #3164af;
			font-size: 18px;
			font-weight: normal;
			padding: 0 10px;
		}
		.formtips{
			width: 200px;
			margin:2px;
			padding:2px;
		}
		.onError{
    		background:#FFE0E9 url(${pageContext.request.contextPath}/img/reg1.gif) no-repeat 0 center;
			padding-left:25px;
		}
		.onSuccess{
    		background:#E9FBEB url(${pageContext.request.contextPath}/img/reg2.gif) no-repeat 0 center;
			padding-left:25px;
		}
	</style>
</head>
<body>

	<%@ include file="/WEB-INF/jsp/header.jsp"%>

	<div class="container">
		<div class="page-header">
			<h1>会员注册</h1>
		</div>
		<div class="col-md-8 col-md-offset-2" >
			<%--<form class="form-horizontal" style="margin-top: 5px;"
					action="${pageContext.request.contextPath}/Home/regist"
					method="post">
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-6">
							<input type="text" name="username" class="bitian form-control"
								id="username" placeholder="请输入用户名">
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-6">
							<input type="password" name="password" class="bitian form-control"
								id="password" placeholder="请输入密码">
						</div>
					</div>
					<div class="form-group">
						<label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-6">
							<input type="password" class="bitian form-control" id="confirmpwd"
								placeholder="请输入确认密码">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail" class="col-sm-2 control-label">Email</label>
						<div class="col-sm-6">
							<input type="email" name="email" class="bitian form-control"
								id="inputEmail" placeholder="Email">
						</div>
					</div>
					<div class="form-group">
						<label for="usercaption" class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-6">
							<input type="text" name="name" class="bitian form-control"
								id="usercaption" placeholder="请输入姓名">
						</div>
					</div>
					<div class="form-group opt">
						<label for="inlineRadio1" class="col-sm-2 control-label">性别</label>
						<div class="col-sm-6">
							<label class="radio-inline"> <input type="radio"
								name="sex" id="inlineRadio1" value="男" checked="checked">
								男
							</label> <label class="radio-inline"> <input type="radio"
								name="sex" id="inlineRadio2" value="女"> 女
							</label>
						</div>
					</div>
					<div class="form-group">
						<label for="birthday" class="col-sm-2 control-label">出生日期</label>
						<div class="col-sm-6">
							<input type="date" class="bitian form-control" name="birthday" id="birthday">
						</div>
					</div>

					<div class="form-group">
						<label for="telephone" class="col-sm-2 control-label">电话</label>
						<div class="col-sm-6">
							<input type="text" class="bitian form-control" name="telephone" id="telephone">
						</div>
					</div>
					<div class="form-group">
						<label for="type" class="col-sm-2 control-label">账号分类</label>
						<div class="col-sm-6">
							<select class="form-control" name="type" id="type">
								<option value="1">客户</option>
								<option value="2">卖家</option>
							</select>
						</div>

					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" width="100" value="注册" name="submit"
								border="0"
								style="background: url('${pageContext.request.contextPath}/img/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
				    height:35px;width:100px;color:white;">
						</div>
					</div>
				</form>--%>
			<form class="form-horizontal">
				<div class="form-group has-success has-feedback">
					<label class="control-label col-sm-3" for="username">用户名</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="username" aria-describedby="usernameStatus">
						<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
						<span id="usernameStatus" class="sr-only">(success)</span>
					</div>
				</div>
				<div class="form-group has-error has-feedback">
					<label class="control-label col-sm-3" for="password">密码</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="password" aria-describedby="passwordStatus">
						<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
						<span id="passwordStatus" class="sr-only">(success)</span>
					</div>
				</div>
				<div class="form-group has-success has-feedback">
					<label class="control-label col-sm-3" for="confirmpwd">确认密码</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="confirmpwd" aria-describedby="confirmpwdStatus">
						<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
						<span id="confirmpwdStatus" class="sr-only">(success)</span>
					</div>
				</div>
				<div class="form-group has-success has-feedback">
					<label class="control-label col-sm-3" for="email">Email</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="email" aria-describedby="emailStatus">
						<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
						<span id="emailStatus" class="sr-only">(success)</span>
					</div>
				</div>
				<div class="form-group has-success has-feedback">
					<label class="control-label col-sm-3" for="name">姓名</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="name" aria-describedby="nameStatus">
						<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
						<span id="nameStatus" class="sr-only">(success)</span>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<%@include file="/WEB-INF/jsp/footer.jsp" %>

</body>
</html>




