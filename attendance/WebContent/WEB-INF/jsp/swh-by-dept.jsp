<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<h1>勤務時間検索(部署)</h1>
	<form method="post" action="search-dhr">
		部署コード：<input type="text" name="departmentcode" />
		検索年月：<input type="number" name="year" /><input type="number" name="month" />
		<input type="submit" value="検索" />
	</form>
	<div id="top"></div><br>
	<div id="logout"></div>
</body>
</html>