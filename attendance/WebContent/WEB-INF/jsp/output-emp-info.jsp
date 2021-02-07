<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<meta charset="UTF-8">
<title>社員情報の検索</title>
</head>
<body>
<div class="search">
		<form name="empsearch" method="post" action="output-er" onSubmit="return check()">
  	 	<p>社員情報検索</p>
    	社員番号：<input type="number" name="employeeid" maxlength="7"/><br>
    	<input type="submit" value="検索">
  	</form>
</div>
</body>
</html>