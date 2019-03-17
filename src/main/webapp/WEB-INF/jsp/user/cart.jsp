<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>购物车</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/cart.js" type="text/javascript"></script>
	</head>

	<body>

		
			<%@ include file="/WEB-INF/jsp/header.jsp" %>


		<div class="container">
			<%--<div class="alert alert-danger alert-dismissible fade in" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
				<h4>确认清空购物车？</h4>
				<p>
					<button type="button" class="btn btn-danger">确认</button>
					<button type="button" class="btn btn-default">取消</button>
				</p>
			</div>--%>
			<div class="page-header">
				<h1>我的购物车</h1>
			</div>
			<c:if test="${empty cart.productWrappers }">
				<div class="row">
					<div class="col-md-12">
						<h1>购物车空空如也，快去逛逛吧~</h1>
					</div>
				</div>
			</c:if>

			<c:if test="${not empty cart.productWrappers }">
					<div class="panel panel-default table-responsive">
						<div class="panel-heading">购物车</div>
						<table class="table table-bordered">
							<tbody>
								<thead>
								<tr>
									<th><input class="checkAll" type="checkbox">全选</th>
									<th>图片</th>
									<th>商品</th>
									<th>价格</th>
									<th>数量</th>
									<th>小计</th>
									<th>操作</th>
								</tr>
								</thead>
							<c:forEach items="${cart.productWrappers}" var="item">
								<tr class="active">
									<input type="hidden" value="${item.pid}" class="pid">
									<input type="hidden" value="${item.sellerUserName}" class="sellerUserName">
									<td width="10%" >
										<input type="checkbox" class="check">
									</td>
									<td width="10%">
										<img style="display: inline-block;" src="${pageContext.request.contextPath}/products/${item.catId}/${item.pimage}" height="60">
									</td>
									<td width="20%">
										<a target="_blank">${item.pname}</a>
									</td>
									<td width="15%">
										<span>￥<span class="price">${item.price}</span></span>
									</td>
									<td width="20%">
										<div class="input-group">
											<div class="glyphicon glyphicon-minus input-group-addon"></div>
											<input type="text" class="form-control num" value="${item.num}">
											<div class="glyphicon glyphicon-plus input-group-addon"></div>
										</div>
									</td>
									<td width="20%">
										￥<span class="subtotal"><fmt:formatNumber type="number" value="${item.num*item.price}" pattern="0.00" maxFractionDigits="2"/></span>
									</td>
									<td>
										<button class="btn btn-default delete">删除</button>
									</td>
								</tr>
							  </c:forEach>
							</tbody>
						</table>
					</div>
		
					<div style="margin-right:130px;">
						<div style="text-align:right;">
							<%--<em style="color:#ff6600;">登录后确认是否享有优惠&nbsp;&nbsp;</em>--%>
							商品共: <strong style="color:#ff6600;"><span class="totalNum">0</span>件</strong>&nbsp;
							商品金额: <strong style="color:#ff6600;">￥<span class="totalPrice">0</span>元</strong>
						</div>
						<div class="pull-right" style="margin-top:10px;margin-bottom:10px;">
							<%--<a href="${pageContext.request.contextPath}/Home/Cart/clearCart" id="clear" class="clear">清空购物车</a>--%>
							<button id="clear" class="btn btn-default">清空购物车</button>
							<button id="submitOrder" class="btn btn-default">提交订单</button>
							<%--<button  width="100" border="0" style="background: url('${pageContext.request.contextPath}/img/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
									height:35px;width:100px;color:white;">提交订单</button>--%>
						</div>
					</div>
			
			</c:if>


		</div>

		<%@ include file="/WEB-INF/jsp/footer.jsp" %>
	</body>
</html>