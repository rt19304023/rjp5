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
	<p>社員番号: ${sessionScope.uid }
		社員名: ${sessionScope.name }</p>
	<h3>${sessionScope.mes}</h3>
	<h3>${sessionScope.secret}</h3>
	<div class="container">
		<form action="change-p" class="form-horizontal" method="post">
			<div class="form-group row">
				<label>社員番号</label>
				<input type="text" name="id" value=${sessionScope.uid } class="form-control" style="width:500px;" readonly />
			</div>
			<div class="form-group row">
				<label>誕生日</label>
				<input type="date" name="birthday" class="form-control" style="width:500px;" required />
			</div>
			<div class="form-group row">
				<label>秘密の質問</label>
				<select name="problem"class="form-control" style="width:500px;">
				<option value="出身地">出身地</option>
				<option value="ペットの名前">ペットの名前</option>
				<option value="好きなアイドル">好きなアイドル</option>
				<option value="好きな映画">好きな映画</option>
				<option value="座右の銘">座右の銘</option>
				<option value="テスト問題">テスト問題</option>
				</select>
			</div>
			<div class="form-group row">
				<label>回答</label>
				<input type="text" name="answer" class="form-control" style="width:500px;" required />
			</div>
			<br>
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