<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>店铺</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
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
				<div class="col-md-1">
					<div class="btn-group-vertical" role="group" aria-label="Vertical button group">
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">添加商品</button>

						<div class="modal fade bs-example-modal-lg in" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">

									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
										<h4 class="modal-title" id="myLargeModalLabel">添加商品</h4>
									</div>
									<form action="${ctx}/Product/addProduct" enctype="multipart/form-data" method="post">
										<div class="modal-body">
											<div class="form-group">
												<label for="pname">商品名</label>
												<input class="form-control" id="pname" placeholder="输入商品名" name="pname">
											</div>
											<div class="form-group">
												<label for="price">价格</label>
												<input class="form-control" id="price" placeholder="输入商品价格" name="price">
											</div>
											<div class="form-group">
												<label for="pdesc">商品描述</label>
												<textarea class="form-control" id="pdesc" placeholder="输入商品描述" name="pdesc"></textarea>
											</div>
											<div class="form-group">
												<label for="catId">商品分类</label>
												<select class="form-control" name="catId" id="catId">

												</select>
											</div>
											<div class="form-group">
												<label for="pimage">商品图片</label>
												<input type="file" id="pimage" name="pimagefile">
											</div>
											<div class="form-group">
												<label for="pdescImage">商品描述图片</label>
												<input type="file" id="pdescImage" name="pdescImagefile">
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
											<button type="submit" class="btn btn-primary">确认添加</button>
										</div>
									</form>
								</div><!-- /.modal-content -->
							</div><!-- /.modal-dialog -->
						</div>
						<button type="button" class="btn btn-default">占位</button>
						<div class="btn-group" role="group">
							<button id="btnGroupVerticalDrop1" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								下拉
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" aria-labelledby="btnGroupVerticalDrop1">
								<li><a href="#">占位</a></li>
								<li><a href="#">占位</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-11" >
					<c:forEach items="${page.content}" var="p">
						<div  class="col-md-2 col-sm-4 col-xs-6" style="text-align: center;height: 240px;">
							<a href="${pageContext.request.contextPath}/Product/catId/${p.catId}/id/${p.id}">
								<img src="${pageContext.request.contextPath}/products/${p.catId}/${p.pimage}" width="170" height="170" style="display: inline-block;" class="img-rounded img-responsive">
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