package ru.praktikum.kyrs.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ru.praktikum.kyrs.dao.TestResultDAO;

import java.io.IOException;

@WebServlet("/filter-subject")
public class FilterBySubjectServlet extends HttpServlet {

    private final TestResultDAO dao = new TestResultDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("subjects", dao.getAllSubjects());

        String subjectIdParam = req.getParameter("subjectId");
        if (subjectIdParam != null && !subjectIdParam.isEmpty()) {
            int subjectId = Integer.parseInt(subjectIdParam);
            req.setAttribute("results", dao.getBySubject(subjectId));
            req.setAttribute("selectedSubject", subjectId);
        }
        req.getRequestDispatcher("/filter-subject.jsp").forward(req, resp);
    }
}