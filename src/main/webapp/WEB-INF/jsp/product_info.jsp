﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>商品详情信息</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>

	<style>
		/*body {
            margin-top: 20px;
            margin: 0 auto;
        }*/

		.carousel-inner .item img {
			width: 100%;
			height: 300px;
		}
		li img{
			float: left;
		}
		ul.nav-tabs{
			width: 140px;
			margin-top: 20px;
			border-radius: 4px;
			border: 1px solid #ddd;
			box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
		}
		/*ul.nav-tabs li{
            margin: 0;
            border-top: 1px solid #ddd;
        }
        ul.nav-tabs li:first-child{
            border-top: none;
        }
        ul.nav-tabs li a{
            margin: 0;
            padding: 8px 16px;
            border-radius: 0;
        }
        ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover{
            color: #fff;
            background: #0088cc;
            border: 1px solid #0088cc;
        }
        ul.nav-tabs li:first-child a{
            border-radius: 4px 4px 0 0;
        }
        ul.nav-tabs li:last-child a{
            border-radius: 0 0 4px 4px;
        }*/
		ul.nav-tabs.affix{
			top: 30px; /* Set the top position of pinned element */
		}
	</style>
</head>

<body data-spy="scroll" data-target="#myScrollspy" >
<%@ include file="/WEB-INF/jsp/header.jsp" %>

<div class="container">

	<div class="container" style="width:100%;margin:0 auto;">
		<div class="col-md-12 visible-md visible-lg " style="border: 1px solid #e4e4e4;width:100%;padding:10px;margin-bottom:10px;">
			<a href="${pageContext.request.contextPath}/">首页&nbsp;&nbsp;&gt;</a>
		</div>

		<%--<div style="margin:0 auto;width:100%;">--%>
		<div class="col-md-12">

			<div class="col-md-4">
				<img class="img-rounded img-responsive" src="${pageContext.request.contextPath}/products/${product.catId}/${product.pimage}">
			</div>

			<div class="col-md-6">
				<div><h4><strong>${product.pname}</strong></h4></div>
				<div style="border-bottom: 1px dotted #dddddd;width:350px;margin:10px 0 10px 0;">
					<div>编号:${product.id}</div>
				</div>

				<div style="padding:10px;border:1px solid #e7dbb1;background-color: #fffee6;margin:10px 0 10px 0;">
					价格<strong style="color:#ef0101;font-size: 30px"> ￥${product.price} 元/斤</strong>
					<p style="margin-top: 10px">累计销量：${product.sales}</p>
				</div>

				<%--<div style="margin:10px 0 10px 0;">促销: <a target="_blank" title="限时抢购 (2014-07-30 ~ 2015-01-01)" style="background-color: #f07373;">限时抢购</a> </div>--%>

				<div>
					<form id="quantityForm" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/Home/Cart/addToCart">
						<div class="form-group form-group-lg">
							<label class="col-xs-4 control-label" for="num">购买数量:</label>
							<!-- 购买数量-->
							<div class="col-xs-4">
								<div class="input-group">
									<div class="glyphicon glyphicon-minus input-group-addon"></div>
									<input id="num" type="text" class="form-control" name="num" value="1">
									<div class="glyphicon glyphicon-plus input-group-addon"></div>
								</div>
							</div>
						</div>
						<!-- 向服务端发送 商品pid-->
						<input type="hidden" name="pid" value="${product.id}"/>
						<div style="margin:20px 0 10px 0;;text-align: center;">
							<%--加入到购物车 --%>
							<!-- 取消链接的默认行为 -->
							<%--<a href="javascript:void(0)">
								<input class="btn btn-default addToCart" style="background: url('${pageContext.request.contextPath}/img/product.gif') no-repeat scroll 0 -600px rgba(0, 0, 0, 0);height:36px;width:127px;" value="加入购物车" type="button">
							</a>--%>
								<a href="javascript:void(0)" class="btn btn-default addToCart">加入购物车</a>
						</div>
					</form>
				</div>

			</div>
			<div class="col-md-2" style="background-color:#d3d3d3;padding:10px 10px">
				卖家：${product.ownerUserName}
			</div>
		</div>
		<div class="clear"></div>
		<%--<div style="margin:0 auto;">
            <div style="background-color:#d3d3d3;padding:10px 10px;margin:10px 0 10px 0;">
                <strong>商品介绍</strong>
                <h3>${product.pdesc}</h3>
                <img src="${pageContext.request.contextPath}/products/${product.catId}/${product.pdescImage}" style="width: 300px;height: 300px">
            </div>
        </div>--%>
	</div>

	<div class="col-md-12 " id="top-nav" style="background-color: lightgrey;border: 1px solid darkgrey;z-index: 9999">
		<nav>
			<ul class="list-inline nav nav-pills">
				<li><a href="#section1">商品介绍</a></li>
				<li><a href="#section2">商品详情</a></li>
				<li><a href="#section3">商品评价</a></li>
			</ul>
		</nav>
	</div>
	<div class="col-md-12" id="productDesc">
		<div class="col-sm-12">
			<div class="col-sm-9">
				<h2 id="section1" style="border-bottom: 1px solid palevioletred">商品介绍</h2>
				<div style="border: 1px solid darkgrey">
					<h3>${product.pdesc}</h3>
					<c:forEach var="i" begin="1" end="10">
						<h3>${product.pdesc}${i}</h3>
					</c:forEach>
				</div>

				<h2 id="section2" style="border-bottom: 1px solid palevioletred">商品详情</h2>
				<div style="border: 1px solid darkgrey" >
					<img class="col-xs-12" src="${pageContext.request.contextPath}/products/${product.catId}/${product.pdescImage}">
				</div>

				<h2 id="section3" style="border-bottom: 1px solid palevioletred">商品评价</h2>
				<div style="border: 1px solid darkgrey" id="comments" class="col-xs-12">
					<%--评论ID：${product.evalId}--%>
					<c:forEach items="${comments}" var="comment" >
						<div class="col-xs-12" style="border: 1px solid darkgrey">
							<div class="col-xs-3">
								买家：${comment.username}
							</div>
							<div class="col-xs-9">
								<div class="col-xs-12">
									评分：${comment.score}
								</div>
								<div class="col-xs-12">
									评价：${comment.description}
								</div>
								<div class="col-xs-12">
									<fmt:formatDate value="${comment.commentTime}" pattern="yyyy-MM-dd"/>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-xs-3" id="myScrollspy" >
				<%--<nav id="myScrollspy">--%>
				<ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="525" style="background-color: lightgrey">
					<li><a href="#section1">商品介绍</a></li>
					<li><a href="#section2">商品详情</a></li>
					<li><a href="#section3">商品评价</a></li>
				</ul>
			</div>
		</div>
	</div>


</div>

<%@include file="/WEB-INF/jsp/footer.jsp" %>

</body>
<script type="text/javascript">

	$(".addToCart").click(function(){
	    if (${loginUser==null}) {
            alert("请先登录！")
            window.location.href="/Home/toLogin"
        }else {
            $.post($("#quantityForm").attr('action'),
                $("#quantityForm").serialize(),
                function(res) {
                    var obj =  res;
                    if(obj){
                        alert("添加成功！")
                    }
                }, "json");
        }
	});

    /*$(function(){
            var oDiv = document.getElementById("right-nav"),
                H = 0,
                Y = oDiv
            while (Y) {
                H += Y.offsetTop;
                Y = Y.offsetParent;
            }
            window.onscroll = function()
            {
                var s = document.body.scrollTop || document.documentElement.scrollTop
                if(s>H) {
                    oDiv.style = "position:fixed;top:0;background-color: lightgrey"
                } else {
                    oDiv.style = "position:static;background-color: lightgrey"
                }
            }
        });*/
    $(function(){
        var a;
        var top = document.getElementById('top-nav');
        var pdesc = document.getElementById("productDesc");
        var v = top.offsetTop;//存储原来的距离顶部的距离
        window.onscroll = function(){
            a = document.documentElement.scrollTop;//存储滚动高度
            if(a>v){
                top.style.position = 'fixed';
                top.style.top = 0;
                pdesc.style.paddingTop = '50px';
            }else if(top.style.position != 'static'){
                top.style.position = 'static';
                pdesc.style.paddingTop = '0px';
            }
        }
    });
    //点击减号
    $(".glyphicon-minus").click(function () {
        var num = $(this).next();
        if (num.val()>1){
            num.val(parseInt(num.val())-1);
        }
    });
    //点击加号
    $(".glyphicon-plus").click(function () {
        var num = $(this).prev();
        num.val(parseInt(num.val())+1);
    });
    /*$(document).ready(function(){
        $("#myScrollspy").affix({
            offset: {
                top:200
            }
        });
    });*/
</script>
</html>