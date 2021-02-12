<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<h1>パスワード変更</h1>
	<div class="container">
		<form action="change-pr">
			<div class="form-group">
				<label>社員番号</label> <input type="text" name="id"
					value=${sessionScope.uid } readonly />
			</div>
			<div class="form-group">
				<label>新しいパスワード</label> <input type="password" name="pass" />
			</div>
			<div class="form-group">
				<label>パスワード確認用</label> <input type="password" name="passc" />
			</div>
			<div class="form-group">
				<input type="submit" value="変更" />
			</div>
		</form>
		<div id="top"></div>
		<br>
		<div id="logout"></div>
</body>
</html>