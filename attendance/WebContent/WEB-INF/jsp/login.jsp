<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>ログイン</title>
</head>
<body>
	<h1>ログイン</h1>
		<form action="login" method="post">
			社員番号：<input type="text" name="employeeid"/><br>
			パスワード：<input type="text" name="pass"/><br><br>
			<input type="submit" value="ログイン">
		</form>
</body>
</html>
