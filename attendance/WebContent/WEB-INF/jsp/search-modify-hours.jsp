<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<title>社員の時間を検索</title>
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
	<h1>社員の時間を検索</h1>
	<div class="container">
		<form action="modify" method="POST">
			<div class="form-group row">
				<label>社員番号</label><input type="text" name="employeeid"  class="form-control" style="width:500px;"/>
			</div>
			<div class="form-group row">
				<label>年</label><input type="text" name="year" class="form-control" style="width:500px;" />
			</div>
			<div class="form-group row">
				<label>月</label><input type="text" name="month" class="form-control" style="width:500px;"/>
			</div>
			<div class="form-group row">
				<label>日</label><input type="text" name="day" class="form-control" style="width:500px;"/>
			</div>
			<br>
			<div class="form-group">
				<input type="submit" value="検索" class="btn btn-primary" />
			</div>
		</form>
	</div>

	<div id="top"></div>
	<br>
	<div id="logout"></div>
</body>
</html>