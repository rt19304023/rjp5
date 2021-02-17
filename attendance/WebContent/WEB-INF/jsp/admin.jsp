<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<meta charset="UTF-8">
	<title>${sessionScope.dname }TOP画面</title>
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
	<h1>${sessionScope.dname }TOP画面</h1>
		<p>社員番号: ${sessionScope.uid }
		社員名: ${sessionScope.name }</p>
		<div class="border col-12">
    <br>
        <div class="row">
            <div class="col-md">
                <a href="regist-e"><button type="button" class="btn btn-primary btn-lg btn-block">社員登録</button></a>
				<a href="delete-e"><button type="button" class="btn btn-default btn-lg btn-block">社員削除</button></a>
				<a href="output"><button type="button" class="btn btn-primary btn-lg btn-block">社員情報検索</button></a>
				<a href="search-i"><button type="button" class="btn btn-default btn-lg btn-block">社員登録内容変更</button></a>
				<a href="question-c"><button type="button" class="btn btn-primary btn-lg btn-block">パスワード変更</button></a>
				<a href="hours"><button type="button" class="btn btn-default btn-lg btn-block">勤務時間検索</button></a>
            </div>
        </div>
        <br>
    </div>
	<div id="top"></div><br>
	<div id="logout"></div>
</body>
</html>

