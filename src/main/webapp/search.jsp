<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Поиск по студенту</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa, #e4e9f2);
            min-height: 100vh;
        }
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="container py-5">
    <h2 class="text-center mb-4">Поиск по студенту</h2>

    <!-- Поисковая строка -->
    <div class="row justify-content-center mb-4">
        <div class="col-md-8">
            <form action="search" method="get" class="d-flex gap-2">
                <input type="text"
                       name="namePart"
                       class="form-control form-control-lg"
                       placeholder="Введите часть ФИО студента..."
                       value="${param.namePart}">
                <button type="submit" class="btn btn-primary btn-lg px-4">
                    <i class="fas fa-search"></i> Найти
                </button>
            </form>
        </div>
    </div>

    <!-- Таблица результатов -->
    <c:if test="${not empty results}">
        <table class="table table-bordered table-hover bg-white shadow rounded">
            <thead class="table-primary text-center">
            <tr>
                <th>ID</th>
                <th>Студент</th>
                <th>Группа</th>
                <th>Предмет</th>
                <th>Балл</th>
                <th>Дата</th>
                <th>Действие</th>
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
                                    onclick="return confirm('Удалить запись?')">
                                <i class="fas fa-trash"></i> Удалить
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

    <!-- Сообщение если ничего не найдено -->
    <c:if test="${empty results && param.namePart != null && param.namePart != ''}">
        <div class="text-center mt-5">
            <i class="fas fa-search fa-3x text-muted mb-3"></i>
            <p class="fs-5 text-muted">
                Ничего не найдено по запросу "<strong>${param.namePart}</strong>"
            </p>
        </div>
    </c:if>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>