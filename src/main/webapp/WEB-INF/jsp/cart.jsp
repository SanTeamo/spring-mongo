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
		<!-- 引入自定义css文件 style.css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"/>
		<%--<style>
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
		</style>--%>
	</head>

	<body>

		
			<%@ include file="/WEB-INF/jsp/header.jsp" %>


		<div class="container">
			<c:if test="${empty cart.cartItemWrappers }">
				<div class="row">
					<div class="col-md-12">
						<h1>购物车空空如也，快去逛逛吧~</h1>
					</div>
				</div>
			</c:if>

			<c:if test="${not empty cart.cartItemWrappers }">
					<div class="row">
						<div style="margin:0 auto; margin-top:10px;width:950px;">
							<strong style="font-size:16px;margin:5px 0;">购物车</strong>
							<table class="table table-bordered">
								<tbody>
									<tr class="warning">
										<th><input class="checkAll" type="checkbox">全选</th>
										<th>图片</th>
										<th>商品</th>
										<th>价格</th>
										<th>数量</th>
										<th>小计</th>
										<th>操作</th>
									</tr>
								<c:forEach items="${cart.cartItemWrappers}" var="item" varStatus="status">
									<tr class="active">
										<input type="hidden" name="cartItems[${ status.index }].pid" value="${item.product.id}" class="pid">
										<td width="10%" >
											<input type="checkbox" class="check">
										</td>
										<td width="10%">
											<img style="display: inline-block;" src="${pageContext.request.contextPath}/products/${item.product.catId}/${item.product.pimage}" height="60">
										</td>
										<td width="20%">
											<a target="_blank">${item.product.pname}</a>
										</td>
										<td width="15%">
											<span>￥<span class="price">${item.product.price}</span></span>
										</td>
										<td width="20%">
											<div class="input-group">
												<div class="glyphicon glyphicon-minus input-group-addon"></div>
												<input type="text" class="form-control num" name="cartItems[${ status.index }].num" value="${item.num}">
												<div class="glyphicon glyphicon-plus input-group-addon"></div>
											</div>
										</td>
										<td width="20%">
											￥<span class="subtotal"><fmt:formatNumber type="number" value="${item.num*item.product.price}" pattern="0.00" maxFractionDigits="2"/></span>
										</td>
										<td>
											<button class="btn btn-default delete">删除</button>
										</td>
									</tr>
								  </c:forEach>
								</tbody>
							</table>
						</div>
					</div>
		
					<div style="margin-right:130px;">
						<div style="text-align:right;">
							<%--<em style="color:#ff6600;">登录后确认是否享有优惠&nbsp;&nbsp;</em>--%>
							商品共: <strong style="color:#ff6600;"><span class="totalNum">0</span>件</strong>&nbsp;
							商品金额: <strong style="color:#ff6600;">￥<span class="totalPrice">0</span>元</strong>
						</div>
						<div style="text-align:right;margin-top:10px;margin-bottom:10px;">
							<a href="${pageContext.request.contextPath}/Home/Cart/clearCart" id="clear" class="clear">清空购物车</a>
							<button id="submitOrder" width="100" border="0" style="background: url('${pageContext.request.contextPath}/img/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
									height:35px;width:100px;color:white;">提交订单</button>
						</div>
					</div>
			
			</c:if>


		</div>

		<%@ include file="/WEB-INF/jsp/footer.jsp" %>
	</body>
</html>