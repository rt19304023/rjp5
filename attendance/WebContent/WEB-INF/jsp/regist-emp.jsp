<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<title>社員追加</title>
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
	<h1>社員新規登録</h1>
	<div class="container">
		<form action="regist-er" method="post">
			<div class="form-group row">
				<label>社員名 </label> <input type="text" name="name"
					class="form-control" style="width:500px;"/>
			</div>
			<div class="form-group row">
				<label>カード番号</label> <input type="text" name="cardnumber"
					class="form-control" style="width:500px;" />
			</div>
			<div class="form-group row">
				<label>部署コード</label> <input type="number" name="departmentcode"
					maxlength="4" min="1" max="12" class="form-control" style="width:150px;" />
			</div>
			<br>
			<div class="form-group">
				<input type="submit" value="登録" class="btn btn-primary" />
			</div>
		</form>
	</div>
	<div id="top"></div>
	<br>
	<div id="logout"></div>
</body>
</html>