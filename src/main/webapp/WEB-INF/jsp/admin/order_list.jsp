<!doctype html>
<html>

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>订单列表</title>
</head>

<body>
	<div class="container-fluid">
		<div class="page-header">
			<h1>客户订单 <%--<small>全部订单</small>--%></h1>
		</div>
		<ul class="nav nav-pills nav-justified">
			<li id="allOrder" role="presentation"><a href="/Home/Order">全部订单</a></li>
			<li id="notdone" role="presentation"><a href="/Home/Order/notdone">未完成订单</a></li>
			<li id="done" role="presentation"><a href="/Home/Order/done">已完成订单</a></li>
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
									</c:if>
									<c:if test="${o.status==1}">
										<span class="label label-warning">客户未付款</span>
									</c:if>
									<c:if test="${o.status==2}">
										<span class="label label-success">客户已付款</span>
                                        <a href="${pageContext.request.contextPath}/Home/Order/id/${o.id}" class="btn btn-success btn-xs pull-right">发货</a>
                                    </c:if>
									<c:if test="${o.status==3}">
										<span class="label label-primary">待客户签收</span>
									</c:if>
									<c:if test="${o.status==4}">
										<span class="label label-primary">客户已签收</span>
									</c:if>
									<c:if test="${o.status==5}">
										<span class="label label-default">客户已评价</span>
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
</body>
<script type="text/javascript">
	$(function () {
	    /*var allOrder = $("#allOrder");
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
        })*/
    })
</script>
</html>