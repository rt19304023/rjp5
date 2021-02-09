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
	<h1>勤務時間検索結果(部署)</h1>
	<table border="1">
		<tr><th>部署番号</th>
			<th>部署名</th>
			<th>年-月</th>
			<th>社員番号</th>
			<th>名前</th>
			<th>勤務時間</th>
		</tr>
		<c:forEach var="times" items="${result}">
			<tr>
				<td>${times.departmentCode }</td>
				<td>${times.departmentName }</td>
				<td>${times.month }</td>
				<td>${times.employeeId }</td>
				<td>${times.name }</td>
				<td>${times.workTime }</td>
			</tr>
		</c:forEach>
	</table>
	<div id="top"></div><br>
	<div id="logout"></div>
</body>
</html>