<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Добавить — kyrs</title>
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
                        <div class="mb-3"><label>ФИО студента</label><input type="text" name="studentName" class="form-control" required></div>
                        <div class="row">
                            <div class="col-md-6 mb-3"><label>Группа</label><input type="text" name="groupNumber" class="form-control" required></div>
                            <div class="col-md-6 mb-3"><label>Предмет</label><input type="text" name="subject" class="form-control" required></div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3"><label>Балл (0-100)</label><input type="number" name="score" min="0" max="100" class="form-control" required></div>
                            <div class="col-md-6 mb-3"><label>Дата</label><input type="date" name="testDate" class="form-control" required></div>
                        </div>
                        <button type="submit" class="btn btn-success w-100"><i class="fas fa-save"></i> Сохранить</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>