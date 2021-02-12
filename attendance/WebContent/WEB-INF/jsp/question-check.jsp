<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
		rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<title>秘密の質問を入力</title>
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
	<h1>秘密の質問を入力</h1>
	<h3>${sessionScope.mes}</h3>
	<h3>${sessionScope.secret}</h3>
	<div class="container">
		<form action="change-p" class="form-horizontal">
			<div class="form-group">
				<label>社員番号</label>
				<input type="text" name="id" value=${sessionScope.uid } readonly />
			</div>
			<div class="form-group">
				<label>誕生日</label>
				<input type="text" style="width:100px;"name="year" />
				<input type="text" style="width:100px;"name="month" />
				<input type="text" style="width:100px;"name="day" />
			</div>
			<div class="form-group">
				<label>秘密の質問</label>
				<input type="text" name="problem" />
			</div>
			<div class="form-group">
				<label>回答</label>
				<input type="text" name="answer" />
			</div>
			<div class="form-group">
				<input type="submit" value="送信"  class="btn btn-primary"/>
			</div>
		</form>
	</div>
		<div id="top"></div>
		<br>
		<div id="logout"></div>
</body>
</html>