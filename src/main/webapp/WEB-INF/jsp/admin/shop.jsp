<!doctype html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>店铺</title>
		<script src="${ctx}/js/shop.js" type="text/javascript"></script>
	</head>

	<body>

	<div class="container-fluid">
		<div class="page-header">
			<h1>店铺商品</h1>
		</div>
		<div class="col-md-1">
			<div class="btn-group-vertical" role="group" aria-label="Vertical button group">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".addModalLabel">添加商品</button>

				<div class="modal fade bs-example-modal-lg in addModalLabel" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">

							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
								<h4 class="modal-title" id="addModalLabel">添加商品</h4>
							</div>
							<form action="${ctx}/Product/addProduct" enctype="multipart/form-data" method="post">
								<div class="modal-body">
									<div class="form-group has-feedback">
										<label for="pname">商品名</label>
										<input class="form-control bitian" id="pname" placeholder="输入商品名" name="pname">
									</div>
									<div class="form-group has-feedback">
										<label for="price">价格</label>
										<input class="form-control bitian" id="price" placeholder="输入商品价格" name="price">
									</div>
									<div class="form-group has-feedback">
										<label for="pdesc">商品描述</label>
										<textarea class="form-control bitian" id="pdesc" placeholder="输入商品描述" name="pdesc"></textarea>
									</div>
									<div class="form-group">
										<label for="catId">商品分类</label>
										<select class="form-control cate" name="catId" id="catId">

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
				<%--<button type="button" class="btn btn-default">占位</button>
				<div class="btn-group" role="group">
					<button id="btnGroupVerticalDrop1" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						下拉
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" aria-labelledby="btnGroupVerticalDrop1">
						<li><a href="#">占位</a></li>
						<li><a href="#">占位</a></li>
					</ul>
				</div>--%>
			</div>
		</div>
		<div class="col-md-11" >
			<c:if test="${empty page.content}">
				<div class="row" style="width:100%;margin:0 auto;">
					<div class="col-md-12">
						<h1>暂无商品信息</h1>
					</div>
				</div>
			</c:if>
			<c:if test="${not empty page.content}">
				<c:forEach items="${page.content}" var="p">
					<div  class="col-md-2 col-sm-4 col-xs-6" style="text-align: center;height: 240px;">
						<input type="hidden" class="pid" value="${p.id}">
						<a href="<%--javascript:void(0)--%>${ctx}/Product/edit/${p.id}" <%--data-toggle="modal" data-target=".editModalLabel"--%>>
							<img src="${pageContext.request.contextPath}/products/${p.pimage}" width="170" height="170" style="display: inline-block;" class="img-rounded img-responsive">
						</a>
						<p><font style='color:green'>${fn:substring(p.pname, 0, 10) }...</font></p>
						<%--<p><font color="#FF0000">商城价：&yen;${p.price}</font></p>--%>
						<a href="${ctx}/Product/edit/${p.id}" type="button" class="btn btn-primary edit">编辑</a>
						<button type="button" class="btn btn-warning delete">删除</button>

					</div>
				</c:forEach>
				<%@ include file="/WEB-INF/jsp/pageFile.jsp" %>
			</c:if>
		</div>
	</div>

	</body>
	<script>
        $(function(){
            var url="/Category/findAllCats";
            var selectCatId = $(".cate");
            $.post(url,function(data){
                $.each(data,function(i,obj){
                    var option = "<option value='"+obj.catId+"'>"+obj.catName+"</option>";
                    selectCatId.append(option);
                });

            },"json");
        });

        $(".delete").click(function(){

            var pid=$(this).parent().find(".pid").val();

            if(confirm("确认删除?")){
                //alert(pid);
                $.ajax({
                    url:"/Admin/deleteProduct",
                    data:{pid:pid},
                    type:"post",
                    dataType:"json",
                    async:false,
                    success:function (result) {
                        if (result) {
                            alert("删除成功！");
                            window.location.href = "/Shop";
                        }else {
                            alert("删除失败，请稍后再试！");
                        }
                    }
                });
            }
        });
	</script>
</html>