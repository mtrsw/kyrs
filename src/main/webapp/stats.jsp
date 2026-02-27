<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Статистика</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background:linear-gradient(135deg,#f5f7fa,#e4e9f2);min-height:100vh;">
<%@ include file="navbar.jsp" %>
<div class="container py-5">
    <h2 class="text-center mb-4">Средний балл по группам</h2>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <table class="table table-bordered table-hover bg-white shadow rounded">
                <thead class="table-danger text-center">
                <tr><th>Группа</th><th>Средний балл</th></tr>
                </thead>
                <tbody class="text-center">
                <c:forEach var="g" items="${groups}" varStatus="st">
                    <tr>
                        <td><strong>${g.groupNumber}</strong></td>
                        <td>
                            <c:forEach var="avg" items="${avgByGroup}" varStatus="as">
                                <c:if test="${avg[0] == g.id}">
                                    <span class="badge bg-primary fs-6">${String.format('%.1f', avg[1])}</span>
                                </c:if>
                            </c:forEach>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>