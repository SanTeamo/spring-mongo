<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>会员登录</title>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/css/bootstrap.min.css"
		type="text/css" />
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"
		type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
		type="text/javascript"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 引入自定义css文件 style.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />
</head>

<body>

	<%@ include file="/WEB-INF/jsp/header.jsp"%>

	<div class="container">
		<div class="row">

			<div style="margin: 0 auto; margin-top: 10px; width: 100%;">
				<strong>我的订单</strong>
				<table class="table table-bordered">
					<c:if test="${empty page.content}">
						<h1>没有任何东西~</h1>
					</c:if>
					<c:forEach items="${page.content}" var="o">
						<tbody>
							<tr class="success">
								<th colspan="5">订单编号:${o.id} 总金额:¥${o.totalPrice}元
									<c:if test="${o.status==0}">
										<a href="${pageContext.request.contextPath}/OrderServlet?method=findOrderByOid&oid=${o.id}">付款</a>
									</c:if>
									<c:if test="${o.status==1}">
										<a href="${pageContext.request.contextPath}/OrderServlet?method=findOrderByOid&oid=${o.id}">付款</a>
									</c:if>
									<c:if test="${o.status==2}">未发货</c:if>
									<c:if
										test="${o.status==3}">
										<a href="">签收</a>
									</c:if>
									<c:if test="${o.status==4}">结束</c:if>
								</th>
							</tr>
							<tr class="warning">
								<th>图片</th>
								<th>商品</th>
								<th>价格</th>
								<th>数量</th>
								<th>小计</th>
							</tr>
							<c:forEach items="${o.cartItems}" var="item">
								<tr class="active">
									<%--<td width="60" width="40%"><input type="hidden" name="id"
										value="22"> <img
										src="${pageContext.request.contextPath}/${item.product.pimage}"
										width="70" height="60"></td>
									<td width="30%"><a target="_blank">${item.product.pname}</a>
									</td>
									<td width="20%">￥${item.product.shop_price}</td>
									<td width="10%">${item.quantity}</td>
									<td width="15%"><span class="subtotal">￥${item.total}</span>
									</td>--%>
										<td width="60" width="40%"><input type="hidden" name="id"
																		  value="22"> <img
												src="${pageContext.request.contextPath}/#"
												width="70" height="60"></td>
										<td width="30%"><a target="_blank">${item.pid}</a>
										</td>
										<td width="20%">￥${item.pid}</td>
										<td width="10%">${item.num}</td>
										<td width="15%"><span class="subtotal">￥${o.totalPrice}</span>
										</td>
								</tr>
							</c:forEach>
						</tbody>
					</c:forEach>
				</table>
				<%@ include file="/WEB-INF/jsp/pageFile.jsp"%>
			</div>
		</div>

	</div>

	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>

</html>