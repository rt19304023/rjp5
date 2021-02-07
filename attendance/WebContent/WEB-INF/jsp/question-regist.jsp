<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>秘密の質問を登録</title>
</head>
<body>
	<h1>秘密の質問を登録</h1>
	<h3>${sessionScope.mes }</h3>
	<form action="question-rr">
		<p>社員番号：<input type="text" name="id" value=${sessionScope.uid }/></p>
		<p>誕生日：<input type="text" name="year" />
		<input type="text" name="month" />
		<input type="text" name="day" /></p>
		<p>秘密の質問：<input type="text" name="problem" /></p>
		<p>回答：<input type="text" name="answer" /></p>
	</form>
</body>
</html>