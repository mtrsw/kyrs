package ru.praktikum.kyrs.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ru.praktikum.kyrs.dao.TestResultDAO;

import java.io.IOException;

@WebServlet("/students")
public class StudentServlet extends HttpServlet {

    private final TestResultDAO dao = new TestResultDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("students", dao.getAllStudents());
        req.setAttribute("groups", dao.getAllGroups());
        req.getRequestDispatcher("/students.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if ("addStudent".equals(action)) {
            String fullName = req.getParameter("fullName");
            int groupId = Integer.parseInt(req.getParameter("groupId"));
            dao.addStudent(fullName, groupId);

        } else if ("deleteStudent".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            dao.deleteStudent(id);

        } else if ("addGroup".equals(action)) {
            String groupNumber = req.getParameter("groupNumber");
            // Валидация формата: 4 буквы - 2 цифры (например ИИИИ-35)
            if (groupNumber != null && groupNumber.matches("[А-ЯA-Z]{4}-\\d{2}")) {
                dao.addGroup(groupNumber);
                req.getSession().setAttribute("groupSuccess", "Группа " + groupNumber + " добавлена!");
            } else {
                req.getSession().setAttribute("groupError", "Неверный формат! Используйте: ХХХХ-ХХ (4 буквы, дефис, 2 цифры). Например: ИВБО-35");
            }

        } else if ("deleteGroup".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            dao.deleteGroup(id);
        }

        resp.sendRedirect("students");
    }
}