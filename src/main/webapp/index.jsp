<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>TestTracker</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
</head>
<body style="background:linear-gradient(135deg,#f8f9fa,#e9ecef)">
<%@ include file="navbar.jsp" %>
<div class="py-5 text-center text-white" style="background:linear-gradient(135deg,#0d6efd,#6610f2)">
    <div class="container">
        <h1 class="display-4 fw-bold">Система учёта результатов тестирования</h1>
        <p class="lead">Курсовая работа • Java EE 10 + MySQL</p>
    </div>
</div>
<div class="container py-5">
    <div class="row g-4 text-center">
        <div class="col-md-4">
            <div class="card h-100 shadow">
                <div class="card-body">
                    <i class="fas fa-plus-circle fa-3x text-primary mb-3"></i>
                    <h5>Добавить</h5>
                    <a href="add" class="btn btn-primary mt-2">Перейти</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card h-100 shadow">
                <div class="card-body">
                    <i class="fas fa-table fa-3x text-primary mb-3"></i>
                    <h5>Список</h5>
                    <a href="list" class="btn btn-primary mt-2">Перейти</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card h-100 shadow">
                <div class="card-body">
                    <i class="fas fa-search fa-3x text-primary mb-3"></i>
                    <h5>Поиск</h5>
                    <a href="search" class="btn btn-primary mt-2">Перейти</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card h-100 shadow">
                <div class="card-body">
                    <i class="fas fa-book fa-3x text-success mb-3"></i>
                    <h5>По предмету</h5>
                    <a href="filter-subject" class="btn btn-success mt-2">Перейти</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card h-100 shadow">
                <div class="card-body">
                    <i class="fas fa-users fa-3x text-warning mb-3"></i>
                    <h5>По группе</h5>
                    <a href="filter-group" class="btn btn-warning mt-2">Перейти</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card h-100 shadow">
                <div class="card-body">
                    <i class="fas fa-chart-bar fa-3x text-danger mb-3"></i>
                    <h5>Статистика</h5>
                    <a href="stats" class="btn btn-danger mt-2">Перейти</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>