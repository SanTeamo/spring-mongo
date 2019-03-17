<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>会员注册</title>
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" type="text/css" />
    <script src="<%=basePath%>js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>

<%@ include file="/WEB-INF/jsp/header.jsp"%>



<%@include file="/WEB-INF/jsp/footer.jsp" %>

</body>
</html>




