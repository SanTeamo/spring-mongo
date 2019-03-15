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
</head>

<body>

	<%@ include file="/WEB-INF/jsp/header.jsp"%>

	<div class="container">
		<div class="page-header">
			<h1>我的订单 <%--<small>全部订单</small>--%></h1>
		</div>
		<ul class="nav nav-pills nav-justified">
			<li role="presentation" class="active"><a href="/Home/Order">全部订单</a></li>
			<li role="presentation"><a href="/Home/Order/notdone">未完成订单</a></li>
			<li role="presentation"><a href="/Home/Order/done">已完成订单</a></li>
		</ul>
		<c:if test="${empty page.content}">
			<h1>没有任何东西~</h1>
		</c:if>
		<c:if test="${not empty page.content}">
			<div class="panel panel-default">
				<div class="panel-heading">订单列表</div>
				<%--<div class="panel-body">
					<p>...</p>
				</div>--%>
				<div class="table-responsive">
					<table class="table">
						<thead>
						<tr>
							<th>图片</th>
							<th>商品</th>
							<th>价格</th>
							<th>数量</th>
							<th>小计</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${page.content}" var="o">
							<tr>
								<th colspan="5">
									<a href="/Home/Order/id/${o.id}">订单编号:${o.id}</a>
									总金额:¥${o.totalPrice}元
									<c:if test="${o.status==0}">
										<a href="${pageContext.request.contextPath}/#">填写收货信息</a>
									</c:if>
									<c:if test="${o.status==1}">
										<a href="${pageContext.request.contextPath}/#">付款</a>
									</c:if>
									<c:if test="${o.status==2}">
										未发货
									</c:if>
									<c:if test="${o.status==3}">
										<a href="">签收</a>
									</c:if>
									<c:if test="${o.status==4}">
										<a href="">评价</a>
									</c:if>
									<c:if test="${o.status==5}">
										<a href="">已评价</a>
									</c:if>

								</th>
							</tr>
							<c:forEach items="${o.productWrappers}" var="item">
								<tr class="active">
									<td><input type="hidden" name="id" value="22">
										<img style="display: inline-block;" src="${pageContext.request.contextPath}/products/${item.catId}/${item.pimage}" height="60">
									</td>
									<td>
										<a target="_blank">${item.pname}</a>
									</td>
									<td>￥${item.price}</td>
									<td>${item.num}</td>
									<td>
										<span class="subtotal">￥<fmt:formatNumber type="number" value="${item.num*item.price}" pattern="0.00" maxFractionDigits="2"/></span>
									</td>

								</tr>
							</c:forEach>
						</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
		</c:if>

	<%@ include file="/WEB-INF/jsp/pageFile.jsp"%>

	</div>

	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>

</html>