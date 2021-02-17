<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<meta charset="UTF-8">
	<title>社員削除完了</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		$(function(){
			$("#top").load("return_top");
		});
		$(function(){
			$("#logout").load("out");
		});
	</script>
</head>
<body>
	<h1>社員の削除が完了しました</h1>
	<p>社員番号: ${sessionScope.uid }
		社員名: ${sessionScope.name }</p>
	<table border="1" class="table table-striped">
		<tr><th>社員番号</th><th>氏名</th></tr>
		<c:forEach var="user" items="${result}">
			<tr>
				<td>${user.employeeId }</td>
				<td>${user.name }</td>
			</tr>
		</c:forEach>
	</table>

	<div id="top"></div><br>
	<div id="logout"></div>
</body>
</html>