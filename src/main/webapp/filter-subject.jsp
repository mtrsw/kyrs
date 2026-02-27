<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <title>Фильтр по предмету</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background:linear-gradient(135deg,#f5f7fa,#e4e9f2);min-height:100vh;">
<%@ include file="navbar.jsp" %>
<div class="container py-5">
  <h2 class="text-center mb-4">Фильтрация по предмету</h2>
  <div class="row justify-content-center mb-4">
    <div class="col-md-6">
      <form action="filter-subject" method="get" class="d-flex gap-2">
        <select name="subjectId" class="form-select" required>
          <option value="">— выберите предмет —</option>
          <c:forEach var="sub" items="${subjects}">
            <option value="${sub.id}" ${selectedSubject == sub.id ? 'selected' : ''}>${sub.subjectName}</option>
          </c:forEach>
        </select>
        <button type="submit" class="btn btn-primary">Показать</button>
      </form>
    </div>
  </div>
  <c:if test="${not empty results}">
    <table class="table table-bordered table-hover bg-white shadow rounded">
      <thead class="table-success text-center">
      <tr><th>ID</th><th>Студент</th><th>Группа</th><th>Предмет</th><th>Балл</th><th>Дата</th></tr>
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
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </c:if>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
