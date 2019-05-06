<!doctype html>
<html>

<head>
    <meta charset="utf-8"/>
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
    <div class="col-md-12">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index.do">首页</a></li>
            </ol>
        </div>
        <c:forEach items="${page.content}" var="p">
            <div class="col-md-2 col-sm-4 col-xs-6" style="text-align: center;height: 240px;">
                <a href="${pageContext.request.contextPath}/Product/catId/${p.catId}/id/${p.id}">
                    <img src="${pageContext.request.contextPath}/products/${p.pimage}" width="170" height="170"
                         style="display: inline-block;" class="img-rounded img-responsive">
                </a>
                <p><a href="${pageContext.request.contextPath}/Product/catId/${p.catId}/id/${p.id}"
                      style='color:green'>${fn:substring(p.pname, 0, 10) }...</a></p>
                <p><font color="#FF0000">商城价：&yen;${p.price}</font></p>
            </div>
        </c:forEach>
        <c:if test="${page.totalPages>0}">
            <div class="col-md-12">
                    <%--<div class="col-md-4 col-md-offset-5">--%>
                <div class="text-center">
                    <nav aria-label="Page navigation">
                        <ul class="pagination pagination-lg">
                            <c:if test="${(page.number+1)==1}">
                                <li class="disabled">
					  <span>
						<span aria-hidden="true">首页</span>
					  </span>
                                </li>
                                <li class="disabled">
					  <span>
						<span aria-hidden="true">&laquo;</span>
					  </span>
                                </li>
                            </c:if>
                            <c:if test="${(page.number+1)>1}">
                                <li>
                                    <a href="?keyword=${keyword}&page=1" aria-label="Previous">
                                        <span aria-hidden="true">首页</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="?keyword=${keyword}&page=${page.number}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach var="i" begin="1" end="${page.totalPages}">
                                <c:if test="${(page.number+1)==i}">
                                    <li class="active">
                                        <span>${i} <span class="sr-only">(current)</span></span>
                                    </li>
                                </c:if>
                                <c:if test="${(page.number+1)!=i}">
                                    <li><a href="?keyword=${keyword}&page=${i}">${i}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${(page.number+1)<page.totalPages}">
                                <li>
                                    <a href="?keyword=${keyword}&page=${page.number+2}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="?keyword=${keyword}&page=${page.totalPages}" aria-label="Next">
                                        <span aria-hidden="true">尾页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${(page.number+1)==page.totalPages}">
                                <li class="disabled">
					  <span>
						<span aria-hidden="true">&raquo;</span>
					  </span>
                                </li>
                                <li class="disabled">
					  <span>
						<span aria-hidden="true">尾页</span>
					  </span>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="col-md-12" style="text-align:center">
                共${page.totalPages}页/第${page.number+1}页
            </div>
        </c:if>

    </div>

</c:if>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>

</body>

</html>