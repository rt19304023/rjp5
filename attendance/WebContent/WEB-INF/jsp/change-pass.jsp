<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>パスワード変更</h1>
	<form action="change-pr">
		社員番号：<input type="text" name="id" value=${sessionScope.uid } />
		新しいパスワード：<input type="password" name="pass" />
		パスワード確認用：<input type="password" name="passc" />
		<input type="submit" value="変更"/>
	</form>
</body>
</html>