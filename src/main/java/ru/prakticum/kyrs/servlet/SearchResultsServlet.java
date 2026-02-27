package ru.praktikum.kyrs.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ru.praktikum.kyrs.dao.TestResultDAO;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/search")
public class SearchResultsServlet extends HttpServlet {

    private final TestResultDAO dao = new TestResultDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String namePart = req.getParameter("namePart");
        var results = new ArrayList<>();
        if (namePart != null && namePart.trim().length() >= 3) {
            results.addAll(dao.searchByStudentName(namePart.trim()));
        }
        req.setAttribute("results", results);
        req.getRequestDispatcher("/search.jsp").forward(req, resp);
    }
}