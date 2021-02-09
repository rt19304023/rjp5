<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<meta charset="UTF-8">
<title>勤務時間修正</title>
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
	<h1>勤務時間修正</h1>
	<c:forEach var="user" items="${result }">
	<p>変更日付：${user.date } </p>
		<form action="fix-hr" method="POST">
			<p>社員番号：<input type="text" name="employeeid" value= ${user.employeeId } readonly /></p>
			<p>出勤日：<input type="text" name="date"  value= ${user.date } readonly /></p>
			<p>出勤時：<input type="text" name="attendance" value= ${user.attendance } /></p>
			<p>休憩入：<input type="text" name="goout" value= ${user.gooutTime } /></p>
			<p>休憩明：<input type="text" name="returntime" value= ${user.returnTime } /></p>
			<p>退勤時：<input type="text" name="leave" value= ${user.leaveWork } /></p>
			<input type="submit" value="検索" />
		</form>
	</c:forEach>
	<div id="top"></div><br>
	<div id="logout"></div>
</body>
</html>