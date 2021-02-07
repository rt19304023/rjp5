<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

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
	<div id="logout"></div>
	<h1>勤務時間検索結果</h1>
	<table border="1">
		<tr>
			<th>日付</th>
			<th>出勤時間</th>
			<th>休憩入り</th>
			<th>休憩明け</th>
			<th>退勤時間</th>
		</tr>
		<c:forEach var="times" items="${result}">
			<tr>
				<td>${times.date }</td>
				<td>${times.attendance }</td>
				<td>${times.gooutTime }</td>
				<td>${times.returnTime }</td>
				<td>${times.leaveWork }</td>
			</tr>
		</c:forEach>
	</table>

	<div id="top"></div>

</body>
</html>