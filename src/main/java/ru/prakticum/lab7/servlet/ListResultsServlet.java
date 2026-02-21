package ru.praktikum.lab7.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ru.praktikum.lab7.dao.TestResultDAO;
import ru.praktikum.lab7.model.TestResult;

import java.io.IOException;
import java.util.List;

@WebServlet("/list")
public class ListResultsServlet extends HttpServlet {

    private final TestResultDAO dao = new TestResultDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<TestResult> results = dao.getAllTestResults();

        req.setAttribute("results", results);
        req.getRequestDispatcher("/list.jsp").forward(req, resp);
    }
}