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
	<p>社員番号: ${sessionScope.uid }
		社員名: ${sessionScope.name }</p>
	<div class="container">
		<c:forEach var="user" items="${result }">
			<p>変更日付：${user.date } </p>
				<form action="fix-hr" method="POST">
					<div class="form-group row">
						<p>社員番号：<input type="text" name="employeeid" value= ${user.employeeId } class="form-control" style="width:500px;" readonly /></p>
						<p>出勤日：<input type="text" name="date"  value= ${user.date } class="form-control" style="width:500px;" readonly  /></p>
						<p>出勤時：<input type="time" name="attendance" value= ${user.attendance } class="form-control" style="width:500px;" required /></p>
						<p>休憩入：<input type="time" name="goout" value= ${user.gooutTime } class="form-control" style="width:500px;" required /></p>
						<p>休憩明：<input type="time" name="returntime" value= ${user.returnTime } class="form-control" style="width:500px;" required /></p>
						<p>退勤時：<input type="time" name="leave" value= ${user.leaveWork } class="form-control" style="width:500px;" required /></p>
						<input type="submit" value="検索" class="btn btn-primary" />
					</div>
			</form>
		</c:forEach>
	</div>

	<div id="top"></div><br>
	<div id="logout"></div>
</body>
</html>