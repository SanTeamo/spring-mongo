<!doctype html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>商品列表</title>
	</head>

	<body>
	<div class="page-header">
		<h1>商品列表 <%--<small>全部订单</small>--%></h1>
	</div>
        <c:if test="${empty page.content}">
        	<div class="row" style="width:100%;margin:0 auto;">
        		<div class="col-md-12">
        			<h1>暂无商品信息</h1>
        		</div>
        	</div>	
        </c:if>
        
        <c:if test="${not empty page.content}">
	        <div class="col-md-12" >
	          <c:forEach items="${page.content}" var="p">
				<div  class="col-md-2 col-sm-4 col-xs-6" style="text-align: center;height: 240px;">
					<a href="<%--javascript:void(0)--%>${ctx}/Product/edit/${p.id}" <%--data-toggle="modal" data-target=".editModalLabel"--%>>
						<img src="${pageContext.request.contextPath}/products/${p.pimage}" width="170" height="170" style="display: inline-block;" class="img-rounded img-responsive">
					</a>
					<p><font style='color:green'>${fn:substring(p.pname, 0, 10) }...</font></p>
					<p><font color="#FF0000">商城价：&yen;${p.price}</font></p>
				</div>
			  </c:forEach>
				<%@ include file="/WEB-INF/jsp/pageFile.jsp" %>

			</div>

        </c:if>

	</body>

</html>