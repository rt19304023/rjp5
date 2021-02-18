


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<title>社員情報入力</title>
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
	<h1>変更したい社員の情報入力</h1>
	<p>社員番号: ${sessionScope.uid }
		社員名: ${sessionScope.name }</p>
	<div class="container">
		<form action="change-i" method="post" class="form-horizontal">
			<div class="form-group row">
				<label>社員番号</label>
				<input type="number" name="employeeid" maxlength="7" min="1000" class="form-control" required />
			</div>
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