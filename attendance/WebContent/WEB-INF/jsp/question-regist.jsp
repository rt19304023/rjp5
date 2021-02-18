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
	<h1>秘密の質問を登録</h1>
	<p>社員番号: ${sessionScope.uid }
		社員名: ${sessionScope.name }</p>
	<div class="container">
		<form action="question-rr" method="post">
			<div class="form-group">
				<label>社員番号</label>
				<input type="text" name="id"class="form-control" value=${sessionScope.uid } readonly />
			</div>
			<div class="form-group">
				<label>誕生日</label>
				<input type="date" name="birthday" class="form-control" required />
			</div>
			<div class="form-group">
				<label>秘密の質問</label>
				<select name="problem"class="form-control" >
				<option value="出身地">出身地</option>
				<option value="ペットの名前">ペットの名前</option>
				<option value="好きなアイドル">好きなアイドル</option>
				<option value="好きな映画">好きな映画</option>
				<option value="座右の銘">座右の銘</option>
				<option value="テスト問題">テスト問題</option>
				</select>
			</div>
			<div class="form-group">
				<label>回答</label> <input type="text" name="answer" class="form-control" required />
			</div>
			<input type="submit" value="登録" class="btn btn-primary"/>
		</form>
	</div>

	<div id="top"></div>
	<br>
	<div id="logout"></div>
</body>
</html>