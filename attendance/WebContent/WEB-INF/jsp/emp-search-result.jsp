<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<title>Insert title here</title>
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
	<h1>社員情報</h1>
	<p>社員番号: ${sessionScope.uid }
		社員名: ${sessionScope.name }</p>
	<table border="1" class="table table-striped">
		<tr>
			<th>社員番号</th>
			<th>名前</th>
			<th>カード番号</th>
			<th>部署番号</th>
			<th>部署名</th>
		</tr>
		<c:forEach var="info" items="${result }">
			<tr>
				<td>${info.employeeId }</td>
				<td>${info.name }</td>
				<td>${info.cardNumber }</td>
				<td>${info.departmentCode }</td>
				<td>${info.departmentName }</td>
			</tr>
		</c:forEach>
	</table>
	<div id="top"></div><br>
	<div id="logout"></div>
</body>
</html>