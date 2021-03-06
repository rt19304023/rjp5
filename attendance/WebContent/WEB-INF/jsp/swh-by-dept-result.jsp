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
	<h1>勤務時間検索結果(部署)</h1>
	<p>社員番号: ${sessionScope.uid }
		社員名: ${sessionScope.name }</p>
	<table border="1" class="table table-striped">
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