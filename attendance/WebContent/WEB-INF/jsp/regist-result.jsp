<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>社員登録完了</title>
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
	<h1>新規社員の登録が完了しました</h1>
	<table border="1"  class="table table-striped">
		<tr>
			<th>社員番号</th>
			<th>氏名</th>
			<th>パスワード</th>
			<th>カードナンバー</th>
			<th>部署コード</th>
		</tr>
		<c:forEach var="user" items="${result}" >
			<tr>
				<td>${user.employeeId }</td>
				<td>${user.name }</td>
				<td>${user.pass }</td>
				<td>${user.cardNumber }</td>
				<td>${user.departmentCode }</td>
			</tr>
		</c:forEach>
	</table>

	<div id="top"></div><br>
	<div id="logout"></div>
</body>
</html>