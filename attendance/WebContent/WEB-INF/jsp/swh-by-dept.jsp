<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>勤務時間検索(部署)</h1>
	<form method="post" action="search-dhr">
		部署コード：<input type="text" name="departmentcode" />
		検索年月：<input type="number" name="year" /><input type="number" name="month" />
		<input type="submit" value="検索" />
	</form>
</body>
</html>