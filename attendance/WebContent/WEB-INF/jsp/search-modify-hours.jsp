<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>社員の時間を検索</title>
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
	<h1>社員の時間を検索</h1>
	<form action="modify" method="POST">
		社員番号：<input type="text" name="employeeid" />
		年：<input type="text" name="year" />
		月：<input type="text" name="month" />
		日：<input type="text" name="day" />
		<input type="submit" value="検索" />
	</form>
	<div id="top"></div><br>
	<div id="logout"></div>
</body>
</html>