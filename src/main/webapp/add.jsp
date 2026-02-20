<%-- add.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Добавить результат</title>
</head>
<body>
<h1>Добавить результат теста</h1>
<c:if test="${not empty error}">
    <p style="color: red;">${error}</p>
</c:if>
<form action="add" method="post">
    ФИО студента: <input type="text" name="studentName" required/><br/>
    Предмет: <input type="text" name="subject" required/><br/>
    Балл: <input type="number" name="score" required/><br/>
    Дата (ГГГГ-ММ-ДД, пусто = сегодня): <input type="text" name="testDate"/><br/>
    <input type="submit" value="Добавить"/>
</form>
<a href="index.jsp">Назад</a>
</body>
</html>