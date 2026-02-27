<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav style="
  background: linear-gradient(90deg, #1a1a2e, #16213e);
  padding: 0 40px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 60px;
  box-shadow: 0 2px 12px rgba(0,0,0,0.4);
  position: sticky;
  top: 0;
  z-index: 100;
">
  <span style="color:white;font-size:16px;font-weight:600;letter-spacing:0.5px;">
    🎓 TestTracker
  </span>

    <div style="display:flex;gap:6px;">
        <a href="index.jsp" style="color:rgba(255,255,255,0.8);text-decoration:none;padding:8px 12px;border-radius:8px;font-size:14px;font-family:Arial"
           onmouseover="this.style.background='rgba(255,255,255,0.12)'"
           onmouseout="this.style.background='transparent'">Главная</a>

        <a href="add" style="color:rgba(255,255,255,0.8);text-decoration:none;padding:8px 12px;border-radius:8px;font-size:14px;font-family:Arial"
           onmouseover="this.style.background='rgba(255,255,255,0.12)'"
           onmouseout="this.style.background='transparent'">Добавить</a>

        <a href="list" style="color:rgba(255,255,255,0.8);text-decoration:none;padding:8px 12px;border-radius:8px;font-size:14px;font-family:Arial"
           onmouseover="this.style.background='rgba(255,255,255,0.12)'"
           onmouseout="this.style.background='transparent'">Список</a>

        <a href="search" style="color:rgba(255,255,255,0.8);text-decoration:none;padding:8px 12px;border-radius:8px;font-size:14px;font-family:Arial"
           onmouseover="this.style.background='rgba(255,255,255,0.12)'"
           onmouseout="this.style.background='transparent'">Поиск</a>

        <a href="filter-subject" style="color:rgba(255,255,255,0.8);text-decoration:none;padding:8px 12px;border-radius:8px;font-size:14px;font-family:Arial"
           onmouseover="this.style.background='rgba(255,255,255,0.12)'"
           onmouseout="this.style.background='transparent'">По предмету</a>

        <a href="filter-group" style="color:rgba(255,255,255,0.8);text-decoration:none;padding:8px 12px;border-radius:8px;font-size:14px;font-family:Arial"
           onmouseover="this.style.background='rgba(255,255,255,0.12)'"
           onmouseout="this.style.background='transparent'">По группе</a>

        <a href="students" style="color:rgba(255,255,255,0.8);text-decoration:none;padding:8px 12px;border-radius:8px;font-size:14px;font-family:Arial"
           onmouseover="this.style.background='rgba(255,255,255,0.12)'"
           onmouseout="this.style.background='transparent'">Студенты</a>

        <a href="stats" style="color:white;text-decoration:none;padding:8px 14px;border-radius:8px;font-size:14px;font-family:Arial;background:#007bff;"
           onmouseover="this.style.background='#0056b3'"
           onmouseout="this.style.background='#007bff'">Статистика</a>
    </div>
</nav>