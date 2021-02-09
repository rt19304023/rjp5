


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>社員情報入力</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		$(function(){
			$("#top").load("return_top");
		});
		$(function(){
			$("#logout").load("out");
		});
	</script>
</head>
<body>
	<h1>変更したい社員の情報入力</h1>
	<form action="change-i" method="POST">
		社員番号：<input type="number" name="employeeid" />
		<input type="submit" value="検索" />
	</form>
	<div id="top"></div><br>
	<div id="logout"></div>
</body>
</html>