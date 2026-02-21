package ru.praktikum.lab7.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ru.praktikum.lab7.dao.TestResultDAO;
import ru.praktikum.lab7.model.TestResult;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/search")
public class SearchResultsServlet extends HttpServlet {

    private final TestResultDAO dao = new TestResultDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String namePart = req.getParameter("namePart");

        List<TestResult> results = new ArrayList<>();

        // ←←← Вот главное изменение
        if (namePart != null && namePart.trim().length() >= 3) {
            results = dao.getTestResultsByStudent(namePart.trim());
        }

        req.setAttribute("results", results);
        req.setAttribute("searchQuery", namePart); // для сообщения
        req.getRequestDispatcher("/search.jsp").forward(req, resp);
    }
}