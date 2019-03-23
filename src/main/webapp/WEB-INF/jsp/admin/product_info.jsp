<!doctype html>
<html>

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>商品详情信息</title>
	<script src="${pageContext.request.contextPath}/js/productinfo.js" type="text/javascript"></script>
</head>

<body>
	<div class="container-fluid">
		<div class="page-header">
			<h1>编辑商品</h1>
		</div>
		<form action="${ctx}/Product/updateProduct" enctype="multipart/form-data" method="post">
			<input type="hidden" value="${product.id}" name="id">
			<input type="hidden" value="${product.id}" name="">
			<div class="form-group">
				<label for="pname">商品名</label>
				<input class="form-control bitian" id="pname" value="${product.pname}" name="pname">
			</div>
			<div class="form-group">
				<label for="price">价格</label>
				<input class="form-control bitian" id="price" value="${product.price}" name="price">
			</div>
			<div class="form-group">
				<label for="pdesc">商品描述</label>
				<textarea class="form-control" id="pdesc" placeholder="${product.pdesc}" name="pdesc"></textarea>
			</div>
			<div class="form-group">
				<label for="catId">商品分类</label>
				<select class="form-control" name="catId" id="catId">

				</select>
			</div>
			<div class="form-group col-md-2">
				<label for="pimage">商品图片</label>
				<input type="file" id="pimage" name="pimagefile">
				<img class="img-responsive" src="${ctx}/products/${product.pimage}">
			</div>
			<div class="form-group col-md-2">
				<label for="pdescImage">商品描述图片</label>
				<input type="file" id="pdescImage" name="pdescImagefile">
				<img class="img-responsive" src="${ctx}/products/${product.pdescImage}">
			</div>
			<button type="submit" class="btn btn-primary pull-right">确认修改</button>

		</form>
	</div>
</body>
<script>
    $(function(){
        var url="/Category/findAllCats";
        var selectCatId = $("#catId");
        $.post(url,function(data){
            $.each(data,function(i,obj){
                var option = "<option value='"+obj.catId+"'>"+obj.catName+"</option>";
                if (${product.catId} == obj.catId ) {
                    option = "<option value='"+obj.catId+"' selected='selected'>"+obj.catName+"</option>";
                }
                selectCatId.append(option);
            });

        },"json");
    });
</script>
</html>