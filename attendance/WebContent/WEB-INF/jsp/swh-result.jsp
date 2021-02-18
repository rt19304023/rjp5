<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		$(function(){
			$("#top").load("return_top");
		});
		$(function(){
			$("#logout").load("out");
		});
	</script>
		<style>
		*{
			text-align: center;
		}
		p{
			font-size: 350%;
		}
	</style>
</head>
<body>
	<h1>勤務時間検索結果</h1>
	<p>社員番号: ${sessionScope.uid }
		社員名: ${sessionScope.name }</p>
	<table border="1" class="table table-striped">
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
	<div id="top"></div><br>
	<div id="logout"></div>

</body>
</html>