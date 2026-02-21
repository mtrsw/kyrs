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
    <span style="color: white; font-size: 16px; font-weight: 600; letter-spacing: 0.5px; opacity: 0.9;">
        🎓 TestTracker
    </span>

    <div style="display: flex; gap: 8px;">
        <a href="index.jsp" style="
            color: rgba(255,255,255,0.8);
            text-decoration: none;
            padding: 8px 18px;
            border-radius: 8px;
            font-size: 15px;
            transition: background 0.2s;
            font-family: 'Segoe UI', Arial, sans-serif;
        " onmouseover="this.style.background='rgba(255,255,255,0.12)'; this.style.color='white'"
           onmouseout="this.style.background='transparent'; this.style.color='rgba(255,255,255,0.8)'">
            Главная
        </a>
        <a href="add.jsp" style="
            color: rgba(255,255,255,0.8);
            text-decoration: none;
            padding: 8px 18px;
            border-radius: 8px;
            font-size: 15px;
            font-family: 'Segoe UI', Arial, sans-serif;
        " onmouseover="this.style.background='rgba(255,255,255,0.12)'; this.style.color='white'"
           onmouseout="this.style.background='transparent'; this.style.color='rgba(255,255,255,0.8)'">
            Добавить
        </a>
        <a href="list" style="
            color: rgba(255,255,255,0.8);
            text-decoration: none;
            padding: 8px 18px;
            border-radius: 8px;
            font-size: 15px;
            font-family: 'Segoe UI', Arial, sans-serif;
        " onmouseover="this.style.background='rgba(255,255,255,0.12)'; this.style.color='white'"
           onmouseout="this.style.background='transparent'; this.style.color='rgba(255,255,255,0.8)'">
            Список
        </a>
        <a href="search.jsp" style="
            color: white;
            text-decoration: none;
            padding: 8px 18px;
            border-radius: 8px;
            font-size: 15px;
            background: #007bff;
            font-family: 'Segoe UI', Arial, sans-serif;
        " onmouseover="this.style.background='#0056b3'"
           onmouseout="this.style.background='#007bff'">
            Поиск
        </a>
    </div>
</nav>