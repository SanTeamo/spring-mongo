<!doctype html>
<html>

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>会员登录</title>
</head>

<body>

	<%@ include file="/WEB-INF/jsp/header.jsp"%>

	<div class="container">
		<div class="page-header">
			<h1>我的订单 <%--<small>全部订单</small>--%></h1>
		</div>
		<ul class="nav nav-pills nav-justified">
			<li id="allOrder" role="presentation"<c:if test="${activeTarget == 'all'}">class="active"</c:if>><a href="/Home/Order">全部订单</a></li>
			<li id="notdone" role="presentation"<c:if test="${activeTarget == 'notdone'}">class="active"</c:if>><a href="/Home/Order/notdone">未完成订单</a></li>
			<li id="done" role="presentation"<c:if test="${activeTarget == 'done'}">class="active"</c:if>><a href="/Home/Order/done">已完成订单</a></li>
		</ul>
		<c:if test="${empty page.content}">
			<h1>没有任何东西~</h1>
		</c:if>
		<c:if test="${not empty page.content}">
			<div class="panel panel-default">
				<div class="panel-heading">订单列表 / 共${page.totalElements}个订单</div>
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
								<th class="warning" colspan="5">

									<c:if test="${o.status==0}">
										<span class="label label-default">未填写信息</span>
										<a href="${pageContext.request.contextPath}/Home/Order/id/${o.id}" class="btn btn-success btn-xs pull-right">填写收货信息</a>
									</c:if>
									<c:if test="${o.status==1}">
										<span class="label label-warning">待付款</span>
										<a href="${pageContext.request.contextPath}/Home/Order/id/${o.id}" class="btn btn-success btn-xs pull-right">付款</a>
									</c:if>
									<c:if test="${o.status==2}">
										<span class="label label-success">待发货</span>
									</c:if>
									<c:if test="${o.status==3}">
										<span class="label label-primary">待签收</span>
										<a href="${pageContext.request.contextPath}/Home/Order/id/${o.id}" class="btn btn-success btn-xs pull-right">签收</a>
									</c:if>
									<c:if test="${o.status==4}">
										<span class="label label-primary">待评价</span>
										<a href="${pageContext.request.contextPath}/Home/Order/id/${o.id}" class="btn btn-success btn-xs pull-right">评价</a>
									</c:if>
									<c:if test="${o.status==5}">
										<span class="label label-default">已评价</span>
									</c:if>
									总金额:¥<fmt:formatNumber type="number" value="${o.totalPrice}" pattern="0.00" maxFractionDigits="2"/>元
									<a href="/Home/Order/id/${o.id}">订单编号:${o.id}</a>
								</th>
							</tr>
							<c:forEach items="${o.productWrappers}" var="item">
								<tr class="active">
									<td>
										<img style="display: inline-block;" src="${pageContext.request.contextPath}/products/${item.pimage}" height="60">
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
<script type="text/javascript">
	$(function () {
	    var allOrder = $("#allOrder");
	    var notdone = $("#notdone");
	    var done = $("#done");
		allOrder.click(function () {
			$(this).addClass("active");
			notdone.removeClass("active");
            done.removeClass("active");
        })
        notdone.click(function () {
            $(this).addClass("active");
            allOrder.removeClass("active");
            done.removeClass("active");
        })
        done.click(function () {
            $(this).addClass("active");
            notdone.removeClass("active");
            allOrder.removeClass("active");
        })
    })
</script>
</html>