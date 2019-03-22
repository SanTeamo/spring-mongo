<!doctype html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>店铺</title>
	</head>

	<body>
			<%@ include file="/WEB-INF/jsp/header.jsp" %>

			<div class="container">
				<div class="page-header">
					<h1>店铺商品</h1>
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
							<a href="${pageContext.request.contextPath}/Product/catId/${p.catId}/id/${p.id}">
								<img src="${pageContext.request.contextPath}/products/${p.pimage}" width="170" height="170" style="display: inline-block;" class="img-rounded img-responsive">
							</a>
							<p><a href="${pageContext.request.contextPath}/Product/catId/${p.catId}/id/${p.id}" style='color:green'>${fn:substring(p.pname, 0, 10) }...</a></p>
							<p><font color="#FF0000">商城价：&yen;${p.price}</font></p>
						</div>
					</c:forEach>
					<%@ include file="/WEB-INF/jsp/pageFile.jsp" %>

				</div>

			</c:if>
			</div>

		<%@ include file="/WEB-INF/jsp/footer.jsp" %>

	</body>

</html>