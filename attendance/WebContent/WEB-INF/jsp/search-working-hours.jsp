<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">

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
	<h1>勤務時間検索</h1>
	<div class="container">
		<form action="search-hr" method="post">
			<div class="form-group row">
				<label>社員番号</label> <input type="text" name="employeeid"
					value=${sessionScope.uid } class="form-control" style="width:500px;" readonly />
			</div>
			<div class="form-group row">
				<label>検索する月</label> <input type="text" name="month" class="form-control" style="width:500px;"/>
			</div>
			<br>
			<input type="submit" value="検索" class="btn btn-primary">
		</form>
	</div>
	<div id="top"></div>
	<br>
	<div id="logout"></div>
</body>
</html>