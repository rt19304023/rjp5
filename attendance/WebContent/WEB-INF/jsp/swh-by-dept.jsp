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
	<h1>勤務時間検索(部署)</h1>
	<div class="container">
		<form method="post" action="search-dhr">
			<div class="form-group row">
				<label>部署コード</label><input type="text" name="departmentcode" class="form-control" style="width:500px;"/>
			</div>
			<div class="form-group row">
				<label>検索年月</label><input type="number" name="year" class="form-control" style="width:250px;"/>
				<input type="number" name="month" class="form-control" style="width:250px;"/>
			</div>
			<br>
			<input type="submit" value="検索" class="btn btn-primary"/>
		</form>
	</div>

	<div id="top"></div>
	<br>
	<div id="logout"></div>
</body>
</html>