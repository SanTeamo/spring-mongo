<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty page.totalPages}">
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
							<a href="?page=1" aria-label="Previous">
								<span aria-hidden="true">首页</span>
							</a>
						</li>
						<li>
							<a href="?page=${page.number}" aria-label="Previous">
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
							<li><a href="?page=${i}">${i}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${(page.number+1)<page.totalPages}">
						<li>
							<a href="?page=${page.number+2}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
						<li>
							<a href="?page=${page.totalPages}" aria-label="Next">
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
</c:if>
    		<%--<a href="${pageContext.request.contextPath}/${page.url}&num=1">首页</a>
    		<a href="${pageContext.request.contextPath}/${page.url}&num=${page.prePageNum}">上一页</a>
    		&lt;%&ndash;显示的页码，使用forEach遍历显示的页面 &ndash;%&gt;
    		<c:forEach begin="${page.startPage}" end="${page.endPage}" var="pagenum">
    			<a href="${pageContext.request.contextPath}/${page.url}&num=${pagenum}">${pagenum}</a>
    		</c:forEach>

    		<a href="${pageContext.request.contextPath}/${page.url}&num=${page.nextPageNum}">下一页</a>
    		<a href="${pageContext.request.contextPath}/${page.url}&num=${page.totalPageNum}">末页</a>
    		<input type="text" id="pagenum" name="pagenum" size="1"/><input type="button" value="前往" onclick="jump()" />
    		<script type="text/javascript">
    			function jump(){
    				var totalpage = ${page.totalPageNum};
    				var pagenum = document.getElementById("pagenum").value;
    				//判断输入的是一个数字
    				var reg =/^[1-9][0-9]{0,1}$/;
    				if(!reg.test(pagenum)){
    					//不是一个有效数字
    					alert("请输入符合规定的数字");
    					return ;
    				}
    				//判断输入的数字不能大于总页数
    				if(parseInt(pagenum)>parseInt(totalpage)){
    					//超过了总页数
    					alert("不能大于总页数");
    					return;
    				}
    				//转向分页显示的Servlet
    				window.location.href="${pageContext.request.contextPath}/${page.url}&num="+pagenum;
    			}
    		</script>--%>
    	</div>
