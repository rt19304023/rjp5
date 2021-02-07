<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<meta charset="UTF-8">
<title>社員追加</title>
</head>
<body>
	<h1>社員新規登録</h1>
	<form action="regist-er" method="post">
		社員名：<input type="text" name="name"/><br>
		カード番号：<input type="text" name="cardnumber"/><br>
		部署コード：<input type="number" name="departmentcode" maxlength="4"/><br><br>
		<input type="submit" value="登録">
	</form>
</body>
</html>