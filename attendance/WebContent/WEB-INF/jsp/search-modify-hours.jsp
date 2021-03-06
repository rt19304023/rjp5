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
	<style>
		*{
			text-align: center;
		}
		p{
			font-size: 350%;
		}
	</style>
</head>
<body>
	<h1>社員の時間を検索</h1>
	<p>社員番号: ${sessionScope.uid }
		社員名: ${sessionScope.name }</p>
	<div class="container">
		<form action="modify" method="POST">
			<div class="form-group row">
				<label>社員番号</label><input type="text" name="employeeid"  class="form-control" required />
			</div>
			<div class="form-group row">
				<label>年</label><input type="number" name="year" class="form-control" min="2010" maxlength="4" required />
			</div>
			<div class="form-group row">
				<label>月</label><input type="number" name="month" class="form-control" min="1" max="12" maxlength="2" required />
			</div>
			<div class="form-group row">
				<label>日</label><input type="number" name="day" class="form-control" min="1" max="31" maxlength="2" required />
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