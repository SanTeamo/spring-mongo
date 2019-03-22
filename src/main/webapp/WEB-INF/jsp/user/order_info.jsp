<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>订单详情</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
	<style>
		.carousel-inner .item img {
			width: 100%;
			height: 300px;
		}
	</style>
</head>

<body>

<%@ include file="/WEB-INF/jsp/header.jsp" %>


<div class="container">
	<c:if test="${order.status<=1}">
		<div class="progress">
			<div class="progress-bar" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: ${(order.status+1)*50}%;">
					<%--<span class="sr-only">60% Complete</span>--%>
				<c:if test="${order.status==0}">
					填写收货信息
				</c:if>
				<c:if test="${order.status==1}">
					付款
				</c:if>
			</div>
		</div>
	</c:if>


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
						<c:if test="${order.status==4}">
							<th colspan="6">订单编号:${order.id}</th>
						</c:if>
						<c:if test="${order.status!=4}">
							<th colspan="5">订单编号:${order.id}</th>
						</c:if>
					</tr>
					<tr>
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
						<c:if test="${order.status==4}">
							<th>评价</th>
						</c:if>
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
							<c:if test="${order.status==4}">
								<td class="text-center">
									<input type="hidden" value="${item.pid}">
									<c:if test="${item.commented == false}">
										<button type="button" class="btn btn-info comment">评价</button>
									</c:if>
									<c:if test="${item.commented == true}">
										<button type="button" class="btn btn-info" disabled="disabled">已评价</button>
									</c:if>
								</td>
							</c:if>
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

			<%--填写收货信息--%>
			<c:if test="${order.status==0}">
				<div class="form-group row">
					<label for="address" class="col-sm-1 control-label">地址</label>
					<div class="col-sm-5">
						<input type="text" name="address" class="form-control" id="address" placeholder="请输入收货地址">
					</div>
				</div>
				<div class="form-group row">
					<label for="recipient" class="col-sm-1 control-label">收货人</label>
					<div class="col-sm-5">
						<input type="text" name="recipient" class="form-control" id="recipient" placeholder="请输收货人">
					</div>
				</div>
				<div class="form-group row">
					<label for="phone" class="col-sm-1 control-label">电话</label>
					<div class="col-sm-5">
						<input type="text" name="phone" class="form-control" id="phone" placeholder="请输入联系方式">
						<input type="hidden" name="id" value="${order.id}"/>
							<%--<input type="hidden" name="totalPrice" value="${order.totalPrice }"/>--%>
					</div>
				</div>

				<div class="text-center">
					<button type="button" class="btn btn-success confirm">确认信息</button>
				</div>

			</c:if>
			<c:if test="${order.status>0}">
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
				<c:if test="${order.status==1}">
					<div class="text-center">
						<button type="button" class="btn btn-danger pay">去付款</button>
					</div>
				</c:if>
				<c:if test="${order.status==2}">
					<div class="text-center">
						<h3>等待发货</h3>
					</div>
				</c:if>
				<c:if test="${order.status==3}">
					<div class="text-center">
						<h3>包裹在路上了！</h3>
						<button type="button" class="btn btn-success receive">签收</button>
					</div>
				</c:if>
				<c:if test="${order.status==5}">
					<div class="text-center">
						<h3>订单已完成</h3>
					</div>
				</c:if>


			</c:if>


			<hr/>
				<%-- <strong>选择银行：</strong>
                <p>
                    <br/>
                    <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked" />工商银行
                    <img src="${pageContext.request.contextPath}/img/bank_img/icbc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="BOC-NET-B2C" />中国银行
                    <img src="${pageContext.request.contextPath}/img/bank_img/bc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="ABC-NET-B2C" />农业银行
                    <img src="${pageContext.request.contextPath}/img/bank_img/abc.bmp" align="middle" />
                    <br/>
                    <br/>
                    <input type="radio" name="pd_FrpId" value="BOCO-NET-B2C" />交通银行
                    <img src="${pageContext.request.contextPath}/img/bank_img/bcc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="PINGANBANK-NET" />平安银行
                    <img src="${pageContext.request.contextPath}/img/bank_img/pingan.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="CCB-NET-B2C" />建设银行
                    <img src="${pageContext.request.contextPath}/img/bank_img/ccb.bmp" align="middle" />
                    <br/>
                    <br/>
                    <input type="radio" name="pd_FrpId" value="CEB-NET-B2C" />光大银行
                    <img src="${pageContext.request.contextPath}/img/bank_img/guangda.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C" />招商银行
                    <img src="${pageContext.request.contextPath}/img/bank_img/cmb.bmp" align="middle" />

                </p>
                <hr/> --%>
		</div>
	</form>
</div>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>

</body>
<script type="text/javascript">
	var form = $("#orderForm");
	$(".confirm").click(function () {
        $.post("/Home/Order/confirmOrder",
            form.serialize(),
            function(res) {
                var obj =  res;
                if(obj){
                    alert("信息填写成功！");
                    window.location.href="/Home/Order/id/${order.id}";
                }
            }, "json");
        return false;
    });

    $(".pay").click(function () {
        $.post("/Home/Order/payOrder",
            {orderId:"${order.id}"},
            function(res) {
                var obj =  res;
                if(obj){
                    alert("支付成功！");
                    window.location.href="/Home/Order/id/${order.id}";
                }
            }, "json");
        return false;
    })
    $(".receive").click(function () {
        $.post("/Home/Order/signOrder",
            {orderId:"${order.id}"},
            function(res) {
                var obj =  res;
                if(obj){
                    alert("签收成功！");
                    window.location.href="/Home/Order/id/${order.id}";
                }
            }, "json");
        return false;
    })
    $(".comment").click(function () {
        var pid = $(this).prev().val();
        window.location.href="/Evaluation/Comment/"+pid;
    })
</script>

</html>