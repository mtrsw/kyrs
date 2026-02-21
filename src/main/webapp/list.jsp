<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="navbar.jsp" %>

<html>
<head>
    <title>Список результатов</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            background: linear-gradient(135deg, #f5f7fa, #e4e9f2);
            min-height: 100vh;
        }

        h1 {
            text-align: center;
            margin: 40px 0 30px;
            color: #2c3e50;
            font-size: 32px;
        }

        .results {
            max-width: 1100px;
            margin: 0 auto;
            padding: 0 20px 40px;
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

        tr:last-child td {
            border-bottom: none;
        }

        tr:hover td {
            background: #f8fbff;
        }

        .delete-btn {
            background: #e74c3c;
            color: white;
            border: none;
            padding: 8px 18px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
        }

        .delete-btn:hover {
            background: #c0392b;
        }
    </style>
</head>
<body>

<h1>Список результатов тестирования</h1>

<div class="results">
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
                                onclick="return confirm('Точно удалить результат?')">
                            Удалить
                        </button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>