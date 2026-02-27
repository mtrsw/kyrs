<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Добавить результат</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="card shadow">
                <div class="card-header bg-primary text-white">
                    <h4><i class="fas fa-plus"></i> Новый результат тестирования</h4>
                </div>
                <div class="card-body">
                    <form action="add" method="post">
                        <div class="mb-3">
                            <label>Студент</label>
                            <select name="studentId" class="form-select" required>
                                <option value="">— выберите студента —</option>
                                <c:forEach var="s" items="${students}">
                                    <option value="${s.id}">${s.fullName} (${s.groupNumber})</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label>Предмет</label>
                            <select name="subjectId" class="form-select" required>
                                <option value="">— выберите предмет —</option>
                                <c:forEach var="sub" items="${subjects}">
                                    <option value="${sub.id}">${sub.subjectName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label>Балл (0-100)</label>
                            <input type="number" name="score" min="0" max="100" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-success w-100">
                            <i class="fas fa-save"></i> Сохранить
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>