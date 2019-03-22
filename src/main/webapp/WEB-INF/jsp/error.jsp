<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>提示</title>
	</head>

	<body>
		<div class="container-fluid">
			<%@ include file="/WEB-INF/jsp/header.jsp" %>
				<div class="container-fluid">
					<h1>${msg}</h1>
				</div>
			<%@ include file="/WEB-INF/jsp/footer.jsp" %>
		</div>

		

	</body>

</html>