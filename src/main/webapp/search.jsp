<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="navbar.jsp" %>

<html>
<head>
    <title>Поиск по студенту</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            background: linear-gradient(135deg, #f5f7fa, #e4e9f2);
            min-height: 100vh;
        }

        h1 {
            text-align: center;
            margin: 60px 0 40px;
            color: #2c3e50;
            font-size: 32px;
        }

        .search-container {
            max-width: 720px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .search-box {
            display: flex;
            align-items: stretch;
            background: white;
            border-radius: 50px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.12);
            overflow: hidden;
            padding: 0;
        }

        .search-box form {
            width: 100%;
            display: flex;
            margin: 0;
        }

        .search-box input {
            flex: 1;
            border: none;
            padding: 18px 24px;
            font-size: 17px;
            outline: none;
        }

        .search-box button {
            background: #007bff;
            color: white;
            border: none;
            padding: 0 40px;
            font-size: 17px;
            cursor: pointer;
            border-radius: 0 50px 50px 0;
            flex-shrink: 0;
            align-self: stretch;
        }

        .search-box button:hover {
            background: #0056b3;
        }

        .results {
            margin-top: 50px;
            max-width: 1100px;
            margin-left: auto;
            margin-right: auto;
            padding: 0 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        th {
            background: #007bff;
            color: white;
            padding: 16px;
        }

        td {
            padding: 16px;
            border-bottom: 1px solid #eee;
            text-align: center;
        }

        tr:hover {
            background: #f8fbff;
        }

        .delete-btn {
            background: #e74c3c;
            color: white;
            border: none;
            padding: 8px 18px;
            border-radius: 6px;
            cursor: pointer;
        }

        .delete-btn:hover {
            background: #c0392b;
        }
    </style>
</head>
<body>

<h1>Поиск по студенту</h1>

<div class="search-container">
    <div class="search-box">
        <form action="search" method="get">
            <input type="text"
                   name="namePart"
                   placeholder="Введите часть ФИО студента..."
                   value="${param.namePart}">
            <button type="submit">Найти</button>
        </form>
    </div>
</div>

<!-- Таблица результатов -->
<div class="results">
    <c:if test="${not empty results}">
        <table>
            <tr>
                <th>ID</th>
                <th>Студент</th>
                <th>Название теста</th>
                <th>Балл</th>
                <th>Дата</th>
                <th>Действие</th>
            </tr>
            <c:forEach var="r" items="${results}">
                <tr>
                    <td>${r.id}</td>
                    <td><strong>${r.studentName}</strong></td>
                    <td>${r.testName}</td>
                    <td>${r.score}</td>
                    <td>${r.createdAt}</td>
                    <td>
                        <form action="delete" method="post" style="margin:0;">
                            <input type="hidden" name="id" value="${r.id}">
                            <button type="submit" class="delete-btn"
                                    onclick="return confirm('Удалить результат?')">Удалить</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${empty results && param.namePart != null}">
        <p style="text-align: center; margin-top: 50px; font-size: 19px; color: #7f8c8d;">
            Ничего не найдено по запросу "<strong>${param.namePart}</strong>"
        </p>
    </c:if>
</div>

</body>
</html>