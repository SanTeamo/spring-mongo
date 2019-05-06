<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户列表</title>
</head>
<body>
<div class="container-fluid">
    <div class="page-header">
        <h1>用户列表 <%--<small>全部订单</small>--%></h1>
    </div>
    <%--<ul class="nav nav-pills nav-justified">
        <li id="allOrder" role="presentation"><a href="/Home/Order">全部订单</a></li>
        <li id="notdone" role="presentation"><a href="/Home/Order/notdone">未完成订单</a></li>
        <li id="done" role="presentation"><a href="/Home/Order/done">已完成订单</a></li>
    </ul>--%>
    <c:if test="${empty page.content}">
        <h1>没有任何东西~</h1>
    </c:if>
    <c:if test="${not empty page.content}">
        <div class="panel panel-default">
            <div class="panel-heading">用户列表 / 共${page.totalElements}个用户</div>
                <%--<div class="panel-body">
                    <p>...</p>
                </div>--%>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th>用户名</th>
                        <th>密码</th>
                        <th>email</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>出生日期</th>
                        <th>电话</th>
                        <th>账号类型</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.content}" var="user">
                        <tr class="active">
                            <input type="hidden" class="uid" value="${user.id}">
                            <input type="hidden" class="type" value="${user.type}">
                            <td class="username">${user.username}</td>
                            <td class="password">${user.password}</td>
                            <td class="email">${user.email}</td>
                            <td class="name">${user.name}</td>
                            <td class="sex">${user.sex}</td>
                            <td class="birthday"><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/></td>
                            <td class="telephone">${user.telephone}</td>
                            <td class="type">
                                <c:if test="${user.type==0}">
                                    管理员
                                </c:if>
                                <c:if test="${user.type==1}">
                                    客户
                                </c:if>
                                <c:if test="${user.type==2}">
                                    卖家
                                </c:if>
                            </td>
                            <td>
                                <button type="button" class="btn btn-primary edit">编辑</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                            <h4 class="modal-title" id="addModalLabel">编辑用户</h4>
                        </div>
                        <form action="${ctx}/Admin/updateuser" method="post">
                            <div class="modal-body">
                                <input type="hidden" id="id" name="id">
                                <div class="form-group">
                                    <label for="username">用户名</label>
                                    <input type="text" class="form-control" readonly id="username" name="username">
                                </div>
                                <div class="form-group">
                                    <label for="password">密码</label>
                                    <input type="text" class="form-control" id="password" name="password">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="text" class="form-control" id="email" name="email">
                                </div>
                                <div class="form-group">
                                    <label for="name">姓名</label>
                                    <input type="text" class="form-control bitian" id="name" name="name">
                                </div>
                                <div class="form-group">
                                    <label for="sex">性别</label>
                                    <select class="form-control" id="sex" name="sex">
                                        <option id="man" value="男">男</option>
                                        <option id="woman" value="女">女</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="birthday">出生日期</label>
                                    <input type="date" class="form-control" name="birthday" id="birthday">
                                </div>
                                <div class="form-group">
                                    <label for="telephone">电话</label>
                                    <input type="text" class="form-control" name="telephone" id="telephone">
                                </div>
                                <div class="form-group">
                                    <label for="type">账号类型</label>
                                    <select class="form-control" name="type" id="type">
                                        <option id="admin" value="0">管理员</option>
                                        <option id="customer" value="1">客户</option>
                                        <option id="seller" value="2">卖家</option>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="submit" class="btn btn-primary">确认修改</button>
                            </div>
                        </form>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div>
        </div>
    </c:if>

    <%@ include file="/WEB-INF/jsp/pageFile.jsp"%>

</div>
</body>
<script>
    $(".edit").click(function () {
        var tr = $(this).parent().parent();
        var id = tr.find(".uid").val();
        var username = tr.find(".username").html();
        var password = tr.find(".password").html();
        var email = tr.find(".email").html();
        var name = tr.find(".name").html();
        var sex = tr.find(".sex").html();
        var birthday = tr.find(".birthday").html();
        var telephone = tr.find(".telephone").html();
        var type = tr.find(".type").val();
        //console.log(id+","+username+","+password+","+email+","+name+","+sex+","+birthday+","+telephone+","+type);
        //向模态框中传值
        $('#id').val(id);
        $('#username').val(username);
        $('#password').val(password);
        $('#email').val(email);
        $('#name').val(name);

        /*$('#woman').attr("selected",false);
        $('#man').attr("selected",false);

        if (sex == '女') {
            $('#woman').attr("selected",true);
        } else {
            $('#man').attr("selected",true);
        }*/
        $('#birthday').val(birthday);
        $('#telephone').val(telephone);

        $("#sex").val(sex);

        /*$('#admin').attr("selected",false);
        $('#customer').attr("selected",false);
        $('#seller').attr("selected",false);

        if (type == 0) {
            $('#admin').attr("selected",true);
        } else if(type == 1) {
            $('#customer').attr("selected",true);
        } else {
            $('#seller').attr("selected",true);
        }*/

        $("#type").val(type);

        $('#updateModal').modal('show');
        /*$('#updateModal').modal({

            backdrop:"static"

        });*/
    })
</script>
</html>
