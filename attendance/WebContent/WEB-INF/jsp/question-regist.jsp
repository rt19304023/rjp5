<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>秘密の質問を登録</title>
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
	<h1>秘密の質問を登録</h1>
	<div class="container">
		<form action="question-rr" method="post">
			<div class="form-group">
				<label>社員番号</label> <input type="text" name="id"
					value=${sessionScope.uid } readonly />
			</div>
			<div class="form-group">
				<label>誕生日</label> <input type="text" name="year" /> <input
					type="text" name="month" /> <input type="text" name="day" />
			</div>
			<div class="form-group">
				<label>秘密の質問</label> <input type="text" name="problem" />
			</div>
			<div class="form-group">
				<label>回答</label> <input type="text" name="answer" />
			</div>
			<input type="submit" value="登録" class="btn btn-primary"/>
		</form>
	</div>

	<div id="top"></div>
	<br>
	<div id="logout"></div>
</body>
</html>