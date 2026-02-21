<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>kyrs - Учёт результатов тестирования</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <style>body { background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); }</style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="py-5 text-center text-white" style="background: linear-gradient(135deg, #0d6efd, #6610f2);">
    <div class="container">
        <h1 class="display-4 fw-bold">Система учёта результатов тестирования</h1>
        <p class="lead">Курсовая работа • Java EE 10 + MySQL</p>

    </div>
</div>
<div class="container py-5">
    <div class="row g-4 text-center">
        <div class="col-md-4"><div class="card h-100 shadow"><div class="card-body"><i class="fas fa-plus-circle fa-3x text-primary mb-3"></i><h5>Добавить</h5><a href="add.jsp" class="btn btn-primary mt-2">Перейти</a></div></div></div>
        <div class="col-md-4"><div class="card h-100 shadow"><div class="card-body"><i class="fas fa-table fa-3x text-primary mb-3"></i><h5>Список</h5><a href="list" class="btn btn-primary mt-2">Перейти</a></div></div></div>
        <div class="col-md-4"><div class="card h-100 shadow"><div class="card-body"><i class="fas fa-search fa-3x text-primary mb-3"></i><h5>Поиск</h5><a href="search" class="btn btn-primary mt-2">Перейти</a></div></div></div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>