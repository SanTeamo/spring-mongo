<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	</div>
</c:if>
