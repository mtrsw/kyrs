<%-- list.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Результаты тестирования</title>
</head>
<body>
<h1>Результаты тестирования</h1>
<c:if test="${not empty error}">
    <p style="color: red;">${error}</p>
</c:if>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Студент</th>
        <th>Предмет</th>
        <th>Балл</th>
        <th>Дата</th>
        <th>Действия</th>
    </tr>
    <c:forEach var="result" items="${results}">
        <tr>
            <td>${result.id}</td>
            <td>${result.studentName}</td>
            <td>${result.subject}</td>
            <td>${result.score}</td>
            <td>${result.testDate}</td>
            <td>
                <form action="delete" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="${result.id}"/>
                    <input type="submit" value="Удалить"/>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="index.jsp">Назад</a>
</body>
</html>