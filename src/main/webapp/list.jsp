<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Список результатов</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background:linear-gradient(135deg,#f5f7fa,#e4e9f2);min-height:100vh;">
<%@ include file="navbar.jsp" %>
<div class="container py-5">
    <h2 class="text-center mb-4">Список результатов тестирования</h2>
    <table class="table table-bordered table-hover bg-white shadow rounded">
        <thead class="table-primary text-center">
        <tr>
            <th>ID</th><th>Студент</th><th>Группа</th><th>Предмет</th><th>Балл</th><th>Дата</th><th>Действие</th>
        </tr>
        </thead>
        <tbody class="text-center">
        <c:forEach var="r" items="${results}">
            <tr>
                <td>${r.id}</td>
                <td><strong>${r.studentName}</strong></td>
                <td>${r.groupNumber}</td>
                <td>${r.subjectName}</td>
                <td>${r.score}</td>
                <td>${r.createdAt}</td>
                <td>
                    <form action="delete" method="post" style="margin:0">
                        <input type="hidden" name="id" value="${r.id}">
                        <button type="submit" class="btn btn-danger btn-sm"
                                onclick="return confirm('Удалить запись?')">Удалить</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>