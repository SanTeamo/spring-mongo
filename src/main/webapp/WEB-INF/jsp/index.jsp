﻿<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>农贸商城</title>
	</head>

	<body>
		<div class="container-fluid">
			<%--<img src="${ctx}/Image/mypictest">--%>

			<%@ include file="/WEB-INF/jsp/header.jsp" %>

			<!--
            	描述：轮播条
            -->
			<div class="container">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="${pageContext.request.contextPath}/img/ad/1.jpg">
							<div class="carousel-caption">

							</div>
						</div>
						<div class="item">
							<img src="${pageContext.request.contextPath}/img/ad/2.jpg">
							<div class="carousel-caption">

							</div>
						</div>
						<div class="item">
							<img src="${pageContext.request.contextPath}/img/ad/3.jpg">
							<div class="carousel-caption">

							</div>
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<!--
            	描述：广告部分
            -->
            <%--<div class="container-fluid">
				<img src="${pageContext.request.contextPath}/products/hao/ad.jpg" width="100%"/>
			</div>--%>
			<!--
            	描述：热门商品显示
            -->
			<div class="container-fluid" >
				<div class="col-md-12 row">
					<h2>热门商品&nbsp;&nbsp;</h2>
				</div>
				<!--左边大图部分-->
				<div class="col-md-2 hidden-sm hidden-xs" style="height: 480px;">
					<img src="${pageContext.request.contextPath}/products/index/middle01.jpg" width="100%" height="100%"/>
				</div>
				<!--
					右边商品项部分
				-->
				<div class="col-md-10">
					<%--<div class="col-md-6 hidden-sm hidden-xs" style="height: 240px;">
						<a href="#">
							<img src="${pageContext.request.contextPath}/products/hao/middle01.jpg" width="100%" height="100%">
						</a>
					</div>--%>

					<%--<c:forEach items="${hots}" var="p">
						<div class="col-md-2 col-sm-4 col-xs-6" style="text-align: center;height: 240px;">
							<a href="${pageContext.request.contextPath}/ProductServlet?method=findProductByPid&pid=${p.pid}">
								<img src="${pageContext.request.contextPath}/${p.pimage}" width="130" height="130" style="display: inline-block;">
							</a>
							<p><a href="${pageContext.request.contextPath}/ProductServlet?method=findProductByPid&pid=${p.pid}" style='color:#666'>${p.pname}</a></p>
							<p><font color="#E4393C" style="font-size:16px">&yen;${p.shop_price}</font></p>
						</div>
					</c:forEach>--%>
					<c:forEach  items="${hots}" var="p">
						<div  class="col-md-2 col-sm-4 col-xs-6" style="text-align: center;height: 240px;">
							<a href="${pageContext.request.contextPath}/Product/catId/${p.catId}/id/${p.id}">
								<img src="${pageContext.request.contextPath}/products/${p.pimage}" width="170" height="170" style="display: inline-block;" class="img-rounded img-responsive">
							</a>
							<p><a href="${pageContext.request.contextPath}/Product/catId/${p.catId}/id/${p.id}" style='color:green'>${fn:substring(p.pname, 0, 10) }...</a></p>
							<p><font color="#FF0000">商城价：&yen;${p.price}</font></p>
						</div>
					</c:forEach>
				</div>
			</div>		
			<%@include file="/WEB-INF/jsp/footer.jsp" %>
		</div>
	</body>

</html>