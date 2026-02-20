<%-- search.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Поиск по студенту</title>
</head>
<body>
<h1>Поиск результатов по студенту</h1>
<form action="search" method="post">
    ФИО (или часть): <input type="text" name="namePart" required/><br/>
    <input type="submit" value="Поиск"/>
</form>
<a href="index.jsp">Назад</a>
</body>
</html>