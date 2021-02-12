<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(function() {
		$("#top").load("return_top");
	});
	$(function() {
		$("#logout").load("out");
	});
</script>
</head>
<body>
	<h1>社員情報変更</h1>
	<div class="container">
		<c:forEach var="user" items="${result}">
			<form action="change-ir" method="post">
				<div class="form-group">
					<label>社員番号</label>
					<input type="text" name="employeeid" value=${user.employeeId } readonly />
				</div>
				<div class="form-group">
					<label>社員名</label>
					<input type="text" name="name" value=${user.name }>
				</div>
				<div class="form-group">
					<label>カードID</label><input type="text" name="cardnumber" value=${user.cardNumber }>
				</div>
				<div class="form-group">
					<label>部署コード</label>
					<input type="text" name="depertmentcode" value=${user.departmentCode }>
				</div>
				<input type="submit" value="更新" class="btn btn-primary" />
			</form>
		</c:forEach>
	</div>

	<div id="top"></div>
	<br>
	<div id="logout"></div>
</body>
</html>