
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>社員情報の検索</title>
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
	<h1>社員情報検索</h1>
	<p>社員番号: ${sessionScope.uid }
		社員名: ${sessionScope.name }</p>
	<div class="container">
		<div class="search">
			<form name="empsearch" method="post" action="output-er"
				onSubmit="return check()" class="form-horizontal">
				<div class="form-group row">
					<label>社員番号</label>
					<input type="number" name="employeeid" min="1000" maxlength="7" class="form-control" style="width:500px;" required />
				</div>
				<br>
				<div class="form-group">
					<input type="submit" value="検索" class="btn btn-primary">
				</div>
			</form>
		</div>
	</div>

	<div id="top"></div>
	<br>
	<div id="logout"></div>
</body>
</html>