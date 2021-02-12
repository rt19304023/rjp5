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
	<div class="container">
		<div class="search">
			<form name="empsearch" method="post" action="output-er"
				onSubmit="return check()" class="form-horizontal">
				<div class="form-group">
					<label>社員番号</label>
					<input type="number" name="employeeid" maxlength="7" />
				</div>
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