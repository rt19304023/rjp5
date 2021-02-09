<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<meta charset="UTF-8">
	<title>管理者TOP画面</title>
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
			font-size: 300%;
		}
	</style>
</head>

<body>
	<h1>TOP画面</h1>
		<p>社員番号: ${sessionScope.uid }
		社員名: ${sessionScope.name }</p>
	<p><a href="question-c">パスワード変更</a></p>
	<p><a href="hours">勤務時間検索</a></p>
	<div id="top"></div><br>
	<div id="logout"></div>
</body>
</html>

