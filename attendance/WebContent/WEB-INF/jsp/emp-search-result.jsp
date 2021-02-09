<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<table border="1">
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