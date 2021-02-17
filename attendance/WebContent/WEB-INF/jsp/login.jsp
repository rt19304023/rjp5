<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<title>ログイン</title>
</head>
<body>
	<h1>ログイン</h1>
	<h3>${sessionScope.mes }</h3>
	<div class="container">
		<form action="login" method="post">
			<div class="form-group row">
				<label>社員番号</label><input type="text" maxlength="7" min="1000" name="employeeid" class="form-control" style="width:500px;" required />
			</div>
			<div class="form-group row">
				<label>パスワード</label><input type="password" name="pass" class="form-control" style="width:500px;" required />
			</div>
			<br>
			<div class="form-group">
				<input type="submit" value="ログイン" class="btn btn-primary" />
			</div>
		</form>
	</div>
</body>
</html>

