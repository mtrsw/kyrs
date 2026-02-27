<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <title>Управление студентами</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
  <style>
    body { background: linear-gradient(135deg, #f5f7fa, #e4e9f2); min-height: 100vh; }
  </style>
</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="container py-5">
  <h2 class="text-center mb-5">Управление студентами и группами</h2>

  <div class="row g-4 mb-5">

    <!-- Форма добавления студента -->
    <div class="col-md-6">
      <div class="card shadow h-100">
        <div class="card-header bg-primary text-white">
          <h5 class="mb-0"><i class="fas fa-user-plus"></i> Добавить студента</h5>
        </div>
        <div class="card-body">
          <form action="students" method="post">
            <input type="hidden" name="action" value="addStudent">
            <div class="mb-3">
              <label>ФИО студента</label>
              <input type="text" name="fullName" class="form-control"
                     placeholder="Иванов Иван Иванович" required>
            </div>
            <div class="mb-3">
              <label>Группа</label>
              <select name="groupId" class="form-select" required>
                <option value="">— выберите группу —</option>
                <c:forEach var="g" items="${groups}">
                  <option value="${g.id}">${g.groupNumber}</option>
                </c:forEach>
              </select>
            </div>
            <button type="submit" class="btn btn-primary w-100">
              <i class="fas fa-save"></i> Сохранить
            </button>
          </form>
        </div>
      </div>
    </div>

    <!-- Форма добавления группы -->
    <div class="col-md-6">
      <div class="card shadow h-100">
        <div class="card-header bg-success text-white">
          <h5 class="mb-0"><i class="fas fa-users"></i> Добавить группу</h5>
        </div>
        <div class="card-body">

          <!-- Сообщение об ошибке -->
          <c:if test="${not empty sessionScope.groupError}">
            <div class="alert alert-danger">
              <i class="fas fa-exclamation-circle"></i> ${sessionScope.groupError}
            </div>
            <% session.removeAttribute("groupError"); %>
          </c:if>

          <!-- Сообщение об успехе -->
          <c:if test="${not empty sessionScope.groupSuccess}">
            <div class="alert alert-success">
              <i class="fas fa-check-circle"></i> ${sessionScope.groupSuccess}
            </div>
            <% session.removeAttribute("groupSuccess"); %>
          </c:if>

          <form action="students" method="post">
            <input type="hidden" name="action" value="addGroup">
            <div class="mb-3">
              <label>Номер группы</label>
              <input type="text" name="groupNumber" class="form-control"
                     placeholder="ИВБО-35"
                     pattern="[А-ЯA-ZА-Яа-яa-z]{4}-\d{2}"
                     title="Формат: 4 буквы, дефис, 2 цифры. Например: ИВБО-35"
                     required>
            </div>
            <button type="submit" class="btn btn-success w-100">
              <i class="fas fa-save"></i> Сохранить
            </button>
          </form>

          <!-- Список групп -->
          <hr>
          <h6 class="mb-2">Существующие группы:</h6>
          <table class="table table-sm table-bordered text-center">
            <thead class="table-success">
            <tr><th>ID</th><th>Группа</th><th>Действие</th></tr>
            </thead>
            <tbody>
            <c:forEach var="g" items="${groups}">
              <tr>
                <td>${g.id}</td>
                <td><strong>${g.groupNumber}</strong></td>
                <td>
                  <form action="students" method="post" style="margin:0">
                    <input type="hidden" name="action" value="deleteGroup">
                    <input type="hidden" name="id" value="${g.id}">
                    <button type="submit" class="btn btn-danger btn-sm"
                            onclick="return confirm('Удалить группу? Это может повлиять на студентов этой группы!')">
                      <i class="fas fa-trash"></i>
                    </button>
                  </form>
                </td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <!-- Таблица студентов -->
  <h4 class="text-center mb-3">Список студентов</h4>
  <table class="table table-bordered table-hover bg-white shadow rounded">
    <thead class="table-primary text-center">
    <tr>
      <th>ID</th>
      <th>ФИО студента</th>
      <th>Группа</th>
      <th>Действие</th>
    </tr>
    </thead>
    <tbody class="text-center">
    <c:forEach var="s" items="${students}">
      <tr>
        <td>${s.id}</td>
        <td><strong>${s.fullName}</strong></td>
        <td>${s.groupNumber}</td>
        <td>
          <form action="students" method="post" style="margin:0">
            <input type="hidden" name="action" value="deleteStudent">
            <input type="hidden" name="id" value="${s.id}">
            <button type="submit" class="btn btn-danger btn-sm"
                    onclick="return confirm('Удалить студента?')">
              <i class="fas fa-trash"></i> Удалить
            </button>
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