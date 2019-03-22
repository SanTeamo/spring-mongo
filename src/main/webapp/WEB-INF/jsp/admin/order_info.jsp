<!doctype html>
<html>

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>填写订单</title>
	<style>

		.carousel-inner .item img {
			width: 100%;
			height: 300px;
		}
	</style>
</head>

<body>
<div class="container-fluid">
	<form id="orderForm" method="post" >
		<div class="page-header">
			<h1>订单详情 <%--<small>全部订单</small>--%></h1>
		</div>
		<h3>商品信息</h3>
		<div class="panel panel-default">
			<div class="table-responsive">
				<table class="table">
					<thead>
					<tr class="warning">
						<th colspan="5">订单编号:${order.id}</th>
					</tr>
					<tr>
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${order.productWrappers}" var="item">
						<tr class="active">
							<td width="60" width="40%">
								<img style="display: inline-block;" src="${pageContext.request.contextPath}/products/${item.pimage}" height="60">
							</td>
							<td width="30%">
								<a target="_blank">${item.pname}</a>
							</td>
							<td width="20%">
								￥${item.price}
							</td>
							<td width="10%">
									${item.num}
							</td>
							<td width="15%">
								<span class="subtotal">
									￥<fmt:formatNumber type="number" value="${item.num*item.price}" pattern="0.00" maxFractionDigits="2"/>
								</span>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>

		</div>

		<div style="text-align:center;">

			商品总价: <strong style="color:#ff6600;">
			￥<fmt:formatNumber type="number" value="${order.totalPrice }" pattern="0.00" maxFractionDigits="2"/>元
		</strong>
		</div>

		<div>
			<hr/>
			<h3>收货信息</h3>
			<div class="panel panel-default">
				<div class="panel-heading">收货人</div>
				<div class="panel-body">
					${order.recipient}
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">地址</div>
				<div class="panel-body">
						${order.address}
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">电话</div>
				<div class="panel-body">
						${order.phone}
				</div>
			</div>

			<c:if test="${order.status==0}">
				<div class="text-center">
					<h3>等待客户填写相关信息</h3>
				</div>
			</c:if>
			<c:if test="${order.status==1}">
				<div class="text-center">
					<h3>等待客户付款</h3>
				</div>
			</c:if>
			<c:if test="${order.status==2}">
				<div class="text-center">
					<button type="button" class="btn btn-danger sendout">发货</button>
				</div>
			</c:if>
			<c:if test="${order.status==3}">
				<div class="text-center">
					<h3>包裹在路上了！</h3>
				</div>
			</c:if>
			<c:if test="${order.status==4}">
				<div class="text-center">
					<h3>等待客户评价</h3>
				</div>
			</c:if>
			<c:if test="${order.status==5}">
				<div class="text-center">
					<h3>订单已完成</h3>
				</div>
			</c:if>


			<hr/>
		</div>
	</form>
</div>

</body>
<script type="text/javascript">
	$(".sendout").click(function () {
        $.post("/Home/Order/sendOut",
            {orderId:"${order.id}"},
            function(res) {
                var obj =  res;
                if(obj){
                    alert("发货成功！");
                    window.location.href="/Home/Order/id/${order.id}";
                }
            }, "json");
        return false;
    })
</script>

</html>