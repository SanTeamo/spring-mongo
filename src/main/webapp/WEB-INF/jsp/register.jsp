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

	<div class="container" style="width:100%;background:url('${pageContext.request.contextPath}/img/regist_bg.jpg');">
		<div class="container-fluid">

			<div class="col-md-8" style="background: #fff; padding: 10px; margin: 30px; border: 7px solid #ccc;">
				<font>会员注册</font>USER REGISTER
				<form class="form-horizontal" style="margin-top: 5px;"
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
						<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
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
						<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
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
						<label for="date" class="col-sm-2 control-label">出生日期</label>
						<div class="col-sm-6">
							<input type="date" class="bitian form-control" name="birthday" id="birthday">
						</div>
					</div>

					<div class="form-group">
						<label for="date" class="col-sm-2 control-label">电话</label>
						<div class="col-sm-6">
							<input type="text" class="bitian form-control" name="telephone" id="telephone">
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
				</form>
			</div>

		</div>
	</div>
	
	<%@include file="/WEB-INF/jsp/footer.jsp" %>

</body>
</html>




