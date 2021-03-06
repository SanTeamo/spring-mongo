﻿<!doctype html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>商品列表</title>
	</head>

	<body>
			<%@ include file="/WEB-INF/jsp/header.jsp" %>
        <c:if test="${empty page.content}">
        	<div class="row" style="width:100%;margin:0 auto;">
        		<div class="col-md-12">
        			<h1>暂无商品信息</h1>
        		</div>
        	</div>	
        </c:if>
        
        
        <c:if test="${not empty page.content}">
	        <div class="col-md-12" >
				<div class="col-md-12">
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/index">首页</a></li>
					</ol>
				</div>
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

		<!--
       		商品浏览记录:
        -->
		<%-- <div style="width:1210px;margin:0 auto; padding: 0 9px;border: 1px solid #ddd;border-top: 2px solid #999;height: 246px;">

			<h4 style="width: 50%;float: left;font: 14px/30px " 微软雅黑 ";">浏览记录</h4>
			<div style="width: 50%;float: right;text-align: right;"><a href="">more</a></div>
			<div style="clear: both;"></div>

			<div style="overflow: hidden;">

				<ul style="list-style: none;">
					<li style="width: 150px;height: 216;float: left;margin: 0 8px 0 0;padding: 0 18px 15px;text-align: center;"><img src="${pageContext.request.contextPath}/products/1/cs10001.jpg" width="130px" height="130px" /></li>
				</ul>

			</div>
		</div> --%>

		<%@ include file="/WEB-INF/jsp/footer.jsp" %>

	</body>

</html>